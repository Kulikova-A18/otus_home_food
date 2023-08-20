import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'plugin_windows_method_channel.dart';

abstract class PluginWindowsPlatform extends PlatformInterface {
  /// Constructs a PluginWindowsPlatform.
  PluginWindowsPlatform() : super(token: _token);

  static final Object _token = Object();

  static PluginWindowsPlatform _instance = MethodChannelPluginWindows();

  /// The default instance of [PluginWindowsPlatform] to use.
  ///
  /// Defaults to [MethodChannelPluginWindows].
  static PluginWindowsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PluginWindowsPlatform] when
  /// they register themselves.
  static set instance(PluginWindowsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
