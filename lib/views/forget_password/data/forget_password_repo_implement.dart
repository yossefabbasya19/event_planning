import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:evently_plan/core/result.dart';
import 'package:evently_plan/views/forget_password/data/forget_password_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ForgetPasswordRepoImplement extends ForgetPasswordRepo {

  Future<Result<String>> resetPassword(String email) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        return SuccessResult(email);
      } catch (e) {
        if (e is FirebaseAuthException) {
          return FailureResult(e.message!);
        }
        return GeneralFailureResult(e.toString());
      }
    } else {
      return FailureResult("no internet");
    }
  }
}
