import 'package:flutter/material.dart';
import 'package:to_do/app/routes.dart';
import 'package:to_do/utils/theme/app_colors.dart';
import 'package:to_do/view/add_task.dart';
import 'package:to_do/view/home_view.dart';
import 'package:to_do/view/sign_in.dart';
import 'package:to_do/view/sign_up.dart';
import 'package:get/get.dart';
import 'package:to_do/view/welcome_view.dart';

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  const MyApp({
    super.key,
    required this.isFirstTime,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskTrek',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      getPages: [
        GetPage(name: signUpRoute, page: () => const SignUpView()),
        GetPage(name: signInRoute, page: () => const SignInView()),
        GetPage(name: homeRoute, page: () => HomeView()),
        GetPage(name: addTaskRoute, page: () => const AddTask()),
      ],
      home: isFirstTime ? const WelcomeView() : HomeView(),
    );
  }
}
