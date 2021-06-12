import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_day/data/models/task.dart';
import 'package:my_day/utils/widgets/task_dialogs/my_day_task_description_field.dart';
import 'package:my_day/utils/widgets/task_dialogs/my_day_task_title_field.dart';

import 'my_day_delete_task_dialog.dart';
import 'my_day_share_task_dialog.dart';

class MyDayTaskDialog extends StatefulWidget {
  final int? taskId;

  MyDayTaskDialog({ 
    Key? key,
    this.taskId,
  }) : super(key: key);

  @override
  _MyDayTaskDialogState createState() => _MyDayTaskDialogState();
}

class _MyDayTaskDialogState extends State<MyDayTaskDialog> {
  late Task? _task = _getSampleTaskById(widget.taskId);
  late var _titleController = TextEditingController(text: _task?.title);
  late var _descriptionController = TextEditingController(text: _task?.description);

  Task? _getSampleTaskById(int? id) => id == null ? null : Task(
    id: id,
    title: 'Learning Flutter',
    checked: false,
    description: 'Learning Flutter\n' * 10,
  );

  void _onCancelPressed(BuildContext context) {
    print('_onCancelPressed');
    Navigator.pop(context, false);
  }

  void _onSubmitPressed(BuildContext context) {
    print('_onSubmitPressed');

    String currentTitle = _titleController.text;
    String currentDescription = _descriptionController.text;
    bool submitTask = false;
    print('currentTitle: $currentTitle');
    print('currentDescription: $currentDescription');

    if (currentTitle.isNotEmpty || currentDescription.isNotEmpty) {
      submitTask = true;
    } 
    Navigator.pop(context, submitTask);
  }

  void _onSharePressed(BuildContext context) async { 
    print('_onSharePressed');
    Navigator.pop(context);
    await showDialog(
      context: context,
      builder: (_) => MyDayShareTaskDialog(taskId: _task!.id),
    );
  }

  void _onDeletePressed(BuildContext context) async {
    print('_onDeletePressed');
    Navigator.pop(context);
    await showDialog(
      context: context,
      builder: (_) => MyDayDeleteTaskDialog(
        taskId: _task!.id,
        checked: _task!.checked,
      ),
    );
  }

  Widget _buildDeleteTaskButton(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    
    return GestureDetector(
      onTap: () => _onDeletePressed(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Boxicons.bx_trash_alt, size: 16),
          const SizedBox(width: 7),
          Text('Delete your task?', style: themeData.textTheme.bodyText1!.apply(
            color: themeData.errorColor,
          )),
        ],
      ),
    );
  }
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String initialTitle = _titleController.text;
    String initialDescription = _descriptionController.text;
    DialogTheme dialogTheme = Theme.of(context).dialogTheme;
    List<Widget> dialogColumnChildren = [];
    List<Widget> dialogActions = [GestureDetector(
      onTap: () => _onSubmitPressed(context),
      child: const Icon(Boxicons.bx_check, size: 21),
    )];
    bool initialValueIsNotEmpty = initialTitle.isNotEmpty || initialDescription.isNotEmpty;

    print('initialTitle: $initialTitle');
    print('initialDescription: $initialDescription');

    if (initialValueIsNotEmpty) {
      dialogActions.add(const SizedBox(width: 24));
      dialogActions.add(GestureDetector(
        onTap: () => _onSharePressed(context),
        child: const Icon(Boxicons.bxs_share_alt, size: 18), 
      ));
    }

    dialogColumnChildren.addAll([
      Row(children: [
        GestureDetector(
          onTap: () => _onCancelPressed(context),
          child: const Icon(Boxicons.bx_arrow_back, size: 21), 
        ),
        Expanded(child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: dialogActions,
        )),
      ]),
      const SizedBox(height: 21),
      MyDayTaskTitleField(controller: _titleController),
      const SizedBox(height: 21),
      MyDayTaskDescriptionField(controller: _descriptionController),
    ]);

    if (initialValueIsNotEmpty) {
      dialogColumnChildren.add(const SizedBox(height: 21));
      dialogColumnChildren.add(Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [ _buildDeleteTaskButton(context), ],
      ));
    }

    return Dialog(
      backgroundColor: dialogTheme.backgroundColor,
      shape: dialogTheme.shape,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(23),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: dialogColumnChildren,
          ),
        ),
      ),
    );
  }
}