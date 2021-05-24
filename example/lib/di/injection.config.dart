// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:universal_navigation/universal_navigation.dart' as _i3;

import '../events.dart' as _i6;
import '../pages/default_bottom_nav_bridge.dart' as _i4;
import '../pages/login_page.dart' as _i7;
import '../pages/start_page.dart' as _i10;
import '../pages/tab_pages/first_tab_page.dart' as _i5;
import '../pages/tab_pages/nested_tab_page.dart' as _i8;
import '../pages/tab_pages/second_tab_page.dart' as _i9;
import '../pages/tab_pages/third_tab_page.dart' as _i11;
import 'modules/bottom_nav_bridge_module.dart' as _i12;
import 'modules/global_flows_module.dart' as _i13;
import 'modules/tab_flows_module.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final bottomNavBridgeModule = _$BottomNavBridgeModule();
  final globalFlowsModule = _$GlobalFlowsModule();
  final tabFlowsModule = _$TabFlowsModule();
  gh.factory<_i3.BottomNavigationBuilder>(
      () => bottomNavBridgeModule.getBottomNavigationBuilder);
  gh.lazySingleton<_i4.DefaultBottomNavBridge>(
      () => bottomNavBridgeModule.getDefaultBottomNavBridge);
  gh.factory<_i5.FirstTabPage>(
      () => _i5.FirstTabPage(get<_i3.NavigationController<_i6.EventData>>()));
  gh.factory<_i7.LoginPage>(
      () => _i7.LoginPage(get<_i3.NavigationController<_i6.EventData>>()));
  gh.factory<_i8.NestedTabPage>(() => _i8.NestedTabPage());
  gh.factory<_i9.SecondTabPage>(() => _i9.SecondTabPage());
  gh.factory<_i10.StartPage>(
      () => _i10.StartPage(get<_i3.NavigationController<_i6.EventData>>()));
  gh.factory<_i3.TabChanger>(() => bottomNavBridgeModule.getTabChanger);
  gh.factory<_i11.ThirdTabPage>(() => _i11.ThirdTabPage());
  gh.singleton<_i3.GlobalFlows>(globalFlowsModule.getGlobalFlows);
  gh.singleton<List<_i3.TabFlow>>(tabFlowsModule.getTabFlows);
  return get;
}

class _$BottomNavBridgeModule extends _i12.BottomNavBridgeModule {}

class _$GlobalFlowsModule extends _i13.GlobalFlowsModule {}

class _$TabFlowsModule extends _i14.TabFlowsModule {}
