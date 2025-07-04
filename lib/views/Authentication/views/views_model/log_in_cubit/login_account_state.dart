import 'package:firebase_auth/firebase_auth.dart';

sealed class LoginAccountState {}

final class LoginAccountInitial extends LoginAccountState {}
final class LoginAccountLoading extends LoginAccountState {}
final class LoginAccountFailure extends LoginAccountState {
  final String errMessage;

  LoginAccountFailure(this.errMessage);
}
final class LoginAccountSuccess extends LoginAccountState {
  final UserCredential currentUser;

  LoginAccountSuccess(this.currentUser);
}
