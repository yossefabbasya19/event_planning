import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/core/firebase_service/firebase_service.dart';
import 'package:evently_plan/core/result.dart';
import 'package:evently_plan/views/edit_event/data/repo/edit_event.dart';
import 'package:flutter/cupertino.dart';

class EditEventImplementation extends EditEvent{
  @override
  Future<Result<EventDm>> updateEvent(BuildContext context,EventDm eventDm) async{
    try{
      await FirebaseService.updateSelectEvent(context, eventDm);
      return SuccessResult(eventDm);
    }catch(e){
      if(e is FirebaseException){
        return FailureResult(e.message!);
      }
      return GeneralFailureResult(e.toString());
    }
  }

}