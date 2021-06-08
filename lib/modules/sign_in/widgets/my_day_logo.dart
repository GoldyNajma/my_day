import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_day/common/my_day_colors.dart';

class MyDayLogo extends StatelessWidget {
  const MyDayLogo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch, 
        children: <Widget>[
          const Text('My \nDay', style: const TextStyle(
            color: MyDayColors.blue,
            fontFamily: 'Rubik',
            fontSize: 72,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w900,
          )),
          const SizedBox(width: 14),
          Container(
            alignment: Alignment.bottomLeft,
            child: const Icon(Boxicons.bxs_check_circle, 
              size: 76, 
              color: MyDayColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}