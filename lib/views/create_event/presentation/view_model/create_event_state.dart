import 'package:evently_plan/core/DM/event_Dm.dart';

class CreateEventState {}
class CreateEventStateLoading extends CreateEventState {}
class CreateEventStateSuccess extends CreateEventState {
  final EventDm eventDm;

  CreateEventStateSuccess(this.eventDm);
}
class CreateEventStateFailure extends CreateEventState {
  final String? generalError;
  final String? fireBaseError;

  CreateEventStateFailure({this.generalError, this.fireBaseError});
}
class CreateEventStateInit extends CreateEventState {}