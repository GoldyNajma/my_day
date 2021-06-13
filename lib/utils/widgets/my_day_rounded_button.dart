import 'package:flutter/material.dart';
import 'package:my_day/common/my_day_colors.dart';

class MyDayRoundedButton extends StatelessWidget {
  final void Function() onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? buttonColor;
  final String? text;
  final TextStyle? textStyle;
  final bool isLoading;
  final Color loadingColor;

  const MyDayRoundedButton({ 
    Key? key, 
    required this.onPressed, 
    this.padding, 
    this.buttonColor, 
    this.text, 
    this.textStyle, 
    this.isLoading = false,
    this.loadingColor = MyDayColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        padding: padding,
        primary: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ).merge(ButtonStyle(
        elevation: MaterialStateProperty.resolveWith<double>((_) => 0),
      )),
      child: isLoading 
        ? CircularProgressIndicator(color: loadingColor)
        : Text(text ?? '', style: textTheme.button!.apply(
          color: MyDayColors.white,
        ).merge(this.textStyle))
    );
  }
}