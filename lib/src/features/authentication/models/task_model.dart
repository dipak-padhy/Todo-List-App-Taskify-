class TaskModel {

  final String taskId;
  final String taskTitle;
  final String taskDescription;
  final String taskCategory;
  final String taskDate;
  final String taskSt;
  final String taskEt;
  final String taskReminder;

  const TaskModel({

    required this.taskId,
    required this.taskTitle,
    required this.taskDescription,
    required this.taskCategory,
    required this.taskDate,
    required this.taskSt,
    required this.taskEt,
    required this.taskReminder,
  });
}
