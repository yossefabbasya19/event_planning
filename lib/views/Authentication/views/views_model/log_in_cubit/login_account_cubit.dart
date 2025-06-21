import 'package:dartz/dartz.dart';
import 'package:evently_plan/core/failure/failure.dart';
import 'package:evently_plan/views/Authentication/data/repo/auth_repo.dart';
import 'package:evently_plan/views/Authentication/views/views_model/log_in_cubit/login_account_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginAccountCubit extends Cubit<LoginAccountState> {
  LoginAccountCubit(this.authRepo) : super(LoginAccountInitial());
  final AuthRepo authRepo;

  Future<void> logIn(String email, String password) async {
    emit(LoginAccountLoading());
    Either<Failure, UserCredential> result = await authRepo.logIn(
      email,
      password,
    );
    result.fold(
      (failure) {
        emit(LoginAccountFailure(failure.errMessage));
      },
      (result) {
        emit(LoginAccountSuccess(result));
      },
    );
  }


}
