import 'package:evently_plan/core/DM/event_Dm.dart';

class UpdateEventState {}
class UpdateEventStateInit extends UpdateEventState {}
class UpdateEventStateLoading extends UpdateEventState {}
class UpdateEventStateSuccess extends UpdateEventState {
  final EventDm eventDm ;

  UpdateEventStateSuccess(this.eventDm);
}
class UpdateEventStateFailure extends UpdateEventState {
  final String? generalError;
  final String? fireBaseError;

  UpdateEventStateFailure({this.generalError, this.fireBaseError});
}