import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/utils/theme/app_colors.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  final TextEditingController task = TextEditingController();
  final TextEditingController taskTitle = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController currentTime = TextEditingController();
  final TextEditingController lastDate = TextEditingController();

  var startDateValue = DateFormat('MMMM dd, yyyy').format(DateTime.now());
  var currentTimeValue = DateFormat('hh:mm a').format(DateTime.now().toLocal());
  var lastDateValue = DateFormat('MMMM dd').format(DateTime.now()).obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  @override
  void onClose() {
    task.dispose();
    taskTitle.dispose();
    startDate.dispose();
    currentTime.dispose();
    lastDate.dispose();
    super.onClose();
  }

  Future<void> saveTask() async {
    await FirebaseFirestore.instance.collection('tasks').add({
      'task title': taskTitle.text,
      'task': task.text,
      'start date': startDateValue,
      'time': currentTimeValue,
      'deadline': lastDateValue.value,
    });
    Get.snackbar(
      '',
      '',
      backgroundColor: AppColors.lightGreyText,
      titleText: Text(
        'Success',
        style: TextStyle(
          fontFamily: GoogleFonts.playfairDisplay().fontFamily,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: AppColors.backgroundColor,
        ),
      ),
      messageText: Text(
        "Task added successfully!",
        style: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: AppColors.backgroundColor,
        ),
      ),
    );
    taskTitle.clear();
    task.clear();
    startDate.clear();
    currentTime.clear();
    lastDate.clear();
    Get.back();
  }

  void loadTasks() {
    FirebaseFirestore.instance
        .collection('tasks')
        .snapshots()
        .listen((snapshot) {
      tasks.value = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return Task(
          id: doc.id,
          taskTitle: data['task title'],
          task: data['task'],
          startDate: data['start date'],
          finalDate: data['deadline'],
          completed: data['completed'] ?? false,
        );
      }).toList();
    });
  }

  Future<void> updateTaskCompletion(Task task, bool? newValue) async {
    if (newValue != null) {
      await FirebaseFirestore.instance
          .collection('tasks')
          .doc(task.id)
          .update({'completed': newValue});
    }
  }

  Future<void> deleteTask(String taskID) async {
    await FirebaseFirestore.instance.collection('tasks').doc(taskID).delete();
  }
}
