sealed class ProfileState {}
class ProfileStateInit extends ProfileState {}
class ProfileStateLoading extends ProfileState {}
class ProfileStateSuccess extends ProfileState {}
class ProfileStateFailure extends ProfileState {
  final String? errorMessage;

  ProfileStateFailure(this.errorMessage);
}