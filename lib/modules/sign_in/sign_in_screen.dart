import 'package:flutter/material.dart';
import 'package:my_day/modules/home/home_screen.dart';
import 'package:my_day/modules/sign_in/widgets/my_day_logo.dart';
import 'package:my_day/modules/sign_in/widgets/sign_in_form.dart';
import 'package:my_day/modules/sign_up/sign_up_screen.dart';
import 'package:my_day/utils/functions.dart';
import 'package:my_day/utils/widgets/my_day_overscroll_glow_disallower.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: MyDayOverscrollGlowDisallower(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18, 
              vertical: 0,
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 44),
                Row(children: [ 
                  const MyDayLogo(), 
                ]),
                const SizedBox(height: 41),
                Builder(
                  builder: (contextWithScaffold) => SignInForm(
                    onSuccessSignIn: (_) => Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (_) => const HomeScreen(),
                    )),
                    onFailedSignIn: (String error) => showTextOnlySnackBar(
                      context: contextWithScaffold, 
                      text: error,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Don't have an account?",
                      style: textTheme.bodyText2!.apply(
                        fontFamily: 'Ropa Sans',
                        fontSizeDelta: 1,
                      ), 
                    ),
                    const SizedBox(width: 7),
                    TextButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(
                        builder: (_) => const SignUpScreen()
                      )),
                      child: Text('SIGN UP', style: textTheme.button!.apply(
                        fontSizeDelta: -1,
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