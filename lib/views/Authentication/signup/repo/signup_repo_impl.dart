import 'package:dartz/dartz.dart';
import 'package:evently_plan/core/failure/failure.dart';
import 'package:evently_plan/core/firebase_service/firebase_service.dart';
import 'package:evently_plan/views/Authentication/signup/repo/signup_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupRepoImpl extends SignupRepo {
  @override
  Future<Either<Failure, UserCredential>> createAccount(
      String userName,
    String emailAddress,
    String password,
  ) async {
    try {
      UserCredential user = await FirebaseService.createAccount(
        userName,
        emailAddress,
        password,
      );
      return Right(user);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FireBaseFailure.fromCreateAccount(e));
      }
      return Left(FireBaseFailure("please try later"));
    }
  }
}
