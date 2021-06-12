import 'package:flutter/material.dart';
import 'package:my_day/common/my_day_colors.dart';

class NoNotificationWidget extends StatelessWidget {
  const NoNotificationWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('No notifications yet!', style: textTheme.caption!.apply(
          color: MyDayColors.grey,
        )),
        const SizedBox(height: 20),
        Image.asset('assets/images/no_notification.png', width: 235, height: 281),
        const SizedBox(height: 23),
        Text('"We’ll notify you when something arrives!"', style: textTheme.bodyText2!.apply(
          color: MyDayColors.grey,
        )),
      ],
    );
  }
}