#ifndef FLUTTER_PLUGIN_PLUGIN_WINDOWS_PLUGIN_H_
#define FLUTTER_PLUGIN_PLUGIN_WINDOWS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace plugin_windows {

class PluginWindowsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PluginWindowsPlugin();

  virtual ~PluginWindowsPlugin();

  // Disallow copy and assign.
  PluginWindowsPlugin(const PluginWindowsPlugin&) = delete;
  PluginWindowsPlugin& operator=(const PluginWindowsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace plugin_windows

#endif  // FLUTTER_PLUGIN_PLUGIN_WINDOWS_PLUGIN_H_
