import 'package:injectable/injectable.dart';
import 'package:universal_navigation/navigation/bottom_navigation_page.dart';
import 'package:universal_navigation/navigation/models/navigation_flow_data/globalflows.dart';
import 'package:universal_navigation_example/di/injection.dart';
import 'package:universal_navigation_example/pages/login_page.dart';
import 'package:universal_navigation_example/pages/start_page.dart';
import 'package:universal_navigation_example/pages/tab_pages/nested_tab_page.dart';

@module
abstract class GlobalFlowsModule {
  @singleton
  GlobalFlows get getGlobalFlows => GlobalFlows({
    StartPage.routeName: (ctx) => getIt<StartPage>(),
    LoginPage.routeName: (ctx) => getIt<LoginPage>(),
    BottomNavigationPage.routeName: (ctx) => getIt<BottomNavigationPage>(),
    NestedTabPage.routeName: (ctx) => getIt<NestedTabPage>(),
  });
}