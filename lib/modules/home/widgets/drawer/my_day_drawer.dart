import 'package:flutter/material.dart';
import 'package:my_day/common/my_day_colors.dart';
import 'package:my_day/data/models/user.dart';

import 'finished_task_navigation_widget.dart';
import 'profile_widget.dart';
import 'sign_out_button.dart';

class MyDayDrawer extends StatelessWidget {
  const MyDayDrawer({ Key? key }) : super(key: key);

  User _getSampleUser() => User(
    id: 1,
    name: 'Goldy Najma',
    email: 'najma.goldy354@gmail.com',
  );

  @override
  Widget build(BuildContext context) {
    User user = _getSampleUser();

    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(23),
          child: Column(
            children: <Widget>[
              ProfileWidget(username: user.name, email: user.email),
              const SizedBox(height: 17),
              const Divider(color: MyDayColors.black, thickness: 1),
              const SizedBox(height: 18),
              const FinishedTaskNavigationWidget(),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: const SignOutButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}