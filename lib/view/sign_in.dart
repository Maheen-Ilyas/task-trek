import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/app/routes.dart';
import 'package:to_do/controllers/auth/sign_in_controller.dart';
import 'package:to_do/utils/theme/app_colors.dart';
import 'package:to_do/widgets/auth_navigation_text.dart';
import 'package:to_do/widgets/custom_elevated_button.dart';
import 'package:to_do/widgets/custom_form_field.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final SignInController controller = Get.put(SignInController());
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
                    "Sign In.",
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
                    text: "Don't have an account?",
                    navText: "Sign up here!",
                    onTap: () => Get.toNamed(signUpRoute),
                  ),
                  const SizedBox(height: 40.0),
                  CustomElevatedButton(
                    buttonText: "Sign in",
                    onPressed: controller.signIn,
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
