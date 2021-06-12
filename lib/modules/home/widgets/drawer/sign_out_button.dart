import 'package:flutter/material.dart';
import 'package:my_day/modules/sign_in/sign_in_screen.dart';
import 'package:my_day/utils/widgets/my_day_rounded_button.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    
    return MyDayRoundedButton(
      buttonColor: themeData.errorColor,
      padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 12),
      text: 'Sign Out',
      onPressed: () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        ), (_) => false);
      }
    );
  }
}