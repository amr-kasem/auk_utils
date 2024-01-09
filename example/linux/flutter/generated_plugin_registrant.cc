//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <auk_utils/auk_utils_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) auk_utils_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "AukUtilsPlugin");
  auk_utils_plugin_register_with_registrar(auk_utils_registrar);
}
