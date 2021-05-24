class EventData {
  final Event event;
  final dynamic data;

  const EventData({
    required this.event,
    this.data,
  });
}

enum Event { Login, FirstTab }
