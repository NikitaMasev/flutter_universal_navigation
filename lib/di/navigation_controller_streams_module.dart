import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:universal_navigation/navigation/models/navigation_data/navigation_arguments.dart';
import 'package:universal_navigation/navigation/models/navigation_data/navigation_tab_arguments.dart';

@module
abstract class NavigationControllerStreamsModule {
  BehaviorSubject<NavigationTabArguments> get getNestedNavTabArgsSubject => BehaviorSubject<NavigationTabArguments>();

  BehaviorSubject<NavigationArguments> get getGlobalNavArgsSubject => BehaviorSubject<NavigationArguments>();
}