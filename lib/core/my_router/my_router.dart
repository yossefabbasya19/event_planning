import 'package:evently_plan/views/Authentication/signin/cubit/login_account_cubit.dart';
import 'package:evently_plan/views/Authentication/signin/repo/log_in_repo.dart';
import 'package:evently_plan/views/Authentication/signin/repo/log_in_repo_imple.dart';
import 'package:evently_plan/views/Authentication/signin/signin.dart';
import 'package:evently_plan/views/Authentication/signup/cubit/create_account_cubit.dart';
import 'package:evently_plan/views/Authentication/signup/repo/signup_repo_impl.dart';
import 'package:evently_plan/views/Authentication/signup/signup.dart';
import 'package:evently_plan/views/create_event/create_event.dart';
import 'package:evently_plan/views/main_layout/main_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRouter {
  static const String signIn = "/signIn";
  static const String signup = "/signup";
  static const String mainLayout = "/mainLayout";
  static const String createEvent = "/createEvent";

  static Route? myRouter(RouteSettings settings) {
    switch (settings.name) {
    case signIn:
    return CupertinoPageRoute(builder: (context) =>
    BlocProvider(
    create: (context) => LoginAccountCubit(LogInRepoImple()),
    child: Signin(),
    ),);
    case signup:
    return CupertinoPageRoute(builder: (context) =>
    BlocProvider(
    create: (context) => CreateAccountCubit(SignupRepoImpl()),
    child: Signup(),
    ),);
    case mainLayout:
    return CupertinoPageRoute(builder: (context) => MainLayout(),);
    case createEvent :
    return CupertinoPageRoute(builder: (context) => CreateEvent(),);
    }
    return null;
  }
}