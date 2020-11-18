import 'package:universal_navigation/navigation/bottom_navigation_page.dart';
import 'package:universal_navigation/navigation/core/navigation_controller_events.dart';

///Mixin that's implemented by [NavigationControllerEvents] and used for emitting navigation events
///with some generic data. It can be used inside pages and blocs.
mixin NavigationController<T> {

  ///Push new page inside [BottomNavigationPage], which call 'nested tab navigation'.
  ///After calling this method current page will be pushed to stack pages and
  ///the new page will be shown over the previous one. But bottom navigation bar also will remain visible.
  void pushTabNestedPage(String routeName,
      {bool isFullscreenNavigation = false, T eventData});

  ///Push new global(without [BottomNavigationPage]) page replacing the current page.
  void pushReplacementGlobalPage(String routeName, {T eventData});

  ///Push new global(without [BottomNavigationPage]) page.
  ///After calling this method current page will be pushed to stack pages.
  void pushGlobalPage(String routeName, {T eventData});

  ///Navigate to certain tab bar item by using [tabIndex].
  ///It also allows you to reset the stack of pages on a specific tab.
  void navigateToTab(int tabIndex, {int deleteRouteTabIndex, T eventData});

  ///Deleting current page from stack pages(stack current tab bar item).
  void popTabNestedPage();

  ///Deleting current page from stack pages(stack current tab bar item).
  void popGlobalPage();

  ///Getting stream events data for listening and subscribing to all events.
  Stream<T> getStreamEventsData();
}
