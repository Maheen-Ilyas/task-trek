import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/app/routes.dart';
import 'package:to_do/utils/theme/app_colors.dart';
import 'package:to_do/widgets/custom_elevated_button.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 80.0, 30.0, 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to TaskTrek!\nEnjoy your stay.",
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                  letterSpacing: 1.8,
                  color: AppColors.lightGreyText,
                ),
              ),
              const Spacer(flex: 6),
              Text(
                "Productivity is being able to do things that you were never able to do before",
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0.8,
                  color: AppColors.lightGreyText,
                ),
              ),
              Text(
                "\t\t\t\t\t\t-Franz Kafka",
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: AppColors.lightGreyText,
                ),
              ),
              const Spacer(flex: 3),
              CustomElevatedButton(
                onPressed: () => Get.toNamed(signUpRoute),
                buttonText: "Get Started",
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
