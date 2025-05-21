import 'package:dartz/dartz.dart';
import 'package:evently_plan/core/failure/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure,void>>addToFavorites(String eventID);
  Future<Either<Failure,void>>removeFromFavorites(String eventID);
}