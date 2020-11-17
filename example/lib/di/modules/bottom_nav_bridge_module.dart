import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_navigation/di/u_nav_configurator.dart';
import 'package:universal_navigation/navigation/core/bottom_navigation_builder.dart';
import 'package:universal_navigation/navigation/models/navigation_flow_data/tabflow.dart';
import 'package:universal_navigation/navigation/models/navigation_keys/bottom_nav_key.dart';
import 'package:universal_navigation_example/pages/default_bottom_nav_bridge.dart';

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
