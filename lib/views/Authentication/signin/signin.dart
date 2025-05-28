import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_plan/views/Authentication/signin/cubit/login_account_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:evently_plan/core/assets_maneger.dart';
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/core/my_router/my_router.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_elevated_button.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_text_button.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_toggle_switch.dart';

class Signin extends StatefulWidget {
  Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void validator() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginAccountCubit, LoginAccountState>(
        listener: (context, state) {
          if (state is LoginAccountFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
          if (state is LoginAccountSuccess) {
            Navigator.pushReplacementNamed(context, MyRouter.mainLayout);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Image(image: AssetImage(AssetsManeger.logo)),
                      SizedBox(height: 24),
                      CustomTextFormField(
                        myController: emailController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "plz,enter value";
                          }
                        },
                        txt: AppLocalizations.of(context)!.email,
                        icon: Icons.email,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        myController: passwordController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "plz,enter value";
                          }
                        },
                        txt: AppLocalizations.of(context)!.password,
                        isPassword: true,
                        icon: Icons.lock,
                        maxLineSelect: 1,
                      ),

                      CustomTextButton(
                        alignment: Alignment.centerRight,
                        txt: AppLocalizations.of(context)!.forget_password,
                        onPressed: () {
                          Navigator.pushNamed(context, MyRouter.forgetPassword);
                        },
                      ),
                      CustomElevatedButton(
                        isLoading: state is LoginAccountLoading ? true : false,
                        txt: AppLocalizations.of(context)!.login,
                        onPressed: () {
                          BlocProvider.of<LoginAccountCubit>(context).logIn(
                            emailController.text,
                            passwordController.text,
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.do_not_have_account,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          CustomTextButton(
                            txt: AppLocalizations.of(context)!.create_account,
                            onPressed: () {
                              Navigator.pushNamed(context, MyRouter.signup);
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 57,
                        child: OutlinedButton.icon(
                          style: ButtonStyle(
                            side: WidgetStatePropertyAll(
                              BorderSide(color: ColorsManager.blue),
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          label: Text(
                            AppLocalizations.of(context)!.login_with_google,
                            style: TextStyle(
                              color: ColorsManager.blue,
                              fontSize: 20,
                            ),
                          ),
                          icon: Image(
                            image: AssetImage(AssetsManeger.googleLogo),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      CustomToggleSwitch(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
