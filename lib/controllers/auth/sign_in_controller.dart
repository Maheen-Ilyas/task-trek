import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/routes.dart';
import 'package:to_do/services/auth/auth_service.dart';

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
        Get.snackbar('Error', e.toString());
      }
    }
  }
}
