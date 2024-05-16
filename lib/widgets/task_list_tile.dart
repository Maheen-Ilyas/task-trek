import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/utils/theme/app_colors.dart';

class TaskListTile extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onDismissed;

  const TaskListTile({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id),
      direction: DismissDirection.startToEnd,
      background: Container(
        decoration: const BoxDecoration(
          color: AppColors.errorColor,
        ),
        child: const Icon(
          Icons.delete,
          size: 28.0,
          color: AppColors.lightGreyText,
        ),
      ),
      confirmDismiss: (direction) async {
        return await showConfirmationDialog(context);
      },
      onDismissed: (direction) {
        onDismissed;
      },
      child: Column(
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
            trailing: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                value: task.completed,
                activeColor: AppColors.primaryColor,
                checkColor: AppColors.lightGreyText,
                onChanged: onChanged,
              ),
            ),
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
      ),
    );
  }

  Future<bool?> showConfirmationDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Theme(
            data: ThemeData(
              dialogBackgroundColor: AppColors.backgroundColor,
              dialogTheme: const DialogTheme(
                backgroundColor: AppColors.backgroundColor,
              ),
            ),
            child: AlertDialog(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              title: Text(
                "Confirm deletion",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:
                      Theme.of(context).textTheme.headlineSmall?.fontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                  color: AppColors.mediumGreyText,
                ),
              ),
              content: Text(
                "Are you sure you want to delete this task?",
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: AppColors.lightGreyText,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    "Yes",
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.bodyLarge?.fontSize,
                      color: AppColors.lightGreyText,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.bodyLarge?.fontSize,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
  }
}
