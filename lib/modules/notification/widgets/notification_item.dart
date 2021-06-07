import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:intl/intl.dart';
import 'package:my_day/common/my_day_colors.dart';

class NotificationItem extends StatelessWidget {
  final DateTime dateTime;
  final String notification;
  final String description;

  const NotificationItem({ 
    Key? key, 
    required this.dateTime, 
    required this.notification, 
    required this.description,  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String hourString = DateFormat('HH.mm').format(this.dateTime);

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 7, 13, 7),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: const Icon(Boxicons.bx_task,
                color: MyDayColors.black,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(this.notification, style: const TextStyle(
                    color: MyDayColors.black,
                    fontFamily: 'Rubik',
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                  )),
                  Text(this.description, style: const TextStyle(
                    color: MyDayColors.grey,
                    fontFamily: 'Rubik',
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                  )),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(hourString, style: const TextStyle(
                color: MyDayColors.black,
                fontFamily: 'Rubik',
                fontSize: 11,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
              )),
            ),
          ],
        ),
      ),
    );
  }
}