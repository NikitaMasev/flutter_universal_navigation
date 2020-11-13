import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_navigation/di/u_nav_configurator.dart';
import 'package:universal_navigation/navigation/bottom_navigation_page.dart';
import 'package:universal_navigation/navigation/core/tab_change_listener.dart';
import 'package:universal_navigation_example/di/injection.config.dart';
import 'package:universal_navigation_example/events.dart';
import 'package:universal_navigation_example/pages/default_bottom_nav_bridge.dart';

final getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  initUNavInjection<TypeEvent>(getIt, env);
  $initGetIt(getIt, environment: env);
  initUNavAppNavigatorInjection(getIt, env);
  _initBottomNavigationInjection(getIt, env);
}

GetIt _initBottomNavigationInjection(GetIt get, String env) {
  get.registerSingleton<BottomNavigationPage>(BottomNavigationPage(
    get<TabChangeListener>(),
    get<DefaultBottomNavBridge>()
  ));
  return get;
}
