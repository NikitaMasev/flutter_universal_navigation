import 'package:rxdart/rxdart.dart';
import 'package:universal_navigation/navigation/models/navigation_data/navigation_arguments.dart';
import 'package:universal_navigation/navigation/models/navigation_data/navigation_tab_arguments.dart';

mixin NavigationEvents {
  BehaviorSubject<NavigationTabArguments> getTabNestedNavigationEvents();

  BehaviorSubject<NavigationArguments> getGlobalNavigationEvents();
}
