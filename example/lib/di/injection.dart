import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_navigation/di/u_nav_configurator.dart';
import 'package:universal_navigation/navigation/bottom_navigation_page.dart';
import 'package:universal_navigation/navigation/core/bottom_navigation_builder.dart';
import 'package:universal_navigation/navigation/core/tab_change_listener.dart';
import 'package:universal_navigation_example/di/injection.config.dart';
import 'package:universal_navigation_example/event_union.dart';

final getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  initUNavInjection<EventUnion>(getIt, env);
  $initGetIt(getIt, environment: env);
  initUNavAppNavigatorInjection(getIt, env);
  _initBottomNavigationInjection(getIt, env);
}

GetIt _initBottomNavigationInjection(GetIt get, String env) {
  get.registerSingleton<BottomNavigationPage>(BottomNavigationPage(
    get<TabChangeListener>(),
    get<BottomNavigationBuilder>()
  ));
  return get;
}
