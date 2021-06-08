import 'package:flutter/material.dart';
import 'package:my_day/common/my_day_colors.dart';
import 'package:my_day/modules/sign_in/widgets/my_day_logo.dart';
import 'package:my_day/modules/sign_in/widgets/sign_in_form.dart';
import 'package:my_day/modules/sign_up/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyDayColors.white,
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
              children: <Widget>[
                const SizedBox(height: 44),
                const MyDayLogo(),
                const SizedBox(height: 41),
                const SignInForm(),
                const SizedBox(height: 14),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text("Don't have an account?",
                      style: const TextStyle(
                        color: MyDayColors.black,
                        fontFamily: 'Ropa Sans',
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 7),
                    TextButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(
                        builder: (_) => const SignUpScreen()
                      )),
                      child: const Text('SIGN UP', style: const TextStyle(
                        color: MyDayColors.black,
                        fontFamily: 'Rubik',
                        fontSize: 13,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                      )),
                    ),
                  ],
                ),
                const SizedBox(height: 72),
              ],
            ),
          ),
        ),
      ),
    );
  }
}