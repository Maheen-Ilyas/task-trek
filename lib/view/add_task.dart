import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do/services/auth/auth_service.dart';
import 'package:to_do/utils/theme/app_colors.dart';
import 'package:to_do/widgets/custom_elevated_button.dart';
import 'package:to_do/widgets/custom_form_field.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _task = TextEditingController();
  final TextEditingController _taskTitle = TextEditingController();
  final TextEditingController _startDate = TextEditingController();
  final TextEditingController _currentTime = TextEditingController();
  final TextEditingController _lastDate = TextEditingController();
  var startDate = DateFormat('MMMM dd, yyyy').format(DateTime.now());
  var currentTime = DateFormat('hh:mm a').format(DateTime.now().toLocal());
  var lastDate = DateFormat('MMMM dd').format(DateTime.now());

  @override
  void dispose() {
    _task.dispose();
    _taskTitle.dispose();
    _startDate.dispose();
    _currentTime.dispose();
    _lastDate.dispose();
    super.dispose();
  }

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
          onPressed: () {
            Navigator.pop(context);
          },
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
                Text(
                  "Task title",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                    letterSpacing: 1.5,
                    color: AppColors.mediumGreyText,
                  ),
                ),
                const SizedBox(height: 10.0),
                CustomFormField(
                  hintText: "Task Title",
                  controller: _taskTitle,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Enter a task",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                    letterSpacing: 1.5,
                    color: AppColors.mediumGreyText,
                  ),
                ),
                const SizedBox(height: 10.0),
                CustomFormField(
                  hintText: "Task",
                  controller: _task,
                  keyboardType: TextInputType.multiline,
                  obscureText: false,
                  maxLines: 4,
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Start Date",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                    letterSpacing: 1.5,
                    color: AppColors.mediumGreyText,
                  ),
                ),
                const SizedBox(height: 10.0),
                CustomFormField(
                  hintText: startDate,
                  controller: _startDate,
                  obscureText: false,
                  readOnly: true,
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Time",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                    letterSpacing: 1.5,
                    color: AppColors.mediumGreyText,
                  ),
                ),
                const SizedBox(height: 10.0),
                CustomFormField(
                  hintText: currentTime,
                  controller: _currentTime,
                  obscureText: false,
                  readOnly: true,
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Deadline",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                    letterSpacing: 1.5,
                    color: AppColors.mediumGreyText,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: CustomFormField(
                        hintText: "Last Date",
                        controller: _lastDate,
                        obscureText: false,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2013),
                          lastDate: DateTime(2130),
                        );
                        if (date != null) {
                          setState(() {
                            _lastDate.text =
                                DateFormat('MMMM dd, yyyy').format(date);
                          });
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
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection('tasks')
                        .doc(AuthService.firebase().uid)
                        .set({
                      'task title': _taskTitle.text,
                      'task': _task.text,
                      'start date': startDate,
                      'time': currentTime,
                      'deadline': _lastDate.text,
                    });
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Task added successfully",
                          style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.fontSize,
                            fontWeight: FontWeight.w400,
                            fontFamily:
                                GoogleFonts.playfairDisplay().fontFamily,
                            color: AppColors.lightGreyText,
                          ),
                        ),
                        elevation: 5.0,
                        backgroundColor: AppColors.darkGreyText,
                        behavior: SnackBarBehavior.fixed,
                        dismissDirection: DismissDirection.down,
                        duration: const Duration(seconds: 50),
                        padding: const EdgeInsets.all(8.0),
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
