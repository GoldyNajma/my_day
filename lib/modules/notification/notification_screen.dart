import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_day/common/my_day_colors.dart';
import 'package:my_day/data/models/notification/notification_datum.dart';
import 'package:my_day/modules/notification/widgets/notification_group.dart';
import 'package:my_day/modules/notification/widgets/notification_item.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({ Key? key }) : super(key: key);
  
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final DateTime now = DateTime.now();
  late List<NotificationDatum> notifications;

  List<NotificationDatum> _getSampleNotifications() {
    final Random random = Random();
    final NotificationDatum Function(int) generator = (int index) => NotificationDatum(
      date: now.subtract(Duration(
        hours: random.nextInt(12) * index,
        minutes: random.nextInt(59),
      )),
      title: 'You have a new shared task',
      description: 'from: user$index@gmail.com',
    );

    return List.generate(12, generator);
  }
  
  List<List<NotificationDatum>> _getGroupedNotifications(
      List<NotificationDatum> notifications) {
    List<List<NotificationDatum>> groupedNotifications = [];
    List<int> differentDayIndex = [];

    differentDayIndex.add(0);
    for (int i = 0; i < notifications.length - 1; i++) {
      DateTime currentNotificationDate = notifications[i].date;
      DateTime nextNofificationDate = notifications[i + 1].date;
      bool currentDateIsSameDayAsNextDate = 
          currentNotificationDate.day == nextNofificationDate.day &&
          currentNotificationDate.month == nextNofificationDate.month &&
          currentNotificationDate.year == nextNofificationDate.year;

      if (!currentDateIsSameDayAsNextDate) {
        differentDayIndex.add(i + 1);
      }
    }

    if (differentDayIndex.length > 1) {
      for (int i = 0; i < differentDayIndex.length - 1; i++) {
        int currentDayIndex = differentDayIndex[i];
        int nextDayIndex = differentDayIndex[i + 1];
        List<NotificationDatum> groupedNotification = notifications
            .skip(currentDayIndex)
            .take(nextDayIndex - currentDayIndex)
            .toList();

        groupedNotifications.add(groupedNotification);

        if (i == differentDayIndex.length - 2) {
          List<NotificationDatum> lastGroupedNotification = notifications
              .skip(nextDayIndex)
              .toList();

          groupedNotifications.add(lastGroupedNotification);
        }
      }
    } else {
      groupedNotifications.add(notifications);
    }

    return groupedNotifications;
  }

  @override
  void initState() {
    notifications = _getSampleNotifications();
    if (notifications.isNotEmpty) {
      notifications.sort((a, b) => b.date.compareTo(a.date));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<List<NotificationDatum>> groupedNotifications = _getGroupedNotifications(notifications);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyDayColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Boxicons.bx_arrow_back),
          onPressed: () => Navigator.pop(context),
          color: MyDayColors.black,
          iconSize: 32,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Notification', style: const TextStyle(
              color: MyDayColors.darkGrey,
              fontFamily: 'Rubik',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            )),
            const SizedBox(height: 4),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                  return false;
                },
                child: ListView(
                  children: groupedNotifications
                    .map((groupedNotification) => NotificationGroup(
                        dateTime: groupedNotification[0].date,
                        notificationItems: groupedNotification
                            .map((notification) => NotificationItem(
                                dateTime: notification.date,
                                notification: notification.title,
                                description: notification.description,
                            )).toList()
                    )).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}