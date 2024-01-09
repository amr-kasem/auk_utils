import 'package:flutter_test/flutter_test.dart';
import 'package:auk_utils/auk_utils.dart';
import 'package:auk_utils/auk_utils_platform_interface.dart';
import 'package:auk_utils/auk_utils_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAukUtilsPlatform
    with MockPlatformInterfaceMixin
    implements AukUtilsPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getMacAddress() {
    // TODO: implement getMacAddress
    throw UnimplementedError();
  }
}

void main() {
  final AukUtilsPlatform initialPlatform = AukUtilsPlatform.instance;

  test('$MethodChannelAukUtils is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAukUtils>());
  });

  test('getPlatformVersion', () async {
    AukUtils aukUtilsPlugin = AukUtils();
    MockAukUtilsPlatform fakePlatform = MockAukUtilsPlatform();
    AukUtilsPlatform.instance = fakePlatform;

    expect(await aukUtilsPlugin.getPlatformVersion(), '42');
  });
}
