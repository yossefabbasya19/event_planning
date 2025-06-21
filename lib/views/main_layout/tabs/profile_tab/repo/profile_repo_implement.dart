import 'package:evently_plan/core/DM/user_DM.dart';
import 'package:evently_plan/core/result.dart';
import 'package:evently_plan/views/main_layout/tabs/profile_tab/repo/profile_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileRepoImplement extends ProfileRepo{
  @override
  Future<Result<void>> signOut() async{
    dynamic x = 1;
    try{
      await GoogleSignIn().signOut();
      x += "u";
      await FirebaseAuth.instance.signOut();
      UserDm.currentUser = null;
      return SuccessResult("");
    }catch(e){
      if(e is FirebaseAuthException){
        return FailureResult(e.message!);
      }
      return GeneralFailureResult(e.toString());
    }
  }

}
