
import 'plugin_windows_platform_interface.dart';

class PluginWindows {
  Future<String?> getPlatformVersion() {
    return PluginWindowsPlatform.instance.getPlatformVersion();
  }
}
