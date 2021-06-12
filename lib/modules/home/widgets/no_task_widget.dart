import 'package:flutter/material.dart';
import 'package:my_day/common/my_day_colors.dart';

class NoTaskWidget extends StatelessWidget {
  const NoTaskWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('No tasks yet!', style: textTheme.caption!.apply(
          color: MyDayColors.grey,
        )),
        const SizedBox(height: 32),
        Image.asset('assets/images/no_task.png', width: 181, height: 185),
        const SizedBox(height: 32),
        Text('“Get things done with My Day, \na list that refreshes every day”', 
          style: textTheme.bodyText2!.apply(
            color: MyDayColors.grey,
          ),
        ),
      ],
    );
  }
}