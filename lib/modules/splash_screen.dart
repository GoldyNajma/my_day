import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_day/modules/home/home_screen.dart';
import 'package:my_day/modules/sign_in/sign_in_screen.dart';
import 'package:my_day/modules/sign_in/sign_in_view_model.dart';
import 'package:my_day/modules/sign_in/widgets/my_day_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 3000), () {
      SignInViewModel.instance.readAuthorizationToken()
        .then((_) => Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        )))
        .catchError((_) => Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        )));
    });

    return Scaffold(
      body: const Center(
        child: const MyDayLogo(),
      ),
    );
  }
}