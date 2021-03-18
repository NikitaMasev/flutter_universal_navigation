import 'package:rxdart/rxdart.dart';
import 'package:universal_navigation/navigation/core/navigation_controller_events.dart';

///For pushing and getting generic data events.
abstract class EventNotifier<T> {
  ///Add new event data
  void sink(T eventData);

  ///Get stream of events data
  Stream<T> getStreamEvents();
}

///Core of events data.
///It's can used as a single part from [NavigationControllerEvents], but for convenience it was included in the [NavigationControllerEvents].
class CoreEventNotifier<T> implements EventNotifier<T> {
  ///Rx wrapper of generic type events.
  final BehaviorSubject<T> _controllerEventsData;

  CoreEventNotifier(this._controllerEventsData);

  @override
  void sink(T eventData) {
    _controllerEventsData.add(eventData);
  }

  @override
  Stream<T> getStreamEvents() {
    return _controllerEventsData.asBroadcastStream();
  }
}
