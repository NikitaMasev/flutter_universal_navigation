import 'package:flutter/material.dart';
import 'package:universal_navigation/navigation/models/navigation_data/base_navigation_arguments.dart';
import 'package:universal_navigation/navigation/models/navigation_type_events.dart';

class NavigationTabArguments extends BaseNavigationArguments {
  final String routeName;
  final bool isFullscreenNavigation;

  NavigationTabArguments({
    @required this.routeName,
    @required this.isFullscreenNavigation,
    @required NavigationTypeEvent navigationTypeEvent,
  }) : super(navigationTypeEvent);
}
