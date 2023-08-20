import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_windows_platform_interface.dart';

/// An implementation of [PluginWindowsPlatform] that uses method channels.
class MethodChannelPluginWindows extends PluginWindowsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugin_windows');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
