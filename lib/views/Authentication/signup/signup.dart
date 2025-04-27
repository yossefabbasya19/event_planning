import 'package:evently_plan/core/assets_maneger.dart';
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_elevated_button.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_text_button.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Signup extends StatelessWidget{
  Signup({super.key});

  GlobalKey<FormState> formKey = GlobalKey();

  String? emailValidate(String? value) {
    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value!)) {
      print("not correct Email");
      return "plz, enter correct Email";
    }
    return null;
  }

  String? passwordValidate(String? value) {
    if (!RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    ).hasMatch(value!)) {
      print("not correct password");
      return "plz, enter Strong password";
    }
    return null;
  }
  void validator (){
    if(formKey.currentState!.validate()){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(AppLocalizations.of(context)!.register),
        centerTitle: true,
      ),
      body: Form(
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
                    txt: AppLocalizations.of(context)!.name,
                    icon: Icons.person,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    validate: emailValidate,
                    txt: AppLocalizations.of(context)!.email,
                    icon: Icons.email,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    validate: passwordValidate,
                    txt: AppLocalizations.of(context)!.password,
                    isPassword: true,
                    icon: Icons.lock,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    validate: passwordValidate,
                    txt: AppLocalizations.of(context)!.re_password,
                    isPassword: true,
                    icon: Icons.lock,
                  ),
                  SizedBox(height: 20),
                  CustomElevatedButton(txt: AppLocalizations.of(context)!.create_account,onPressed:validator ,),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.already_have_account,                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      CustomTextButton(txt: AppLocalizations.of(context)!.login, onPressed: () {
                        Navigator.pop(context);
                      }),
                    ],
                  ),
                  SizedBox(height: 26),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
