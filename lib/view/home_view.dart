import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do/utils/theme/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String date = DateFormat('MMMM dd, yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: "Settings",
            icon: const Icon(
              Icons.settings_outlined,
              color: AppColors.lightGreyText,
            ),
          ),
          IconButton(
            onPressed: () {},
            tooltip: "Add Task",
            icon: const Icon(
              Icons.add,
              color: AppColors.lightGreyText,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date.toString(),
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  letterSpacing: 2.0,
                  color: AppColors.darkGreyText,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Welcome back Maheen,\nHere are your daily tasks.",
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                  color: AppColors.lightGreyText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
