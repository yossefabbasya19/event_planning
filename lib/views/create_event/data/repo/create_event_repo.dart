import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/core/result.dart';

abstract class CreateEventRepo {
  Future<Result<EventDm>> createEvent(EventDm eventDm);
}