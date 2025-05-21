import 'package:dartz/dartz.dart';
import 'package:evently_plan/core/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LogInRepo {
  Future<Either<Failure,UserCredential>>logIn(String email,String password);
}