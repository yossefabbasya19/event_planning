import 'package:evently_plan/core/result.dart';
import 'package:evently_plan/views/create_event/data/repo/create_event_repo.dart';
import 'package:evently_plan/views/create_event/presentation/view_model/create_event_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:flutter/material.dart';

class CreateEventProvider extends ChangeNotifier {
  final CreateEventRepo createEventRepo;
  CreateEventState state = CreateEventStateInit();
  GlobalKey<FormState> formKEy = GlobalKey();

  CreateEventProvider(this.createEventRepo);

  Future<void> addEvent(EventDm eventDm, BuildContext context) async {
    if (formKEy.currentState!.validate()) {

      state = CreateEventStateLoading();
      Result<EventDm> result = await createEventRepo.createEvent(eventDm);
      switch (result) {
        case SuccessResult<EventDm>():
          state = CreateEventStateSuccess(result.data);
          notifyListeners();
        case FailureResult<EventDm>():
          state = CreateEventStateFailure(fireBaseError: result.failureError);
          notifyListeners();
        case GeneralFailureResult<EventDm>():
          state = CreateEventStateFailure(generalError: result.failureError);
      }
    }
  }

  Future<DateTime> chooseDate(BuildContext context) async {
    DateTime selectDate =
        await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        ) ??
        DateTime.now();
    return selectDate;
  }

  Future<TimeOfDay> chooseTime(BuildContext context) async {
    late TimeOfDay eventTime;
    eventTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
        TimeOfDay.now();
    return eventTime;
  }
}
