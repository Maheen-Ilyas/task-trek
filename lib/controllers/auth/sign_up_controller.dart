import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/routes.dart';
import 'package:to_do/services/auth/auth_service.dart';

class SignUpController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      try {
        await AuthService.firebase().signUp(
          email: email.text,
          password: password.text,
        );
        await FirebaseFirestore.instance
            .collection('userInfo')
            .doc(AuthService.firebase().uid)
            .set({
          'name': name.text,
          'email': email.text,
        });
        Get.offAllNamed(homeRoute);
      } catch (e) {
        Get.snackbar('Error', e.toString());
      }
    }
  }
}
