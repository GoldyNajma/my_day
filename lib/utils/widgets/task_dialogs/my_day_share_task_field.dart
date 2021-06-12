import 'package:flutter/material.dart';
import 'package:my_day/common/constants.dart';
import 'package:my_day/common/my_day_colors.dart';

class MyDayShareTaskField extends StatelessWidget {
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;

  const MyDayShareTaskField({ 
    Key? key, 
    this.controller, 
    this.autovalidateMode 
  }) : super(key: key);

  String? _validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Required field.';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Should be a valid email format.';
    }
    return null;
  }

  InputBorder _buildInputBorder(Color color) => UnderlineInputBorder(
    borderSide: BorderSide(color: color, width: 1),
  );

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    InputBorder normalInputBorder = _buildInputBorder(MyDayColors.black);
    InputBorder errorInputBorder = _buildInputBorder(themeData.errorColor);

    return TextFormField(
      controller: controller,
      validator: _validateEmail,
      autovalidateMode: autovalidateMode,
      keyboardType: TextInputType.emailAddress,
      style: textTheme.bodyText2,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.all(4),
        border: normalInputBorder,
        enabledBorder: normalInputBorder,
        focusedBorder: normalInputBorder,
        errorBorder: errorInputBorder,
        errorStyle: textTheme.bodyText2!.apply(
          color: themeData.errorColor,
          fontSizeDelta: -2
        ),
        focusedErrorBorder: errorInputBorder,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('To: ', style: textTheme.bodyText2!.apply(
              color: MyDayColors.darkGrey,
              fontFamily: 'Ropa Sans',
            )),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}