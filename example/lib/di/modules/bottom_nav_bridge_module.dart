import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_navigation/navigation/models/navigation_flow_data/tabflow.dart';
import 'package:universal_navigation/navigation/models/navigation_keys/bottom_nav_key.dart';
import 'package:universal_navigation_example/di/injection.dart';
import 'package:universal_navigation_example/pages/default_bottom_nav_bridge.dart';

@module
abstract class BottomNavBridgeModule {
  DefaultBottomNavBridge get getDefaultBottomNavBridge =>
      DefaultBottomNavBridge(
          bottomNavKey: getIt<BottomNavKey>(),
          tabFlows: getIt<List<TabFlow>>(),
          backgroundColor: Colors.white,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey);
}
