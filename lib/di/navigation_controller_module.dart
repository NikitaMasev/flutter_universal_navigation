import 'package:injectable/injectable.dart';
import 'package:universal_navigation/di/u_nav_configurator.dart';
import 'package:universal_navigation/navigation/core/navigation_controller.dart';
import 'package:universal_navigation/navigation/core/navigation_controller_events.dart';
import 'package:universal_navigation/navigation/core/navigation_events.dart';

@module
abstract class NavigationControllerModule {
  //NavigationController get getNavigationController => getIt<NavigationControllerEvents>();

  NavigationEvents get getNavigationEvents =>  getIt<NavigationController>() as NavigationControllerEvents;
}