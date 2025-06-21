part of 'create_account_cubit.dart';

@immutable
sealed class CreateAccountState {}

final class CreateAccountInitial extends CreateAccountState {}
final class CreateAccountLoading extends CreateAccountState {}
final class CreateAccountFailure extends CreateAccountState {
  final String errMessage;

  CreateAccountFailure(this.errMessage);
}
final class CreateAccountSuccess extends CreateAccountState {
 final  UserCredential userCredential;

  CreateAccountSuccess(this.userCredential);
}
