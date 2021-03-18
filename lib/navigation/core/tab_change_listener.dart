import 'package:universal_navigation/navigation/models/navigation_flow_data/tabflow.dart';

///For notifying [AppNavigator] about changing tab item.
///Used by [BottomNavigationPage], that's call [notifyTabChanged] method.
abstract class TabChangeListener {
  ///Methods calling by [BottomNavigationPage] when tab bar item changed.
  void notifyTabChanged(TabFlow tabFlow);
}
