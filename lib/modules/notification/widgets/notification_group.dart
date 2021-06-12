import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(dateString, style: textTheme.bodyText2),
          const SizedBox(height: 5),
          Card(child: Column(children: this.notificationItems)),
        ],
      ),
    );
  }
}