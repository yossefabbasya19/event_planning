import 'package:evently_plan/core/assets_maneger.dart';
import 'package:evently_plan/core/validation_rules/validation_rules.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_elevated_button.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forget Password"), centerTitle: true),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 8),
              Image(image: AssetImage(AssetsManeger.forgetPasswordImage)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: CustomTextFormField(
                  validate: ValidationRules.emailValidate,
                  txt: "Email Address",
                  icon: Icons.email,
                  myController: emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: CustomElevatedButton(
                  txt: "Reset Password",
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      FirebaseAuth.instance.sendPasswordResetEmail(
                        email: emailController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Show Your Email Box")));
                      Future.delayed(Duration(seconds: 3));
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
