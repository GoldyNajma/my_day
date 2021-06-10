import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_day/data/models/task.dart';
import 'package:my_day/modules/home/widgets/no_task_widget.dart';
import 'package:my_day/utils/widgets/my_day_main_app_bar.dart';
import 'package:my_day/utils/widgets/my_day_task_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  List<Task> _getSampleTasks() {
    final Random random = Random();

    return List.generate(random.nextInt(31), (index) => Task(
      id: index,
      title: 'Learning Flutter' * (index),
      description: 'Flutter widgets\nMake a simple application',
      checked: random.nextBool(),
    ));
  }

  List<Task> _getUnfinishedTasks(List<Task> tasks) => tasks
    .where((Task task) => !task.checked)
    .toList();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    List<Task> tasks = _getSampleTasks();
    List<Task> unfinishedTasks = _getUnfinishedTasks(tasks); 
    print('tasks.length: ${tasks.length}');
    print('unfinishedTasks.length: ${unfinishedTasks.length}');

    return Scaffold(
      appBar: const MyDayMainAppBar(),
      body: unfinishedTasks.isEmpty 
        ? MediaQuery.of(context).orientation == Orientation.portrait
          ? const Center(child: const NoTaskWidget())
          : const SingleChildScrollView(
              child: const Center(
                child: const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: const NoTaskWidget(),
                ),
              ),
            )
        : ListView(
            children: unfinishedTasks.map((Task task) => InkWell(
              onTap: (){ print('Tapped task id: ${task.id}'); },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: MyDayTaskItem(
                  title: task.title,
                  checked: task.checked,
                ),
              ),
            )).toList()
          ),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        onPressed: () {  },
        backgroundColor: themeData.accentColor,
        child: Icon(Boxicons.bx_plus, 
          color: themeData.primaryColor,
          size: 33,
        ),
      ),
    );
  }
}