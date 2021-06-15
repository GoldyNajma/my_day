import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_day/data/models/task.dart';
import 'package:my_day/utils/widgets/my_day_back_app_bar.dart';
import 'package:my_day/utils/widgets/my_day_task_item.dart';

import 'widgets/no_finished_task_widget.dart';

class FinishedTaskScreen extends StatelessWidget {
  const FinishedTaskScreen({ Key? key }) : super(key: key);

  List<Task> _getSampleTasks() {
    final Random random = Random();

    return List.generate(random.nextInt(31), (index) => Task(
      id: index,
      title: 'Learning Flutter' * (index),
      description: 'Flutter widgets\nMake a simple application',
      checked: random.nextBool(),
      shared: false));
  }

  List<Task> _getFinishedTasks(List<Task> tasks) => tasks
    .where((Task task) => task.checked)
    .toList();

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = _getSampleTasks();
    List<Task> finishedTasks = _getFinishedTasks(tasks); 
    print('tasks.length: ${tasks.length}');
    print('finishedTasks.length: ${finishedTasks.length}');

    return Scaffold(
      appBar: const MyDayBackAppBar(),
      body: finishedTasks.isEmpty 
        ? MediaQuery.of(context).orientation == Orientation.portrait
          ? const Center(child: const NoFinishedTaskWidget())
          : const SingleChildScrollView(
              child: const Center(
                child: const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: const NoFinishedTaskWidget(),
                ),
              ),
            )
        : ListView(
            children: finishedTasks.map((Task task) => MyDayTaskItem(
              taskId: task.id,
              title: task.title,
              checked: task.checked,
            )).toList()
          ),
    );
  }
}