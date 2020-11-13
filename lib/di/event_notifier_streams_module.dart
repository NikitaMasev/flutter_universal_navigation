import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@module
abstract class EventNotifierStreamsModule {
  BehaviorSubject<dynamic> get getEventsNotifierSubject => BehaviorSubject<dynamic>();
}
