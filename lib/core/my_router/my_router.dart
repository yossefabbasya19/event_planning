import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/views/Authentication/data/repo/auth_repo_imple.dart';
import 'package:evently_plan/views/Authentication/views/views/signin.dart';
import 'package:evently_plan/views/Authentication/views/views_model/login_with_google_cubit/login_with_google_cubit.dart';
import 'package:evently_plan/views/Authentication/views/views_model/signup_cubit/create_account_cubit.dart';
import 'package:evently_plan/views/Authentication/views/views/signup.dart';
import 'package:evently_plan/views/Authentication/views/views_model/log_in_cubit/login_account_cubit.dart';
import 'package:evently_plan/views/create_event/data/repo/create_event_repo_impl.dart';
import 'package:evently_plan/views/create_event/presentation/view/create_event.dart';
import 'package:evently_plan/views/create_event/presentation/view_model/create_event_provider.dart';
import 'package:evently_plan/views/edit_event/data/repo/edit_event_implementation.dart';
import 'package:evently_plan/views/edit_event/presentation/views/edit_event.dart';
import 'package:evently_plan/views/edit_event/presentation/views_model/update_event_provider.dart';
import 'package:evently_plan/views/event_details/presentation/views/event_details.dart';
import 'package:evently_plan/views/forget_password/data/forget_password_repo_implement.dart';
import 'package:evently_plan/views/forget_password/presentation/view_model/forgen_password_provider.dart';
import 'package:evently_plan/views/forget_password/presentation/views/forget_password.dart';
import 'package:evently_plan/views/main_layout/main_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MyRouter {
  static const String signIn = "/signIn";
  static const String signup = "/signup";
  static const String mainLayout = "/mainLayout";
  static const String createEvent = "/createEvent";
  static const String eventDetails = "/eventDetails";
  static const String eventEdit = "/eventEdit";
  static const String forgetPassword = "/forgetPassword";

  static Route? myRouter(RouteSettings settings) {
    switch (settings.name) {
      case signIn:
        return CupertinoPageRoute(
          builder:
              (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => LoginAccountCubit(AuthRepoImple()),
                  ),
                  BlocProvider(
                    create: (context) => LoginWithGoogleCubit(AuthRepoImple()),
                  ),
                ],
                child: Signin(),
              ),
        );
      case signup:
        return CupertinoPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => CreateAccountCubit(AuthRepoImple()),
                child: Signup(),
              ),
        );
      case mainLayout:
        return CupertinoPageRoute(builder: (context) => MainLayout());
      case createEvent:
        return MaterialPageRoute(
          builder:
              (context) => ChangeNotifierProvider(
                create: (context) => CreateEventProvider(CreateEventRepoImpl()),
                child: CreateEvent(),
              ),
        );
      case eventDetails:
        return MaterialPageRoute(
          builder:
              (context) => EventDetails(eventDm: settings.arguments as EventDm),
        );
      case eventEdit:
        return MaterialPageRoute(
          builder:
              (context) => ChangeNotifierProvider(
                create:
                    (context) => UpdateEventProvider(EditEventImplementation()),
                child: EditEvent(eventDm: settings.arguments as EventDm),
              ),
        );
      case forgetPassword:
        return MaterialPageRoute(
          builder:
              (context) => ChangeNotifierProvider(
                create:
                    (context) =>
                        ForgetPasswordProvider(ForgetPasswordRepoImplement()),
                child: ForgetPassword(),
              ),
        );
    }
    return null;
  }
}
