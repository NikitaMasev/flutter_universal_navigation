import 'package:injectable/injectable.dart';
import 'package:universal_navigation/universal_navigation.dart';
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
