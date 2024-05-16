class Task {
  final String id;
  final String taskTitle;
  final String task;
  final String startDate;
  final String finalDate;
  bool completed;

  Task({
    required this.id,
    required this.taskTitle,
    required this.task,
    required this.startDate,
    required this.finalDate,
    this.completed = false,
  });
}
