import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_day/common/my_day_colors.dart';
import 'package:my_day/modules/sign_up/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return false;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18, 
              vertical: 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                const SizedBox(height: 45),
                const Text('SIGN UP', style: const TextStyle(
                  color: MyDayColors.black,
                  fontFamily: 'Rubik',
                  fontSize: 24,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                )),
                const SizedBox(height: 6),
                const Text('Create an account so you can manage your day with My Day', 
                  style: const TextStyle(
                    color: MyDayColors.black,
                    fontFamily: 'Rubik',
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 36),
                const SignUpForm(),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}