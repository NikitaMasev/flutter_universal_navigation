import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:universal_navigation/event_notifier/core_event_notifier.dart';
import 'package:universal_navigation/navigation/core/navigation_controller.dart';
import 'package:universal_navigation/navigation/core/navigation_events.dart';
import 'package:universal_navigation/navigation/models/navigation_data/navigation_arguments.dart';
import 'package:universal_navigation/navigation/models/navigation_data/navigation_tab_arguments.dart';
import 'package:universal_navigation/navigation/models/navigation_type_events.dart';

@Singleton(as: NavigationController)
class NavigationControllerEvents<T> with NavigationController<T>, NavigationEvents {
  final BehaviorSubject<NavigationTabArguments> _tabNestedNavigationEvents;
  final BehaviorSubject<NavigationArguments> _globalNavigationEvents;
  final EventNotifier _notifier;

  NavigationControllerEvents(
      this._tabNestedNavigationEvents,
      this._globalNavigationEvents,
      this._notifier);

  @override
  void pushTabNestedPage(String routeName, {bool isFullscreenNavigation = false, T eventData}) {
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
  Stream<T> getStreamEventsData() {
    return _notifier.getStreamEvents();
  }
}
