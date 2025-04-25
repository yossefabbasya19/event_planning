class EventDm {
  final String title;
  final String description;
  final String category;
  final DateTime eventDate;
  final DateTime eventTime;
  final int? lat;
  final int? lng;

  EventDm({required this.title, required this.description, required this.category, required this.eventDate, required this.eventTime,  this.lat,  this.lng});
}