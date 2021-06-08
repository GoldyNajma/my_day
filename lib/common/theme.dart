import 'package:flutter/material.dart';

import 'my_day_colors.dart';

ThemeData getThemeData() => ThemeData(
  appBarTheme: _getAppBarTheme(),
  cardColor: MyDayColors.brightGrey,
  cardTheme: _getCardTheme(),
  errorColor: MyDayColors.red,
  fontFamily: 'Rubik',
  primaryColor: MyDayColors.blue,
  scaffoldBackgroundColor: MyDayColors.white,
  textSelectionTheme: _getTextSelectionTheme(),
  textTheme: _getTextTheme().apply(
    displayColor: MyDayColors.black, 
    bodyColor: MyDayColors.black,
  ),
  dialogBackgroundColor: MyDayColors.white,
  iconTheme: _getIconTheme(),
);

IconThemeData _getIconTheme() => const IconThemeData(
  color: MyDayColors.black,
);

TextSelectionThemeData _getTextSelectionTheme() => const TextSelectionThemeData(
  cursorColor: MyDayColors.blue,
  selectionHandleColor: MyDayColors.blue,
  selectionColor: MyDayColors.blue,
);

CardTheme _getCardTheme() => const CardTheme(
  color: MyDayColors.brightGrey,
  elevation: 0,
  margin: const EdgeInsets.all(0),
  shape: const RoundedRectangleBorder(
    borderRadius: const BorderRadius.all(const Radius.circular(10)),
    side: BorderSide.none,
  ),
);

AppBarTheme _getAppBarTheme() => AppBarTheme(
  textTheme: _getTextTheme().apply(bodyColor: MyDayColors.black),
  backgroundColor: MyDayColors.white,
  elevation: 0,
  centerTitle: true,
  titleTextStyle: _getTextTheme().headline6!.apply(color: MyDayColors.blue),
  iconTheme: const IconThemeData(color: MyDayColors.black)
);

TextTheme _getTextTheme() => const TextTheme(
  headline1: const TextStyle(fontSize: 72, fontWeight: FontWeight.w900),
  headline6: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
  bodyText1: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
  bodyText2: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  button: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
  caption: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
  overline: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
);