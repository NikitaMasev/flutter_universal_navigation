import 'package:rxdart/rxdart.dart';
import 'package:universal_navigation/navigation/bottom_navigation_page.dart';
import 'package:universal_navigation/navigation/core/app_navigator.dart';
import 'package:universal_navigation/navigation/core/navigation_controller_events.dart';
import 'package:universal_navigation/navigation/models/navigation_data/navigation_arguments.dart';
import 'package:universal_navigation/navigation/models/navigation_data/navigation_tab_arguments.dart';

///For getting by [AppNavigator] from [NavigationControllerEvents] navigation events.
abstract class NavigationEvents {
  ///Method for getting only tab nested events.
  BehaviorSubject<NavigationTabArguments> getTabNestedNavigationEvents();

  ///Method for getting global(without [BottomNavigationPage]) navigation events
  ///and event 'navigate to tab'.
  BehaviorSubject<NavigationArguments> getGlobalNavigationEvents();
}
