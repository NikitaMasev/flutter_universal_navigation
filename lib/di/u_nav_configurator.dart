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

GetIt initUNavInjection<T>(GetIt get, String env) {
  get.registerFactory<BehaviorSubject<T>>(() => BehaviorSubject<T>());
  get.registerFactory<BehaviorSubject<NavigationTabArguments>>(() => BehaviorSubject<NavigationTabArguments>());
  get.registerFactory<BehaviorSubject<NavigationArguments>>(() => BehaviorSubject<NavigationArguments>());

  get.registerSingleton<EventNotifier<T>>(CoreEventNotifier<T>(get<BehaviorSubject<T>>()));
  get.registerSingleton<BottomNavKey>(BottomNavKey(GlobalKey<NavigatorState>()));
  get.registerSingleton<GlobalNavKey>(GlobalNavKey(GlobalKey<NavigatorState>()));

  final navControllerEvents = NavigationControllerEvents<T>(
    get<BehaviorSubject<NavigationTabArguments>>(),
    get<BehaviorSubject<NavigationArguments>>(),
    get<EventNotifier<T>>(),
  );

  get.registerSingleton<NavigationController<T>>(navControllerEvents);
  get.registerSingleton<NavigationEvents>(navControllerEvents);

  return get;
}

GetIt initUNavAppNavigatorInjection(GetIt get, String env) {
  get.registerSingleton<TabChangeListener>(AppNavigator(
    get<List<TabFlow>>(),
    get<GlobalFlows>(),
    get<BottomNavKey>(),
    get<GlobalNavKey>(),
    get<NavigationEvents>(),
  ));
  return get;
}