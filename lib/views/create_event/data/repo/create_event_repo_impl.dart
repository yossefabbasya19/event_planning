import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/core/firebase_service/firebase_service.dart';
import 'package:evently_plan/core/result.dart';
import 'package:evently_plan/views/create_event/data/repo/create_event_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateEventRepoImpl extends CreateEventRepo {
  @override
  Future<Result<EventDm>> createEvent(EventDm eventDm) async {
    try {
      await FirebaseService.addEvent(eventDm);
      return SuccessResult(eventDm);
    } catch (e) {
      if (e is FirebaseException) {
        return FailureResult(e.message!);
      }
      return GeneralFailureResult(e.toString());
    }
  }
}
