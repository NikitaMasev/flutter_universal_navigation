import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

mixin EventNotifier<T> {
  void sink(T eventData);

  Stream<T> getStreamEvents();
}

@Singleton(as: EventNotifier)
class CoreEventNotifier<T> with EventNotifier<T> {
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
