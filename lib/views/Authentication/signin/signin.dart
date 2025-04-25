

import 'package:evently_plan/core/assets_maneger.dart';
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/core/my_router/my_router.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_elevated_button.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_text_button.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  GlobalKey<FormState> formKey = GlobalKey();

  void validator() {
    if (formKey.currentState!.validate()) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "plz,enter value";
                      }
                    },
                    txt: "Email",
                    icon: Icons.email,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "plz,enter value";
                      }
                    },
                    txt: "Password",
                    isPassword: true,
                    icon: Icons.lock,
                  ),
        
                  CustomTextButton(
                    alignment: Alignment.centerRight,
                    txt: 'Forget Password?',
                    onPressed: () {},
                  ),
                  CustomElevatedButton(txt: 'Login', onPressed: validator),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t Have Account ?",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      CustomTextButton(
                        txt: "Create Account",
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
                        "Login With Google",
                        style: TextStyle(color: ColorsManager.blue, fontSize: 20),
                      ),
                      icon: Image(image: AssetImage(AssetsManeger.googleLogo)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
