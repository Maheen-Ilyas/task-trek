import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/app/routes.dart';
import 'package:to_do/services/auth/auth_service.dart';
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
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              key: _formKey,
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
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    hintText: "Email",
                  ),
                  const SizedBox(height: 20.0),
                  CustomFormField(
                    controller: _password,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    hintText: "Password",
                  ),
                  const SizedBox(height: 10.0),
                  AuthNavigationText(
                    text: "Don't have an account?",
                    navText: "Sign up here!",
                    onTap: () {
                      Navigator.of(context).pushNamed(signUpRoute);
                    },
                  ),
                  const SizedBox(height: 40.0),
                  CustomElevatedButton(
                    buttonText: "Sign in",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await AuthService.firebase().signIn(
                          email: _email.text,
                          password: _password.text,
                        );
                        if (!context.mounted) return;
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          homeRoute,
                          (route) => false,
                        );
                      }
                    },
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