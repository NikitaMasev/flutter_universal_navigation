import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_navigation_example/pages/default_bottom_nav_bridge.dart';
import 'package:universal_navigation/universal_navigation.dart';

@module
abstract class BottomNavBridgeModule {
  BottomNavigationBuilder get getDefaultBottomNavBridge =>
      DefaultBottomNavBridge(
          bottomNavKey: getIt<BottomNavKey>(),
          tabFlows: getIt<List<TabFlow>>(),
          backgroundColor: Colors.white,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey);
}
