import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/app/routes.dart';
import 'package:to_do/services/auth/auth_service.dart';
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
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _name.dispose();
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
                    controller: _name,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    hintText: "Name",
                  ),
                  const SizedBox(height: 20.0),
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
                    text: "Already have an account?",
                    navText: "Sign in here!",
                    onTap: () {
                      Navigator.of(context).pushNamed(signInRoute);
                    },
                  ),
                  const SizedBox(height: 40.0),
                  CustomElevatedButton(
                    buttonText: "Sign up",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await AuthService.firebase().signUp(
                          email: _email.text,
                          password: _password.text,
                        );
                        await FirebaseFirestore.instance
                            .collection('userInfo')
                            .doc(AuthService.firebase().uid)
                            .set({
                          'name': _name.text,
                          'email': _email.text,
                        });
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
