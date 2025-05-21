import 'package:bloc/bloc.dart';
import 'package:evently_plan/views/Authentication/signup/repo/signup_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit(this.signupRepo) : super(CreateAccountInitial());
  final SignupRepo signupRepo;

  void createAccount(
    BuildContext context,
    TextEditingController userNameController,
    TextEditingController email,
    TextEditingController passwordController,
  ) async {
    emit(CreateAccountLoading());
    var x = await signupRepo.createAccount(
      userNameController.text,
      email.text,
      passwordController.text,
    );
    x.fold(
      (failure) {
        emit(CreateAccountFailure(failure.errMessage));
      },
      (result) {
        emit(CreateAccountSuccess(result));
      },
    );
  }
}
