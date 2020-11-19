//
//  Generated file. Do not edit.
//

#include "generated_plugin_registrant.h"

#include <universal_navigation/universal_navigation_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) universal_navigation_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "UniversalNavigationPlugin");
  universal_navigation_plugin_register_with_registrar(universal_navigation_registrar);
}
