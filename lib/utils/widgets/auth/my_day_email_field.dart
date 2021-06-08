import 'package:flutter/material.dart';
import 'package:my_day/common/constants.dart';
import 'package:my_day/common/my_day_colors.dart';
import 'package:my_day/utils/widgets/my_day_text_form_field.dart';

class MyDayEmailField extends StatelessWidget {
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;

  const MyDayEmailField({ 
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

  @override
  Widget build(BuildContext context) {
    return MyDayTextFormField(
      label: 'Email',
      controller: controller,
      autovalidateMode: autovalidateMode,
      keyboardType: TextInputType.emailAddress,
      validator: _validateEmail,
      suffixIcon: const Icon(Icons.mail_rounded,
        color: MyDayColors.black,
        size: 20,
      ),
    );
  }
}