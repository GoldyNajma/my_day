import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_day/data/models/notification/notification_datum.dart';
import 'package:my_day/modules/notification/widgets/no_notification_widget.dart';
import 'package:my_day/modules/notification/widgets/notification_group.dart';
import 'package:my_day/modules/notification/widgets/notification_item.dart';
import 'package:my_day/utils/widgets/my_day_back_app_bar.dart';

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

    return List.generate(random.nextInt(21), generator);
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
    List<List<NotificationDatum>> groupedNotifications = [];
    final TextTheme textTheme = Theme.of(context).textTheme;

    if (notifications.isNotEmpty) {
      groupedNotifications = _getGroupedNotifications(notifications);
    }

    return Scaffold(
      appBar: const MyDayBackAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 9),
            child: Text('Notification', style: textTheme.headline6),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: groupedNotifications.isEmpty 
              ? MediaQuery.of(context).orientation == Orientation.portrait
                ? const Center(child: const NoNotificationWidget())
                : const SingleChildScrollView(
                    child: const Center(child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                      child: const NoNotificationWidget(),
                    )),
                  )
              : ListView(
                  children: groupedNotifications
                    .map((groupedNotification) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                      child: NotificationGroup(
                        dateTime: groupedNotification[0].date,
                        notificationItems: groupedNotification
                          .map((notification) => NotificationItem(
                            dateTime: notification.date,
                            notification: notification.title,
                            description: notification.description,
                          )).toList()
                      ),
                    )).toList(),
                ),
          ),
        ],
      ),
    );
  }
}