import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:universal_navigation/event_notifier/core_event_notifier.dart';
import 'package:universal_navigation/navigation/core/app_navigator.dart';
import 'package:universal_navigation/navigation/core/navigation_controller.dart';
import 'package:universal_navigation/navigation/core/navigation_controller_events.dart';
import 'package:universal_navigation/navigation/core/navigation_events.dart';
import 'package:universal_navigation/navigation/core/tab_change_listener.dart';
import 'package:universal_navigation/navigation/models/navigation_data/navigation_arguments.dart';
import 'package:universal_navigation/navigation/models/navigation_data/navigation_tab_arguments.dart';
import 'package:universal_navigation/navigation/models/navigation_flow_data/globalflows.dart';
import 'package:universal_navigation/navigation/models/navigation_flow_data/tabflow.dart';
import 'package:universal_navigation/navigation/models/navigation_keys/bottom_nav_key.dart';
import 'package:universal_navigation/navigation/models/navigation_keys/global_nav_key.dart';

final getIt = GetIt.instance;

void initUNavInjection<T>(String env) {
  getIt.registerFactory<BehaviorSubject<T>>(() => BehaviorSubject<T>());
  getIt.registerFactory<BehaviorSubject<NavigationTabArguments>>(() => BehaviorSubject<NavigationTabArguments>());
  getIt.registerFactory<BehaviorSubject<NavigationArguments>>(() => BehaviorSubject<NavigationArguments>());

  getIt.registerSingleton<EventNotifier<T>>(CoreEventNotifier<T>(getIt<BehaviorSubject<T>>()));
  getIt.registerSingleton<BottomNavKey>(BottomNavKey(GlobalKey<NavigatorState>()));
  getIt.registerSingleton<GlobalNavKey>(GlobalNavKey(GlobalKey<NavigatorState>()));

  final navControllerEvents = NavigationControllerEvents<T>(
    getIt<BehaviorSubject<NavigationTabArguments>>(),
    getIt<BehaviorSubject<NavigationArguments>>(),
    getIt<EventNotifier<T>>(),
  );

  getIt.registerSingleton<NavigationController<T>>(navControllerEvents);
  getIt.registerSingleton<NavigationEvents>(navControllerEvents);
}

void initUNavAppNavigatorInjection(String env) {
  getIt.registerSingleton<TabChangeListener>(AppNavigator(
    getIt<List<TabFlow>>(),
    getIt<GlobalFlows>(),
    getIt<BottomNavKey>(),
    getIt<GlobalNavKey>(),
    getIt<NavigationEvents>(),
  ));
}