#include "include/auk_utils/auk_utils_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "auk_utils_plugin.h"

void AukUtilsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  auk_utils::AukUtilsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
