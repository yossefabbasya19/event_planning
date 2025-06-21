import 'package:dartz/dartz.dart';
import 'package:evently_plan/core/failure/failure.dart';
import 'package:evently_plan/core/firebase_service/firebase_service.dart';
import 'package:evently_plan/views/Authentication/data/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImple extends AuthRepo{
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

  @override
  Future<Either<Failure, OAuthCredential>> loginWithGoogleAccount() async{
    try{
      OAuthCredential? result = await FirebaseService.signInWithGoogle();
      if(result!=null){
        return Right(result);
      }
      else{
        return Left(Failure("log in not Success"));
      }
    }catch(e){
        return Left(Failure(e.toString()));
    }
  }
  
}