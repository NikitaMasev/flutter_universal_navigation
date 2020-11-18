import 'package:flutter/material.dart';
import 'package:universal_navigation/navigation/models/navigation_data/base_navigation_arguments.dart';
import 'package:universal_navigation/navigation/models/navigation_type_events.dart';

///For throwing only tab nested navigation events from [NavigationControllerEvents] to [AppNavigator].
class NavigationTabArguments extends BaseNavigationArguments {
  final String routeName;
  final bool isFullscreenNavigation;

  NavigationTabArguments({
    @required this.routeName,
    @required this.isFullscreenNavigation,
    @required NavigationTypeEvent navigationTypeEvent,
  }) : super(navigationTypeEvent);
}
