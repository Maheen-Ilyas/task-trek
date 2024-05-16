import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/utils/theme/app_colors.dart';
import 'package:to_do/widgets/task_list_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    super.key,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium?.fontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: AppColors.primaryColor,
                ),
              ),
            );
          } else if (snapshot.data == null) {
            return Center(
              child: Text(
                'No user name.',
                style: TextStyle(
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium?.fontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: AppColors.primaryColor,
                ),
              ),
            );
          }
          List<Task> tasks = snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return Task(
              id: doc.id,
              taskTitle: data['task title'],
              task: data['task'],
              startDate: data['start date'],
              finalDate: data['deadline'],
              completed: data['completed'] ?? false,
            );
          }).toList();
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskListTile(
                task: tasks[index],
                onChanged: (value) {
                  setState(() {
                    tasks[index].completed = value!;
                  });
                  updateTaskCompletion(
                    tasks[index],
                    value,
                  );
                },
                onDismissed: () {
                  deleteTask(tasks[index].id);
                },
              );
            },
          );
        },
      ),
    );
  }
}
