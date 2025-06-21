import 'package:evently_plan/core/result.dart';
import 'package:evently_plan/views/forget_password/data/forget_password_repo.dart';
import 'package:evently_plan/views/forget_password/presentation/view_model/forget_password_state.dart';
import 'package:flutter/cupertino.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  final ForgetPasswordRepo forgetPasswordRepo;
  GlobalKey<FormState> formKey = GlobalKey();
  ForgetPasswordState forgetPasswordState = ForgetPasswordStateInit();

  ForgetPasswordProvider(this.forgetPasswordRepo);

  Future<void> forgetPassword(String email) async {
    forgetPasswordState = ForgetPasswordStateLoading();
    notifyListeners();
    if (formKey.currentState!.validate()) {
      var result = await forgetPasswordRepo.resetPassword(email);
      switch (result) {
        case SuccessResult<String>():
          forgetPasswordState = ForgetPasswordStateSuccess(result.data);
          notifyListeners();
        case FailureResult<String>():
          forgetPasswordState = ForgetPasswordStateFailure(
            errorMessage: result.failureError,
          );
          notifyListeners();
        case GeneralFailureResult<String>():
          forgetPasswordState = ForgetPasswordStateFailure(
            errorMessage: result.failureError,
          );
          notifyListeners();
      }
    }
  }
}
