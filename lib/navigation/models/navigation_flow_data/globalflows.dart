import 'package:flutter/material.dart';

///Contain bundle between id's page and WidgetBuilder function.
///It's must contain following thing:
/// - Global page, that shouldn't be presented with bottom navigation bar;
/// - [BottomNavigationPage], that already included inside lib, but we also must initialized it's dependencies;
/// - Nested page, that should be presented with bottom navigation bar, but are not the root of bottom bar items;
class GlobalFlows {
  final Map<String, WidgetBuilder> flows;

  GlobalFlows(this.flows);
}
