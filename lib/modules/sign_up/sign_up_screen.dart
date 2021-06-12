import 'package:flutter/material.dart';
import 'package:my_day/modules/sign_up/widgets/sign_up_form.dart';
import 'package:my_day/utils/widgets/my_day_back_app_bar.dart';
import 'package:my_day/utils/widgets/my_day_overscroll_glow_disallower.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const MyDayBackAppBar(),
      body: MyDayOverscrollGlowDisallower(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18, 
              vertical: 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 45),
                Text('SIGN UP', style: textTheme.headline6),
                const SizedBox(height: 6),
                Text('Create an account so you can manage your day with My Day', 
                  style: textTheme.overline,
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