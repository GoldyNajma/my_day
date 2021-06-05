import 'package:flutter/material.dart';
import 'package:my_day/modules/sign_in/sign_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Day',
      home: SafeArea(
        child: SignInScreen(),
      ),
    );
  }
}