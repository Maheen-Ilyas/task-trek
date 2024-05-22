import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/controllers/task/task_controller.dart';
import 'package:to_do/utils/theme/app_colors.dart';
import 'package:to_do/widgets/build_label.dart';
import 'package:to_do/widgets/custom_elevated_button.dart';
import 'package:to_do/widgets/custom_form_field.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TaskController controller = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: Text(
          "Add Task",
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
            fontWeight: FontWeight.w500,
            color: AppColors.mediumGreyText,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.chevron_left,
            size: 28.0,
            color: AppColors.lightGreyText,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BuildLabel(title: "Task title"),
                const SizedBox(height: 10.0),
                CustomFormField(
                  hintText: "Task Title",
                  controller: controller.taskTitle,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                ),
                const SizedBox(height: 20.0),
                const BuildLabel(title: "Enter a task"),
                const SizedBox(height: 10.0),
                CustomFormField(
                  hintText: "Task",
                  controller: controller.task,
                  keyboardType: TextInputType.multiline,
                  obscureText: false,
                  maxLines: 4,
                ),
                const SizedBox(height: 20.0),
                const BuildLabel(title: "Start Date"),
                const SizedBox(height: 10.0),
                Obx(
                  () => CustomFormField(
                    hintText: controller.startDateValue.value,
                    controller: controller.startDate,
                    obscureText: false,
                    readOnly: true,
                  ),
                ),
                const SizedBox(height: 20.0),
                const BuildLabel(title: "Time"),
                const SizedBox(height: 10.0),
                Obx(
                  () => CustomFormField(
                    hintText: controller.currentTimeValue.value,
                    controller: controller.currentTime,
                    obscureText: false,
                    readOnly: true,
                  ),
                ),
                const SizedBox(height: 20.0),
                const BuildLabel(title: "Deadline"),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => CustomFormField(
                          hintText: "Last Date",
                          controller: controller.lastDate,
                          obscureText: false,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final date = await addTaskDatePicker(context);
                        if (date != null) {
                          controller.updateLastDate(date);
                        }
                      },
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        size: 24.0,
                        color: AppColors.lightGreyText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                CustomElevatedButton(
                  buttonText: "Save Task",
                  onPressed: controller.saveTask,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> addTaskDatePicker(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2013),
      lastDate: DateTime(2130),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.darkGreyText,
              secondary: AppColors.mediumGreyText,
              tertiary: AppColors.lightGreyText,
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(
                  AppColors.lightGreyText,
                ),
                textStyle: WidgetStatePropertyAll(
                  TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                    color: AppColors.backgroundColor,
                  ),
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
