import 'package:flutter/material.dart';
import 'package:my_day/common/my_day_colors.dart';

class MyDayRoundedButton extends StatelessWidget {
  final void Function() onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? buttonColor;
  final String? text;
  final double? textSize;
  final Color? textColor;

  const MyDayRoundedButton({ 
    Key? key, 
    required this.onPressed, 
    this.padding, 
    this.buttonColor, 
    this.text, 
    this.textSize, 
    this.textColor, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        padding: padding,
        primary: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
      ).merge(ButtonStyle(
        elevation: MaterialStateProperty.resolveWith<double>((_) => 0),
      )),
      child: Text(text ?? '', style: TextStyle(
        color: MyDayColors.white,
        fontFamily: 'Rubik',
        fontSize: textSize,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
      ))
    );
  }
}