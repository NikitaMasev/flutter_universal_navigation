import 'package:universal_navigation/navigation/models/navigation_flow_data/tabflow.dart';

///Mixin for notifying [AppNavigator] about changing tab item.
///Used by [BottomNavigationPage], that's call [notifyTabChanged] method.
mixin TabChangeListener {
  ///Methods calling by [BottomNavigationPage] when tab bar item changed.
  void notifyTabChanged(TabFlow tabFlow);
}
