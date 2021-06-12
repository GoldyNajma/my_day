import 'package:flutter/material.dart';
import 'package:my_day/common/my_day_colors.dart';

class NoFinishedTaskWidget extends StatelessWidget {
  const NoFinishedTaskWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('No finished tasks yet!', style: textTheme.caption!.apply(
          color: MyDayColors.grey,
        )),
        const SizedBox(height: 30),
        Image.asset('assets/images/no_finished_task.png', width: 257, height: 236),
        const SizedBox(height: 30),
        Text('“Let me know what tasks are completed”', style: textTheme.bodyText2!.apply(
          color: MyDayColors.grey,
        )),
      ],
    );
  }
}