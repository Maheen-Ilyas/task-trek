import 'package:flutter/material.dart';
import 'package:to_do/app/routes.dart';
import 'package:to_do/utils/theme/app_colors.dart';
import 'package:to_do/view/add_task.dart';
import 'package:to_do/view/home_view.dart';
import 'package:to_do/view/sign_in.dart';
import 'package:to_do/view/sign_up.dart';
import 'package:to_do/view/welcome_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskTrek',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      routes: {
        signUpRoute: (context) => const SignUpView(),
        signInRoute: (context) => const SignInView(),
        homeRoute: (context) => const HomeView(),
        addTaskRoute: (context) => const AddTask(),
      },
      home: const WelcomeView(),
    );
  }
}
