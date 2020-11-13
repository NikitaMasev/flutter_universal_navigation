import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_navigation/navigation/models/navigation_flow_data/tabflow.dart';
import 'package:universal_navigation_example/di/injection.dart';
import 'package:universal_navigation_example/pages/tab_pages/first_tab_page.dart';
import 'package:universal_navigation_example/pages/tab_pages/second_tab_page.dart';
import 'package:universal_navigation_example/pages/tab_pages/third_tab_page.dart';

@module
abstract class TabFlowsModule {
  @singleton
  List<TabFlow> get getTabFlows => [
        TabFlow(
            page: getIt<FirstTabPage>(),
            navigatorKey: GlobalKey<NavigatorState>(),
            iconData: Icons.mail,
            title: '1'),
        TabFlow(
            page: getIt<SecondTabPage>(),
            navigatorKey: GlobalKey<NavigatorState>(),
            iconData: Icons.announcement,
            title: '2'),
        TabFlow(
            page: getIt<ThirdTabPage>(),
            navigatorKey: GlobalKey<NavigatorState>(),
            iconData: Icons.person,
            title: '3'),
      ];
}
