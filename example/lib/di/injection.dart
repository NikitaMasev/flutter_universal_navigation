import 'package:injectable/injectable.dart';
import 'package:universal_navigation/di/u_nav_configurator.dart';
import 'package:universal_navigation/navigation/bottom_navigation_page.dart';
import 'package:universal_navigation/navigation/core/bottom_navigation_builder.dart';
import 'package:universal_navigation/navigation/core/tab_change_listener.dart';
import 'package:universal_navigation_example/di/injection.config.dart';
import 'package:universal_navigation_example/event_union.dart';

@injectableInit
void configureInjection(String env) {
  initUNavInjection<EventUnion>(env);
  $initGetIt(getIt, environment: env);
  initUNavAppNavigatorInjection(env);
  _initBottomNavigationInjection(env);
}

void _initBottomNavigationInjection(String env) {
  getIt.registerSingleton<BottomNavigationPage>(BottomNavigationPage(
      getIt<TabChangeListener>(), getIt<BottomNavigationBuilder>()));
}
