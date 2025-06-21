import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:evently_plan/core/failure/failure.dart';
import 'package:evently_plan/views/Authentication/data/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_with_google_state.dart';

class LoginWithGoogleCubit extends Cubit<LoginWithGoogleState> {
  LoginWithGoogleCubit(this.authRepo) : super(LoginWithGoogleInitial());
  final AuthRepo authRepo;

  Future<void> logInWithGoogle() async {
    emit(LoginWithGoogleLoading());
    Either<Failure, OAuthCredential> result =
        await authRepo.loginWithGoogleAccount();
    result.fold(
      (l) {
        emit(LoginWithGoogleFailure(l.errMessage));
      },
      (r) {
        emit(LoginWithGoogleSuccess(r));
      },
    );
  }
}
