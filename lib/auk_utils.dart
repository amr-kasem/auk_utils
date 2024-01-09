import 'auk_utils_platform_interface.dart';

class AukUtils {
  Future<String?> getPlatformVersion() {
    return AukUtilsPlatform.instance.getPlatformVersion();
  }

  Future<String?> getMacAddress() {
    return AukUtilsPlatform.instance.getMacAddress();
  }
}
