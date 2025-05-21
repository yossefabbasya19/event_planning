import 'package:evently_plan/core/assets_maneger.dart';
import 'package:evently_plan/core/my_router/my_router.dart';
import 'package:evently_plan/core/validation_rules/validation_rules.dart';
import 'package:evently_plan/views/Authentication/signup/cubit/create_account_cubit.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_elevated_button.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_text_button.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController passwordController = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    email.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register),
        centerTitle: true,
      ),
      body: BlocConsumer<CreateAccountCubit, CreateAccountState>(
        listener: (context, state) {
          if (state is CreateAccountFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
          if (state is CreateAccountSuccess) {
            Navigator.pushReplacementNamed(context, MyRouter.signIn);
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    children: [
                      Image(image: AssetImage(AssetsManeger.logo)),
                      SizedBox(height: 24),
                      CustomTextFormField(
                        myController: userNameController,
                        txt: AppLocalizations.of(context)!.name,
                        icon: Icons.person,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        myController: email,
                        validate: ValidationRules.emailValidate,
                        txt: AppLocalizations.of(context)!.email,
                        icon: Icons.email,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        maxLineSelect: 1,
                        myController: passwordController,
                        validate: ValidationRules.passwordValidate,
                        txt: AppLocalizations.of(context)!.password,
                        isPassword: true,
                        icon: Icons.lock,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        maxLineSelect: 1,
                        validate: (value) {
                          if (value != passwordController.text) {
                            return "password not like rePassword";
                          }
                          return ValidationRules.passwordValidate(value);
                        },
                        txt: AppLocalizations.of(context)!.re_password,
                        isPassword: true,
                        icon: Icons.lock,
                      ),
                      SizedBox(height: 20),
                      CustomElevatedButton(
                        isLoading: state is CreateAccountLoading ? true : false,
                        txt: AppLocalizations.of(context)!.create_account,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<CreateAccountCubit>(
                              context,
                            ).createAccount(
                              context,
                              userNameController,
                              email,
                              passwordController,
                            );
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.already_have_account,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          CustomTextButton(
                            txt: AppLocalizations.of(context)!.login,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 26),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
