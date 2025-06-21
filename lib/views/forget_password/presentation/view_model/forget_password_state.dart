class ForgetPasswordState {}
class ForgetPasswordStateInit extends ForgetPasswordState {}
class ForgetPasswordStateLoading extends ForgetPasswordState {}
class ForgetPasswordStateSuccess extends ForgetPasswordState {
  final String? email;

  ForgetPasswordStateSuccess(this.email);
}
class ForgetPasswordStateFailure extends ForgetPasswordState {
  final String? errorMessage;

  ForgetPasswordStateFailure({this.errorMessage});

}