import 'package:rxdart/rxdart.dart';
import 'package:universal_navigation/event_notifier/core_event_notifier.dart';
import 'package:universal_navigation/navigation/bottom_navigation_page.dart';
import 'package:universal_navigation/navigation/core/app_navigator.dart';
import 'package:universal_navigation/navigation/core/navigation_controller.dart';
import 'package:universal_navigation/navigation/core/navigation_events.dart';
import 'package:universal_navigation/navigation/models/navigation_data/navigation_arguments.dart';
import 'package:universal_navigation/navigation/models/navigation_data/navigation_tab_arguments.dart';
import 'package:universal_navigation/navigation/models/navigation_type_events.dart';

///Implementation of [NavigationController] and [NavigationEvents].
///Used for transfer some navigation events with generic data
///without being tied to a specific navigation method.
///It's generating wrapper data classes [NavigationTabArguments], [NavigationArguments] for [AppNavigator].
///Also allow to get stream events data.
class NavigationControllerEvents<T>
    with NavigationController<T>, NavigationEvents {
  ///Rx wrapper data class of [NavigationTabArguments].
  ///Used for transfer nested navigation events to [AppNavigator].
  final BehaviorSubject<NavigationTabArguments> _tabNestedNavigationEvents;

  ///Rx wrapper data class of [NavigationArguments].
  ///Used for transfer global(without [BottomNavigationPage]) navigation events to [AppNavigator].
  final BehaviorSubject<NavigationArguments> _globalNavigationEvents;

  ///Mixin that allow to add some event data and subscribe to listening events.
  final EventNotifier _notifier;

  NavigationControllerEvents(this._tabNestedNavigationEvents,
      this._globalNavigationEvents, this._notifier);

  @override
  void pushTabNestedPage(String routeName,
      {bool isFullscreenNavigation = false, T eventData}) {
    _pushEventData(eventData);
    _tabNestedNavigationEvents.add(NavigationTabArguments(
        routeName: routeName,
        isFullscreenNavigation: isFullscreenNavigation,
        navigationTypeEvent: NavigationTypeEvent.PUSH));
  }

  @override
  void popTabNestedPage() {
    _tabNestedNavigationEvents.add(NavigationTabArguments(
        routeName: null,
        isFullscreenNavigation: null,
        navigationTypeEvent: NavigationTypeEvent.POP));
  }

  @override
  void pushReplacementGlobalPage(String routeName, {T eventData}) {
    _pushEventData(eventData);
    _globalNavigationEvents.add(NavigationArguments(
        routeName: routeName,
        tabIndex: null,
        deleteRouteTabIndex: null,
        navigationTypeEvent: NavigationTypeEvent.PUSH_REPLACEMENT));
  }

  @override
  void popGlobalPage() {
    _globalNavigationEvents.add(NavigationArguments(
        routeName: null,
        tabIndex: null,
        deleteRouteTabIndex: null,
        navigationTypeEvent: NavigationTypeEvent.POP));
  }

  @override
  void pushGlobalPage(String routeName, {T eventData}) {
    _pushEventData(eventData);
    _globalNavigationEvents.add(NavigationArguments(
        routeName: routeName,
        tabIndex: null,
        deleteRouteTabIndex: null,
        navigationTypeEvent: NavigationTypeEvent.PUSH));
  }

  @override
  void navigateToTab(int tabIndex, {int deleteRouteTabIndex, T eventData}) {
    _pushEventData(eventData);
    _globalNavigationEvents.add(NavigationArguments(
        routeName: null,
        tabIndex: tabIndex,
        deleteRouteTabIndex: deleteRouteTabIndex,
        navigationTypeEvent: NavigationTypeEvent.NAVIGATE_TO_TAB));
  }

  ///Push event data if it exist and not null.
  void _pushEventData(T eventData) {
    if (eventData != null) {
      _notifier.sink(eventData);
    }
  }

  @override
  BehaviorSubject<NavigationArguments> getGlobalNavigationEvents() =>
      _globalNavigationEvents;

  @override
  BehaviorSubject<NavigationTabArguments> getTabNestedNavigationEvents() =>
      _tabNestedNavigationEvents;

  @override
  Stream<T> getEvents() {
    return _notifier.getStreamEvents();
  }

  @override
  void sinkEvent(T eventData) {
    _notifier.sink(eventData);
  }
}
