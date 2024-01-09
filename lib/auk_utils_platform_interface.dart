import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'auk_utils_method_channel.dart';

abstract class AukUtilsPlatform extends PlatformInterface {
  /// Constructs a AukUtilsPlatform.
  AukUtilsPlatform() : super(token: _token);

  static final Object _token = Object();

  static AukUtilsPlatform _instance = MethodChannelAukUtils();

  /// The default instance of [AukUtilsPlatform] to use.
  ///
  /// Defaults to [MethodChannelAukUtils].
  static AukUtilsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AukUtilsPlatform] when
  /// they register themselves.
  static set instance(AukUtilsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getMacAddress() {
    throw UnimplementedError('getMacAddress() has not been implemented.');
  }
}
