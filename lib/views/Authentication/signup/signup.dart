import 'package:evently_plan/core/assets_maneger.dart';
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_elevated_button.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_text_button.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
        backgroundColor: ColorsManager.white,
        title: Text("Register"),
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
                    txt: "name",
                    icon: Icons.person,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    validate: emailValidate,
                    txt: "Email",
                    icon: Icons.email,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    validate: passwordValidate,
                    txt: "Password",
                    isPassword: true,
                    icon: Icons.lock,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    validate: passwordValidate,
                    txt: "Password",
                    isPassword: true,
                    icon: Icons.lock,
                  ),
                  SizedBox(height: 20),
                  CustomElevatedButton(txt: "Create Account",onPressed:validator ,),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have Account ?",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      CustomTextButton(txt: "Login", onPressed: () {
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
