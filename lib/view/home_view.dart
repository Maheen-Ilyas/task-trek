import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/app/routes.dart';
import 'package:to_do/controllers/home/home_controller.dart';
import 'package:to_do/utils/theme/app_colors.dart';
import 'package:to_do/widgets/task_list.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(settingsRoute),
            tooltip: "Settings",
            icon: const Icon(
              Icons.settings_outlined,
              size: 28.0,
              color: AppColors.lightGreyText,
            ),
          ),
          IconButton(
            onPressed: () => Get.toNamed(addTaskRoute),
            tooltip: "Add Task",
            icon: const Icon(
              Icons.add,
              size: 28.0,
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
                controller.date.toString(),
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  letterSpacing: 2.0,
                  color: AppColors.darkGreyText,
                ),
              ),
              const SizedBox(height: 20.0),
              Obx(() {
                if (controller.name.value.startsWith('Error:')) {
                  return Center(
                    child: Text(
                      controller.name.value,
                      style: TextStyle(
                        fontSize: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.fontSize,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  );
                } else if (controller.name.value == 'No user name') {
                  return Center(
                    child: Text(
                      'No user name.',
                      style: TextStyle(
                        fontSize: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.fontSize,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  );
                } else {
                  return Text(
                    "Welcome back ${controller.name},\nHere are your daily tasks.",
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.headlineLarge?.fontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                      color: AppColors.lightGreyText,
                    ),
                  );
                }
              }),
              const SizedBox(height: 30.0),
              const TaskList(),
            ],
          ),
        ),
      ),
    );
  }
}
