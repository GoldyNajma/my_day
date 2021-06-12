import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_day/common/my_day_colors.dart';
import 'package:my_day/modules/notification/notification_screen.dart';

class MyDayMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyDayMainAppBar({ 
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ScaffoldState scaffoldState = Scaffold.of(context);

    return AppBar(
      leading: IconButton(
        icon: const Icon(Boxicons.bx_menu),
        onPressed: () { 
          scaffoldState.openDrawer();
        },
        iconSize: 25,
      ),
      title: Text('MY DAY', style: textTheme.headline6!.apply(color: MyDayColors.blue)),
      actions: [
        IconButton(
          icon: const Icon(Boxicons.bxs_bell),
          onPressed: () => Navigator.push(context, MaterialPageRoute(
            builder: (_) => const NotificationScreen(),
          )),
          iconSize: 25,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}