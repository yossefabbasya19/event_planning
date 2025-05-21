import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:evently_plan/core/failure/failure.dart';
import 'package:evently_plan/core/firebase_service/firebase_service.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/repo/home_repo.dart';

class HomeRepoImple extends HomeRepo{
  @override
  Future<Either<Failure, void>> addToFavorites(String eventID) async {
    try {
      void added =await  FirebaseService.addEventToFavoritesList(eventID);
      return Right(added);
    }catch (e){
      if(e is FirebaseException){
        return Left(FireBaseFailure(e.code));
      }
      return Left(FireBaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromFavorites(String eventID)async {
    try {
      void added =await  FirebaseService.removeEventFromFavoritesList(eventID);
      return Right(added);
    }catch (e){
      if(e is FirebaseException){
        return Left(FireBaseFailure(e.code));
      }
      return Left(FireBaseFailure(e.toString()));
    }
  }

}