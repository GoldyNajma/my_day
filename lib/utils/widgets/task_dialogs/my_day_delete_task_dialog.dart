import 'package:flutter/material.dart';
import 'package:my_day/common/my_day_colors.dart';
import 'package:my_day/utils/widgets/task_dialogs/my_day_task_dialog.dart';

class MyDayDeleteTaskDialog extends StatelessWidget {
  final int taskId;
  final bool checked;

  const MyDayDeleteTaskDialog({ 
    Key? key, 
    required this.taskId, 
    required this.checked,
  }) : super(key: key);

  void _onConfirmDeletePressed(BuildContext context) {
    print('_onConfirmDeletePressed');
    Navigator.pop(context);
  }

  void _onCancelDeletePressed(BuildContext context) async {
    print('_onCancelDeletePressed');
    Navigator.pop(context);
    if (!checked) {
      await showDialog(
        context: context,
        builder: (_) => MyDayTaskDialog(taskId: this.taskId),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String warningText = 'Are you sure you want to delete your ' 
      + (this.checked ? 'finished ': '') 
      + 'task ?';
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    TextButton confirmDeleteButton = TextButton(
      onPressed: () => _onConfirmDeletePressed(context), 
      child: Text('Yes', style: textTheme.bodyText1!.apply(
        color: MyDayColors.green,
      )),
    );
    TextButton cancelDeleteButton = TextButton(
      onPressed: () => _onCancelDeletePressed(context), 
      child: Text('No', style: textTheme.bodyText1!.apply(
        color: themeData.errorColor,
      )),
    );

    print('MyDayDeleteTaskDialog(taskId: $taskId, checked: $checked');

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(23),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(warningText, style: textTheme.bodyText2),
            const SizedBox(height: 12),
            const Divider(color: MyDayColors.black, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    confirmDeleteButton,
                    cancelDeleteButton,
                  ],
                )
              ]
            )
          ],
        ),
      )
    );
  }
}