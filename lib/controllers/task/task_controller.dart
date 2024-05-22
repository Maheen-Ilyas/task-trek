import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do/models/task_model.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  final TextEditingController task = TextEditingController();
  final TextEditingController taskTitle = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController currentTime = TextEditingController();
  final TextEditingController lastDate = TextEditingController();

  var startDateValue = DateFormat('MMMM dd, yyyy').format(DateTime.now()).obs;
  var currentTimeValue =
      DateFormat('hh:mm a').format(DateTime.now().toLocal()).obs;
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

  void updateLastDate(DateTime date) {
    lastDateValue.value = DateFormat('MMMM dd, yyyy').format(date);
    lastDateValue = lastDateValue.value as RxString;
  }

  Future<void> saveTask() async {
    try {
      await FirebaseFirestore.instance.collection('tasks').add({
        'task title': taskTitle.text,
        'task': task.text,
        'start date': startDateValue.value,
        'time': currentTimeValue.value,
        'deadline': lastDateValue.value,
      });
      Get.snackbar(
        "Success",
        "Task added successfully!",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        isDismissible: true,
        margin: const EdgeInsets.all(8.0),
      );
      Get.back();
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        isDismissible: true,
        margin: const EdgeInsets.all(8.0),
      );
    }
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
