import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_day/data/models/task.dart';
import 'package:my_day/modules/task/task_view_model.dart';
import 'package:my_day/utils/functions.dart';
import 'package:my_day/utils/widgets/my_day_back_app_bar.dart';
import 'package:my_day/utils/widgets/my_day_rounded_button.dart';
import 'package:my_day/utils/widgets/my_day_task_item.dart';

import 'widgets/no_finished_task_widget.dart';

class FinishedTaskScreen extends StatefulWidget {
  const FinishedTaskScreen({ Key? key }) : super(key: key);

  @override
  _FinishedTaskScreenState createState() => _FinishedTaskScreenState();
}

class _FinishedTaskScreenState extends State<FinishedTaskScreen> {
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
  Widget build(BuildContext context) => Scaffold(
    appBar: const MyDayBackAppBar(),
    body: FutureBuilder<List<Task>>(
      future: TaskViewModel.instance.getAllTasksAsList(),
      builder: (futureBuilderContext, snapshot) {
        if (snapshot.hasData) {
          List<Task> tasks = snapshot.data!;
          List<Task> finishedTasks = _getFinishedTasks(tasks); 

          return finishedTasks.isEmpty 
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
              );
        } else if (snapshot.hasError) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showTextOnlySnackBar(
              context: futureBuilderContext, 
              text: 'Failed to load finished tasks.\n${snapshot.error}'
            );
          });
          
          return Center(
            child: MyDayRoundedButton(
              onPressed: () => setState(() {}),
              buttonColor: Theme.of(context).accentColor,
              text: 'Retry load finished tasks',
            )
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    )
  );
}