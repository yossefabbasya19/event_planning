import 'package:evently_plan/core/assets_maneger.dart';
import 'package:evently_plan/core/helper/snack_bar.dart';
import 'package:evently_plan/core/validation_rules/validation_rules.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_elevated_button.dart';
import 'package:evently_plan/views/Authentication/widgets/custom_text_form_field.dart';
import 'package:evently_plan/views/forget_password/presentation/view_model/forgen_password_provider.dart';
import 'package:evently_plan/views/forget_password/presentation/view_model/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  String result = "Reset Password";

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ForgetPasswordProvider provider = Provider.of<ForgetPasswordProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(title: Text("Forget Password"), centerTitle: true),
      body: SingleChildScrollView(
        child: Form(
          key: provider.formKey,
          child: Column(
            children: [
              SizedBox(height: 8),
              Image(image: AssetImage(AssetsManeger.forgetPasswordImage)),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: CustomTextFormField(
                  validate: ValidationRules.emailValidate,
                  txt: "Email Address",
                  icon: Icons.email,
                  myController: emailController,
                ),
              ),
              Consumer<ForgetPasswordProvider>(
                builder: (context, value, child) {
                  ForgetPasswordState state = value.forgetPasswordState;
                  if (state is ForgetPasswordStateFailure) {
                    result = state.errorMessage!;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: CustomElevatedButton(
                            txt: "reset password",
                            onPressed: () {
                              provider.forgetPassword(emailController.text);
                            },
                          ),
                        ),
                        Text(
                          state.errorMessage!,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    );
                  }
                  else if (state is ForgetPasswordStateSuccess) {
                    result = 'check your email box';
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: CustomElevatedButton(
                            txt: "reset password",
                            onPressed: () async{
                             await provider.forgetPassword(emailController.text);
                            },
                          ),
                        ),
                        Text(
                          "check your email box",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    );
                  }
                  else if (state is ForgetPasswordStateLoading) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: CustomElevatedButton(
                        isLoading: true,
                        txt: "reset password",
                        onPressed: () {
                          provider.forgetPassword(emailController.text);
                        },
                      ),
                    );
                  }
                  else{
                   return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: CustomElevatedButton(
                        txt: "reset password",
                        onPressed: () {
                          provider.forgetPassword(emailController.text);
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
