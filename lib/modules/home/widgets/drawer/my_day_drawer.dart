import 'package:flutter/material.dart';
import 'package:my_day/common/my_day_colors.dart';
import 'package:my_day/data/models/user.dart';
import 'package:my_day/modules/home/home_view_model.dart';
import 'package:my_day/modules/sign_in/sign_in_screen.dart';
import 'package:my_day/utils/functions.dart';

import 'finished_task_navigation_widget.dart';
import 'profile_widget.dart';
import 'sign_out_button.dart';

class MyDayDrawer extends StatelessWidget {
  const MyDayDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(23),
          child: Column(
            children: <Widget>[
              FutureBuilder<User>(
                future: HomeViewModel.instance.getUserProfile(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    User user = snapshot.data!;

                    return ProfileWidget(
                      username: user.name, 
                      email: user.email
                    );
                  } else if (snapshot.hasError) {
                    return Text('Failed to get profile.\nPlease try again.\n${snapshot.error}', 
                      textAlign: TextAlign.center,
                    );
                  } else {
                    return Container(
                      child: const Center(
                        child: const CircularProgressIndicator(),
                      ),
                    );
                  }
                } 
              ),
              const SizedBox(height: 17),
              const Divider(color: MyDayColors.black, thickness: 1),
              const SizedBox(height: 18),
              const FinishedTaskNavigationWidget(),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: SignOutButton(
                    onSuccessSignOut: (_) => 
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (_) => SignInScreen(),
                      ), (_) => false),
                    onFailedSignOut: (error) => showTextOnlySnackBar(
                      context: context, 
                      text: 'Failed to sign out. Please try again.\n$error'
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}