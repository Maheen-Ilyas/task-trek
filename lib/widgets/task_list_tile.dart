import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/utils/theme/app_colors.dart';

class TaskListTile extends StatelessWidget {
  final Task task;
  final Widget widget;
  const TaskListTile({
    super.key,
    required this.task,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              task.taskTitle,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                letterSpacing: 2.0,
                color: AppColors.darkGreyText,
              ),
            ),
          ),
          subtitle: Text(
            task.task,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: AppColors.lightGreyText,
            ),
          ),
          trailing: widget,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            children: [
              Text(
                "Start Date: ",
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                  letterSpacing: 2.0,
                  color: AppColors.darkGreyText,
                ),
              ),
              Text(
                task.startDate,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: AppColors.mediumGreyText,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            children: [
              Text(
                "Deadline: ",
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                  letterSpacing: 2.0,
                  color: AppColors.darkGreyText,
                ),
              ),
              Text(
                task.finalDate,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  letterSpacing: 2.0,
                  color: AppColors.mediumGreyText,
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
