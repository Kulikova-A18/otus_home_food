import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_windows/plugin_windows.dart';
import 'package:plugin_windows/plugin_windows_platform_interface.dart';
import 'package:plugin_windows/plugin_windows_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPluginWindowsPlatform
    with MockPlatformInterfaceMixin
    implements PluginWindowsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PluginWindowsPlatform initialPlatform = PluginWindowsPlatform.instance;

  test('$MethodChannelPluginWindows is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPluginWindows>());
  });

  test('getPlatformVersion', () async {
    PluginWindows pluginWindowsPlugin = PluginWindows();
    MockPluginWindowsPlatform fakePlatform = MockPluginWindowsPlatform();
    PluginWindowsPlatform.instance = fakePlatform;

    expect(await pluginWindowsPlugin.getPlatformVersion(), '42');
  });
}
