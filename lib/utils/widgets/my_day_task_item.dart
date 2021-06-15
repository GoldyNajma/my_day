import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_day/data/models/request_body/update_task_check_request_body.dart';
import 'package:my_day/modules/task/task_view_model.dart';
import 'package:my_day/utils/widgets/task_dialogs/my_day_delete_task_dialog.dart';

import 'task_dialogs/my_day_task_dialog.dart';

class MyDayTaskItem extends StatelessWidget {
  final int taskId;
  final String title;
  final bool checked;
  final void Function(String message)? onCheckChanged;
  final void Function(String message)? onCheckChangeError;

  const MyDayTaskItem({ 
    Key? key, 
    required this.taskId, 
    required this.title, 
    required this.checked, 
    this.onCheckChanged,
    this.onCheckChangeError,
  }) : super(key: key);

  void _onDeletePressed(BuildContext context) async {
    await showDialog(
      context: context, 
      builder: (_) => MyDayDeleteTaskDialog(
        taskId: taskId, 
        checked: checked,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    List<Widget> rowChildren = <Widget>[
      IconButton(
        icon: Icon(this.checked ? Boxicons.bxs_check_circle : Boxicons.bx_radio_circle,
          size: this.checked ? 25 : 35),
        color: themeData.accentColor,
        onPressed: () {
          UpdateTaskCheckRequestBody requestBody = UpdateTaskCheckRequestBody(
            checked: this.checked ? 'no' : 'yes',
          );
          TaskViewModel.instance.updateCheckTask(this.taskId, requestBody)
            .then((message) {
              if (onCheckChanged != null) {
                onCheckChanged!(message);
              }
              print(message);
            })
            .catchError((error) {
              if (onCheckChangeError != null) {
                onCheckChangeError!(error);
              }
              print(error);
            });
        }
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Text(this.title.isEmpty ? '<Untitled Task>' : this.title, 
          style: textTheme.bodyText1!.apply(
            fontStyle: this.title.isEmpty 
              ? FontStyle.italic 
              : FontStyle.normal,
          ), 
          maxLines: 2, 
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ];

    if (this.checked) {
      rowChildren.add(IconButton(
        icon: const Icon(Boxicons.bx_trash_alt),
        iconSize: 20,
        onPressed: () => _onDeletePressed(context),
      ));
    }

    return InkWell(
      onTap: () async { 
        bool? editTaskSubmitted = await showDialog<bool>(
          context: context, 
          builder: (_) => MyDayTaskDialog(taskId: taskId),
        );

        if (!(editTaskSubmitted != null && editTaskSubmitted)) {
          print('Edit task canceled...');
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Row(
          children: rowChildren,
        ),
      ),
    );
  }
}