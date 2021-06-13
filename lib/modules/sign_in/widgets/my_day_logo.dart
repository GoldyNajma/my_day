import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class MyDayLogo extends StatelessWidget {
  const MyDayLogo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;

    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch, 
        children: <Widget>[
          Text('My \nDay', style: textTheme.headline1!.apply(
            color: themeData.accentColor,
            fontStyle: FontStyle.italic,
          )),
          const SizedBox(width: 14),
          Container(
            alignment: Alignment.bottomLeft,
            child: Icon(Boxicons.bxs_check_circle, 
              size: 76, 
              color: themeData.accentColor,
            ),
          ),
        ],
      ),
    );
  }
}