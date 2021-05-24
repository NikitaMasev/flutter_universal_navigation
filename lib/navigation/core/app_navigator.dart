import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_navigation/navigation/bottom_navigation_page.dart';
import 'package:universal_navigation/navigation/core/navigation_controller_events.dart';
import 'package:universal_navigation/navigation/core/navigation_events.dart';
import 'package:universal_navigation/navigation/core/tab_change_listener.dart';
import 'package:universal_navigation/navigation/core/tab_changer.dart';
import 'package:universal_navigation/navigation/models/navigation_data/navigation_arguments.dart';
import 'package:universal_navigation/navigation/models/navigation_data/navigation_tab_arguments.dart';
import 'package:universal_navigation/navigation/models/navigation_flow_data/globalflows.dart';
import 'package:universal_navigation/navigation/models/navigation_flow_data/tabflow.dart';
import 'package:universal_navigation/navigation/models/navigation_keys/bottom_nav_key.dart';
import 'package:universal_navigation/navigation/models/navigation_keys/global_nav_key.dart';
import 'package:universal_navigation/navigation/models/navigation_type_events.dart';

///The core of universal navigation library.
///Served for listening navigation events from [NavigationControllerEvents] and navigating to page with [BottomNavigationPage] or without it.
///Implement [TabChangeListener] for listening about changing root of bottom navigation bar item.
class AppNavigator implements TabChangeListener {
  final List<TabFlow> _tabFlows;
  final GlobalFlows _globalFlows;
  final GlobalNavKey _globalNavKey;
  final NavigationEvents _navigationEvents;
  final TabChanger _tabChanger;
  late TabFlow _currentTab;

  AppNavigator(
    this._tabFlows,
    this._globalFlows,
    this._globalNavKey,
    this._navigationEvents,
    this._tabChanger,
  ) {
    _navigationEvents
        .getGlobalNavigationEvents()
        .listen(_eventGlobalNavigation);
    _navigationEvents
        .getTabNestedNavigationEvents()
        .listen(_eventTabNestedNavigation);
  }

  ///Listen global(without [BottomNavigationPage]) navigation events and defining type of navigation event.
  ///Also catching one tab event with [BottomNavigationPage] - navigate to tab.
  void _eventGlobalNavigation(NavigationArguments navigationArguments) {
    switch (navigationArguments.navigationTypeEvent) {
      case NavigationTypeEvent.PUSH:
        _eventPushGlobalNavigation(navigationArguments.routeName!);
        break;
      case NavigationTypeEvent.PUSH_REPLACEMENT:
        _eventPushReplacementGlobalNavigation(navigationArguments.routeName!);
        break;
      case NavigationTypeEvent.POP:
        _eventPopGlobalNavigation();
        break;
      case NavigationTypeEvent.NAVIGATE_TO_TAB:
        _eventNavigateToTab(navigationArguments.tabIndex!,
            navigationArguments.deleteRouteTabIndex);
        break;
    }
  }

  ///Pushing new global(without [BottomNavigationPage]) page and putting the current page on the stack.
  void _eventPushGlobalNavigation(String routeName) =>
      _globalNavKey.key.currentState!.pushNamed(routeName);

  ///Replacing the current page with a new one(without [BottomNavigationPage]).
  void _eventPushReplacementGlobalNavigation(String routeName) =>
      _globalNavKey.key.currentState!
          .pushNamedAndRemoveUntil(routeName, ModalRoute.withName('/'));

  ///Remove current global(without [BottomNavigationPage]) page from stack.
  void _eventPopGlobalNavigation() => _globalNavKey.key.currentState!.pop();

  ///Navigate to certain tab by [tabIndex].
  ///Also support deleting certain tab stack of pages by [deleteRouteTabIndex].
  void _eventNavigateToTab(int tabIndex, int? deleteRouteTabIndex) {
    if (deleteRouteTabIndex != null) {
      _tabFlows[deleteRouteTabIndex]
          .navigatorKey
          .currentState!
          .popUntil((route) => route.isFirst);
    }
    _tabChanger.onTap(tabIndex);
  }

  ///Listen tab nested(with [BottomNavigationPage]) navigation events and defining type of navigation event.
  void _eventTabNestedNavigation(NavigationTabArguments navigationArguments) {
    final routeName = navigationArguments.routeName;
    final isFullscreenNavigation = navigationArguments.isFullscreenNavigation;

    switch (navigationArguments.navigationTypeEvent) {
      case NavigationTypeEvent.PUSH:
        _eventPushTabNestedNavigation(routeName!, isFullscreenNavigation!);
        break;
      case NavigationTypeEvent.PUSH_REPLACEMENT:
        break;
      case NavigationTypeEvent.POP:
        _eventPopTabNestedNavigation();
        break;
      case NavigationTypeEvent.NAVIGATE_TO_TAB:
        break;
    }
  }

  ///Push new page to the stack of bottom navigation bar item.
  ///With pushing new page, [BottomNavigationPage] is also remain in screen.
  void _eventPushTabNestedNavigation(
      String routeName, bool isFullscreenNavigation) {
    if (!_globalFlows.flows.containsKey(routeName)) {
      throw Exception(
          'No such nested tab flow (route) for $routeName. Please check $routeName in dependency map for ${this.runtimeType.toString()}');
    }

    Navigator.of(_getCurrentContext, rootNavigator: isFullscreenNavigation)
        .push(_buildAdaptivePageRoute(
      builder: _globalFlows.flows[routeName]!,
      fullscreenDialog: isFullscreenNavigation,
    ));
  }

  ///Delete current page from stack of bottom navigation bar item.
  void _eventPopTabNestedNavigation() => Navigator.of(_getCurrentContext).pop();

  ///Builder of tab nested page depending on the platform.
  PageRoute<T> _buildAdaptivePageRoute<T>({
    required WidgetBuilder builder,
    required bool fullscreenDialog,
  }) =>
      _isIos
          ? CupertinoPageRoute(
              builder: builder,
              fullscreenDialog: fullscreenDialog,
            )
          : MaterialPageRoute(
              builder: builder,
              fullscreenDialog: fullscreenDialog,
            );

  ///Defining type of platform for making different transition on IOS and other platforms.
  bool get _isIos =>
      Theme.of(_globalNavKey.key.currentContext!).platform == TargetPlatform.iOS;

  ///Getting current context depending on current root of bottom navigation bar item.
  BuildContext get _getCurrentContext =>
      _currentTab.navigatorKey.currentContext!;

  ///Changing [_currentTab] by changing bottom navigation bar item in [BottomNavigationPage].
  @override
  void notifyTabChanged(TabFlow tabFlow) {
    _currentTab = tabFlow;
  }
}