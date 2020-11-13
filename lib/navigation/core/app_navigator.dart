import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_navigation/navigation/core/navigation_events.dart';
import 'package:universal_navigation/navigation/core/tab_change_listener.dart';
import 'package:universal_navigation/navigation/models/navigation_data/navigation_arguments.dart';
import 'package:universal_navigation/navigation/models/navigation_data/navigation_tab_arguments.dart';
import 'package:universal_navigation/navigation/models/navigation_flow_data/globalflows.dart';
import 'package:universal_navigation/navigation/models/navigation_flow_data/tabflow.dart';
import 'package:universal_navigation/navigation/models/navigation_keys/bottom_nav_key.dart';
import 'package:universal_navigation/navigation/models/navigation_keys/global_nav_key.dart';
import 'package:universal_navigation/navigation/models/navigation_type_events.dart';

@Singleton(as: TabChangeListener)
class AppNavigator with TabChangeListener {
  final List<TabFlow> _tabFlows;
  final GlobalFlows _globalFlows;
  final BottomNavKey _bottomNavKey;
  final GlobalNavKey _globalNavKey;
  final NavigationEvents _navigationEvents;
  TabFlow _currentTab;

  AppNavigator(
      this._tabFlows,
      this._globalFlows,
      this._bottomNavKey,
      this._globalNavKey,
      this._navigationEvents) {
    _navigationEvents
        .getGlobalNavigationEvents()
        .listen(_eventGlobalNavigation);
    _navigationEvents
        .getTabNestedNavigationEvents()
        .listen(_eventTabNestedNavigation);
  }

  void _eventGlobalNavigation(NavigationArguments navigationArguments) {
    switch (navigationArguments.navigationTypeEvent) {
      case NavigationTypeEvent.PUSH:
        _eventPushGlobalNavigation(navigationArguments.routeName);
        break;
      case NavigationTypeEvent.PUSH_REPLACEMENT:
        _eventPushReplacementGlobalNavigation(navigationArguments.routeName);
        break;
      case NavigationTypeEvent.POP:
        _eventPopGlobalNavigation();
        break;
      case NavigationTypeEvent.NAVIGATE_TO_TAB:
        _eventNavigateToTab(navigationArguments.tabIndex,
            navigationArguments.deleteRouteTabIndex);
        break;
    }
  }

  void _eventPushGlobalNavigation(String routeName) =>
      _globalNavKey.key.currentState.pushNamed(routeName);

  void _eventPushReplacementGlobalNavigation(String routeName) =>
      _globalNavKey.key.currentState
          .pushNamedAndRemoveUntil(routeName, ModalRoute.withName('/'));

  void _eventPopGlobalNavigation() => _globalNavKey.key.currentState.pop();

  void _eventNavigateToTab(int tabIndex, int deleteRouteTabIndex) {
    if (deleteRouteTabIndex != null) {
      _tabFlows[deleteRouteTabIndex]
          .navigatorKey
          .currentState
          .popUntil((route) => route.isFirst);
    }
    (_bottomNavKey.key.currentWidget as BottomNavigationBar).onTap(tabIndex);
  }

  void _eventTabNestedNavigation(NavigationTabArguments navigationArguments) {
    final routeName = navigationArguments.routeName;
    final isFullscreenNavigation = navigationArguments.isFullscreenNavigation;

    switch (navigationArguments.navigationTypeEvent) {
      case NavigationTypeEvent.PUSH:
        _eventPushTabNestedNavigation(routeName, isFullscreenNavigation);
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

  void _eventPushTabNestedNavigation(String routeName, bool isFullscreenNavigation) {
    if (!_globalFlows.flows.containsKey(routeName)) {
      throw Exception('No such nested tab flow (route) for $routeName. Please check $routeName in dependency map for ${this.runtimeType.toString()}');
    }

    Navigator.of(_getCurrentContext, rootNavigator: isFullscreenNavigation)
        .push(_buildAdaptivePageRoute(
      builder: _globalFlows.flows[routeName],
      fullscreenDialog: isFullscreenNavigation,
    ));
  }

  void _eventPopTabNestedNavigation() => Navigator.of(_getCurrentContext).pop();

  PageRoute<T> _buildAdaptivePageRoute<T>({
    @required WidgetBuilder builder,
    @required bool fullscreenDialog,
  }) =>
      Platform.isAndroid
          ? MaterialPageRoute(
              builder: builder,
              fullscreenDialog: fullscreenDialog,
            )
          : CupertinoPageRoute(
              builder: builder,
              fullscreenDialog: fullscreenDialog,
            );

  BuildContext get _getCurrentContext => _currentTab
      .navigatorKey
      .currentContext;

  @override
  void notifyTabChanged(TabFlow tabFlow) {
    _currentTab = tabFlow;
  }
}
