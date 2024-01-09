import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'auk_utils_platform_interface.dart';

/// An implementation of [AukUtilsPlatform] that uses method channels.
class MethodChannelAukUtils extends AukUtilsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('auk_utils');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getMacAddress() async {
    final version = await methodChannel.invokeMethod<String>('getMacAddress');
    return version;
  }
}
