import 'package:universal_navigation/navigation/core/app_navigator.dart';
import 'package:universal_navigation/navigation/core/navigation_controller_events.dart';
import 'package:universal_navigation/navigation/models/navigation_type_events.dart';

///Base data class for throwing some navigation event from [NavigationControllerEvents] to [AppNavigator]
class BaseNavigationArguments {
  final NavigationTypeEvent navigationTypeEvent;

  BaseNavigationArguments(this.navigationTypeEvent);
}