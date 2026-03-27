import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'auk_utils_platform_interface.dart';

class AukUtils {
  Future<String?> getPlatformVersion() {
    return AukUtilsPlatform.instance.getPlatformVersion();
  }

  Future<String?> getMacAddress() async {
    final mac = await AukUtilsPlatform.instance.getMacAddress();
    if (mac != null && mac.isNotEmpty) return mac;
    return _macFromMachineId();
  }

  Future<String?> _macFromMachineId() async {
    try {
      final plugin = DeviceInfoPlugin();
      String? machineId;

      if (Platform.isAndroid) {
        machineId = (await plugin.androidInfo).id;
      } else if (Platform.isIOS) {
        machineId = (await plugin.iosInfo).identifierForVendor;
      } else if (Platform.isLinux) {
        machineId = (await plugin.linuxInfo).machineId;
      } else if (Platform.isMacOS) {
        machineId = (await plugin.macOsInfo).systemGUID;
      } else if (Platform.isWindows) {
        machineId = (await plugin.windowsInfo).deviceId;
      }

      if (machineId == null || machineId.isEmpty) return null;

      final hash = md5.convert(utf8.encode(machineId)).bytes;
      // Set locally administered bit, clear multicast bit
      final b = List<int>.from(hash.take(6));
      b[0] = (b[0] | 0x02) & 0xFE;
      return b.map((e) => e.toRadixString(16).padLeft(2, '0').toUpperCase()).join(':');
    } catch (_) {
      return null;
    }
  }
}
