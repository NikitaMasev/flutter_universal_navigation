import 'package:flutter/material.dart';
import 'package:universal_navigation/navigation/models/navigation_data/base_navigation_arguments.dart';
import 'package:universal_navigation/navigation/models/navigation_type_events.dart';

class NavigationArguments extends BaseNavigationArguments {
  final String routeName;
  final int tabIndex;
  final int deleteRouteTabIndex;

  NavigationArguments({
    @required this.routeName,
    @required this.tabIndex,
    @required this.deleteRouteTabIndex,
    @required NavigationTypeEvent navigationTypeEvent,
  }) : super(navigationTypeEvent);
}
