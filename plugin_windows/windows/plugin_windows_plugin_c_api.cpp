#include "include/plugin_windows/plugin_windows_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "plugin_windows_plugin.h"

void PluginWindowsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  plugin_windows::PluginWindowsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
