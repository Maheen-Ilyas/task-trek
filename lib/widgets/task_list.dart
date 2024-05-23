import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/controllers/task/task_controller.dart';
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
  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          if (controller.tasks.isEmpty) {
            return Center(
              child: Text(
                'No tasks available.',
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
          return ListView.builder(
            itemCount: controller.tasks.length,
            itemBuilder: (context, index) {
              return TaskListTile(
                task: controller.tasks[index],
                onChanged: (value) {
                  controller.updateTaskCompletion(
                    controller.tasks[index],
                    value,
                  );
                },
                onDismissed: () {
                  setState(() {
                    controller.tasks.removeAt(index);
                  });
                  controller.deleteTask(controller.tasks[index].id);
                },
              );
            },
          );
        },
      ),
    );
  }
}
