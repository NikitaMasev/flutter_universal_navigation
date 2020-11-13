mixin NavigationController<T> {
  void pushTabNestedPage(String routeName, {bool isFullscreenNavigation = false, T eventData});

  void pushReplacementGlobalPage(String routeName, {T eventData});

  void pushGlobalPage(String routeName, {T eventData});

  void navigateToTab(int tabIndex, {int deleteRouteTabIndex, T eventData});

  void popTabNestedPage();

  void popGlobalPage();

  Stream<T> getStreamEventsData();
}
