import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/app/routes.dart';
import 'package:to_do/controllers/auth/sign_up_controller.dart';
import 'package:to_do/utils/theme/app_colors.dart';
import 'package:to_do/widgets/auth_navigation_text.dart';
import 'package:to_do/widgets/custom_elevated_button.dart';
import 'package:to_do/widgets/custom_form_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final SignUpController controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    "Sign Up.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.displayMedium?.fontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                      color: AppColors.lightGreyText,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  CustomFormField(
                    controller: controller.name,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    hintText: "Name",
                  ),
                  const SizedBox(height: 20.0),
                  CustomFormField(
                    controller: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    hintText: "Email",
                  ),
                  const SizedBox(height: 20.0),
                  CustomFormField(
                    controller: controller.password,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    hintText: "Password",
                  ),
                  const SizedBox(height: 10.0),
                  AuthNavigationText(
                    text: "Already have an account?",
                    navText: "Sign in here!",
                    onTap: () => Get.toNamed(signInRoute),
                  ),
                  const SizedBox(height: 40.0),
                  CustomElevatedButton(
                    buttonText: "Sign up",
                    onPressed: controller.signUp,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
