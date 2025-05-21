import 'package:dartz/dartz.dart';
import 'package:evently_plan/core/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignupRepo {
  Future<Either<Failure, UserCredential>> createAccount(
    String userName,
    String email,
    String password,
  );
}
