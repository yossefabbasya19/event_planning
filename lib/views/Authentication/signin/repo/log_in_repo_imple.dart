import 'package:dartz/dartz.dart';
import 'package:evently_plan/core/failure/failure.dart';
import 'package:evently_plan/core/firebase_service/firebase_service.dart';
import 'package:evently_plan/views/Authentication/signin/repo/log_in_repo.dart';
import 'package:evently_plan/views/Authentication/signup/repo/signup_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogInRepoImple extends LogInRepo {
  @override
  Future<Either<Failure, UserCredential>> logIn(
    String email,
    String password,
  ) async {
    try {
      UserCredential currentUser = await FirebaseService.userLogin(
        email,
        password,
      );
      return Right(currentUser);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FireBaseFailure.fromLoginAccount(e));
      }
      return Left(FireBaseFailure(e.toString()));
    }
  }
}
