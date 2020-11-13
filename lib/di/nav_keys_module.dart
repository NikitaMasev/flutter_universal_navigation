import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_navigation/navigation/models/navigation_keys/bottom_nav_key.dart';
import 'package:universal_navigation/navigation/models/navigation_keys/global_nav_key.dart';

@module
abstract class NavKeysModule {
  @singleton
  BottomNavKey get getBottomNavKey => BottomNavKey(GlobalKey<NavigatorState>());

  @singleton
  GlobalNavKey get getGlobalNavKey => GlobalNavKey(GlobalKey<NavigatorState>());
}