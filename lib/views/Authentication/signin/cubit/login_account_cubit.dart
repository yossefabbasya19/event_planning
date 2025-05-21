import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:evently_plan/core/failure/failure.dart';
import 'package:evently_plan/views/Authentication/signin/repo/log_in_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_account_state.dart';

class LoginAccountCubit extends Cubit<LoginAccountState> {
  LoginAccountCubit(this.logInRepo) : super(LoginAccountInitial());
  final LogInRepo logInRepo;
  logIn(String email,String password)async{
    emit(LoginAccountLoading());
    Either<Failure,UserCredential> result = await logInRepo.logIn(email, password);
    result.fold((failure) {
      emit(LoginAccountFailure(failure.errMessage));
    }, (result) {
      emit(LoginAccountSuccess(result));
    },);
  }
}
