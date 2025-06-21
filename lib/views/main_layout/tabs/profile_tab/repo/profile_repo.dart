import 'package:evently_plan/core/result.dart';

abstract class ProfileRepo {
  Future<Result<void>> signOut();
}