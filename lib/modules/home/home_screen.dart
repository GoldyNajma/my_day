import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_day/data/models/task.dart';
import 'package:my_day/modules/home/widgets/drawer/my_day_drawer.dart';
import 'package:my_day/modules/home/widgets/no_task_widget.dart';
import 'package:my_day/modules/task/task_view_model.dart';
import 'package:my_day/utils/functions.dart';
import 'package:my_day/utils/widgets/my_day_main_app_bar.dart';
import 'package:my_day/utils/widgets/my_day_rounded_button.dart';
import 'package:my_day/utils/widgets/my_day_task_item.dart';
import 'package:my_day/utils/widgets/task_dialogs/my_day_task_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Task> _getUnfinishedTasks(List<Task> tasks) => tasks
    .where((Task task) => !task.checked)
    .toList();

  Widget _buildTaskListWidget(BuildContext context, List<Task> taskList) => taskList.isEmpty 
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
          children: taskList.map((Task task) => MyDayTaskItem(
            taskId: task.id,
            title: task.title,
            checked: task.checked,
            onCheckChanged: (_) => setState(() {}),
            onCheckChangeError: (error) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                showTextOnlySnackBar(
                  context: context, 
                  text: 'Failed to load tasks.\n${error}'
                );
            },
          )).toList()
        );

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TaskViewModel taskViewModel = TaskViewModel.instance;

    return Scaffold(
      appBar: const MyDayMainAppBar(),
      body: RefreshIndicator(
        onRefresh: () async => setState(() {}),
        child: FutureBuilder<List<Task>>(
          future: taskViewModel.getAllTasksAsList(),
          builder: (futureBuilderContext, snapshot) {
            if (snapshot.hasData) {
              List<Task> allTasks = snapshot.data!;
              List<Task> unfinishedTasks = _getUnfinishedTasks(allTasks);

              return _buildTaskListWidget(context, unfinishedTasks);
            } else if (snapshot.hasError) {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                showTextOnlySnackBar(
                  context: futureBuilderContext, 
                  text: 'Failed to load tasks.\n${snapshot.error}'
                );
              });

              return Center(
                child: MyDayRoundedButton(
                  onPressed: () => setState(() {}),
                  buttonColor: themeData.accentColor,
                  text: 'Retry load tasks',
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        ),
      ),
      drawer: const MyDayDrawer(),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        onPressed: () async { 
          bool? newTaskSubmitted = await showDialog<bool>(
            context: context, 
            builder: (_) => MyDayTaskDialog()
          );

          if (!(newTaskSubmitted != null && newTaskSubmitted)) {
            print('Empty task discarded...');
          }
        },
        backgroundColor: themeData.accentColor,
        child: Icon(Boxicons.bx_plus, 
          color: themeData.primaryColor,
          size: 33,
        ),
      ),
    );
  }
}