import 'package:evently_plan/core/result.dart';
import 'package:evently_plan/views/main_layout/tabs/profile_tab/provider/profile_state.dart';
import 'package:evently_plan/views/main_layout/tabs/profile_tab/repo/profile_repo.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepo profileRepo;
  ProfileState profileState = ProfileStateInit();
  ProfileProvider(this.profileRepo);

  Future<void> signOut() async {
    profileState = ProfileStateLoading();
    notifyListeners();
  Result<void> result =   await profileRepo.signOut();
  switch(result){
    case SuccessResult<void>():
      profileState = ProfileStateSuccess();
      notifyListeners();
    case FailureResult<void>():
      profileState = ProfileStateFailure(result.failureError);
      notifyListeners();
    case GeneralFailureResult<void>():
      profileState = ProfileStateFailure(result.failureError);
      notifyListeners();
  }
  }
}
