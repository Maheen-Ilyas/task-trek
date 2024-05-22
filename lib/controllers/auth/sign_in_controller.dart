import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/app/routes.dart';
import 'package:to_do/services/auth/auth_service.dart';
import 'package:to_do/utils/theme/app_colors.dart';

class SignInController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        await AuthService.firebase().signIn(
          email: email.text,
          password: password.text,
        );
        Get.offAllNamed(homeRoute);
      } catch (e) {
        Get.snackbar(
          '',
          '',
          backgroundColor: AppColors.lightGreyText,
          titleText: Text(
            'Error',
            style: TextStyle(
              fontFamily: GoogleFonts.playfairDisplay().fontFamily,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: AppColors.backgroundColor,
            ),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: AppColors.backgroundColor,
            ),
          ),
        );
      }
    }
  }
}
