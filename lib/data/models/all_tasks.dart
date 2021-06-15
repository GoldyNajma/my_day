import 'package:my_day/data/models/task.dart';

class AllTasks {
  final List<Task> myTasks;
  final List<Task> sharedTasks;

  AllTasks({
    required this.myTasks, 
    required this.sharedTasks,
  });

  factory AllTasks.fromJson(Map<String, dynamic> json) => AllTasks(
    myTasks: (json['my_tasks'] as List)
      .map<Task>((myTasksJson) => Task.fromJson(myTasksJson))
      .toList(),
    sharedTasks: (json['shared_tasks'] as List)
      .map<Task>((sharedTasksJson) => Task.fromJson(sharedTasksJson))
      .toList(),
  );

  List<Task> toList() => this.myTasks..addAll(this.sharedTasks);
}