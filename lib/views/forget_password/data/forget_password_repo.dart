import 'package:dartz/dartz.dart';
import 'package:evently_plan/core/result.dart';

abstract class ForgetPasswordRepo {
  Future<Result<String>> resetPassword(String email);
}