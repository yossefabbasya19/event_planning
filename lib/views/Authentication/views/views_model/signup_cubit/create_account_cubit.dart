import 'package:bloc/bloc.dart';
import 'package:evently_plan/views/Authentication/data/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit(this.authRepo) : super(CreateAccountInitial());
  final AuthRepo authRepo;

  void createAccount(
    BuildContext context,
    TextEditingController userNameController,
    TextEditingController email,
    TextEditingController passwordController,
  ) async {
    emit(CreateAccountLoading());
    var x = await authRepo.createAccount(
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
