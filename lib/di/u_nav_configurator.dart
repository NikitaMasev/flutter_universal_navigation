import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:universal_navigation/di/event_notifier_streams_module.dart';
import 'package:universal_navigation/di/nav_keys_module.dart';
import 'package:universal_navigation/di/navigation_controller_module.dart';
import 'package:universal_navigation/di/navigation_controller_streams_module.dart';
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

GetIt initUNavInjection(GetIt get, String env) {
  final eventNotifierStreamsModule = _$EventNotifierStreamsModule();
  final navigationControllerStreamsModule = _$NavigationControllerStreamsModule();
  final navKeysModule = _$NavKeysModule();
  final navigationControllerModule = _$NavigationControllerModule();

  get.registerFactory<BehaviorSubject<dynamic>>(() => eventNotifierStreamsModule.getEventsNotifierSubject);
  get.registerFactory<BehaviorSubject<NavigationTabArguments>>(() => navigationControllerStreamsModule.getNestedNavTabArgsSubject);
  get.registerFactory<BehaviorSubject<NavigationArguments>>(() => navigationControllerStreamsModule.getGlobalNavArgsSubject);
  get.registerFactory<NavigationEvents>(() => navigationControllerModule.getNavigationEvents);

  get.registerSingleton<BottomNavKey>(navKeysModule.getBottomNavKey);
  get.registerSingleton<EventNotifier<dynamic>>(CoreEventNotifier<dynamic>(get<BehaviorSubject<dynamic>>()));
  get.registerSingleton<GlobalNavKey>(navKeysModule.getGlobalNavKey);
  get.registerSingleton<NavigationController<dynamic>>(NavigationControllerEvents<dynamic>(
    get<BehaviorSubject<NavigationTabArguments>>(),
    get<BehaviorSubject<NavigationArguments>>(),
    get<EventNotifier<dynamic>>(),
  ));

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

class _$EventNotifierStreamsModule extends EventNotifierStreamsModule {}

class _$NavigationControllerStreamsModule
    extends NavigationControllerStreamsModule {}

class _$NavKeysModule extends NavKeysModule {}

class _$NavigationControllerModule extends NavigationControllerModule {}