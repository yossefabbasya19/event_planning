import 'package:dartz/dartz.dart';
import 'package:evently_plan/core/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<Either<Failure,UserCredential>>logIn(String email,String password);
  Future<Either<Failure,OAuthCredential>>loginWithGoogleAccount();
  Future<Either<Failure, UserCredential>> createAccount(
      String userName,
      String email,
      String password,
      );
}