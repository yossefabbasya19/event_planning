import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/core/result.dart';
import 'package:flutter/cupertino.dart';

abstract class EditEvent {
  Future<Result<EventDm>> updateEvent(BuildContext context,EventDm eventDm);
}