import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_day/common/my_day_colors.dart';
import 'package:my_day/modules/notification/widgets/notification_item.dart';

class NotificationGroup extends StatelessWidget {
  final DateTime dateTime;
  final List<NotificationItem> notificationItems;

  const NotificationGroup({ 
    Key? key, 
    required this.dateTime, 
    required this.notificationItems, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String dateString = DateFormat('E, dd MMM y').format(this.dateTime);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(dateString, style: const TextStyle(
            color: MyDayColors.black,
            fontFamily: 'Rubik',
            fontSize: 14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
          )),
          const SizedBox(height: 5),
          Card(
            color: MyDayColors.lightGrey,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide.none,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
            child: Column(children: this.notificationItems),
          ),
        ],
      ),
    );
  }
}