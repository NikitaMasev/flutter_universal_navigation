// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:universal_navigation/universal_navigation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'modules/bottom_nav_bridge_module.dart';
import '../event_union.dart';
import '../pages/tab_pages/first_tab_page.dart';
import 'modules/global_flows_module.dart';
import '../pages/login_page.dart';
import '../pages/tab_pages/nested_tab_page.dart';
import '../pages/tab_pages/second_tab_page.dart';
import '../pages/start_page.dart';
import 'modules/tab_flows_module.dart';
import '../pages/tab_pages/third_tab_page.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final bottomNavBridgeModule = _$BottomNavBridgeModule();
  final globalFlowsModule = _$GlobalFlowsModule();
  final tabFlowsModule = _$TabFlowsModule();
  gh.factory<BottomNavigationBuilder>(
      () => bottomNavBridgeModule.getDefaultBottomNavBridge);
  gh.factory<FirstTabPage>(
      () => FirstTabPage(get<NavigationController<EventUnion>>()));
  gh.factory<LoginPage>(
      () => LoginPage(get<NavigationController<EventUnion>>()));
  gh.factory<NestedTabPage>(() => NestedTabPage());
  gh.factory<SecondTabPage>(() => SecondTabPage());
  gh.factory<StartPage>(
      () => StartPage(get<NavigationController<EventUnion>>()));
  gh.factory<ThirdTabPage>(() => ThirdTabPage());

  // Eager singletons must be registered in the right order
  gh.singleton<GlobalFlows>(globalFlowsModule.getGlobalFlows);
  gh.singleton<List<TabFlow>>(tabFlowsModule.getTabFlows);
  return get;
}

class _$BottomNavBridgeModule extends BottomNavBridgeModule {}

class _$GlobalFlowsModule extends GlobalFlowsModule {}

class _$TabFlowsModule extends TabFlowsModule {}
