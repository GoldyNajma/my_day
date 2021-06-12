import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_day/common/my_day_colors.dart';
import 'package:my_day/utils/widgets/my_day_text_form_field.dart';

class MyDayPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  
  const MyDayPasswordField({ 
    Key? key, 
    this.controller, 
    this.autovalidateMode, 
  }) : super(key: key);

  @override
  _MyDayPasswordFieldState createState() => _MyDayPasswordFieldState();
}

class _MyDayPasswordFieldState extends State<MyDayPasswordField> {
  bool _passwordHidden = true;

  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Required field.';
    } else if (password.length < 8) {
      return 'Should be at least 8 characters long.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MyDayTextFormField(
      label: 'Password',
      controller: widget.controller,
      autovalidateMode: widget.autovalidateMode,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _passwordHidden,
      validator: _validatePassword,
      suffixIcon: IconButton(
        icon: Icon(_passwordHidden ? Boxicons.bxs_show : Boxicons.bxs_hide),
        onPressed: () => setState(() => _passwordHidden = !_passwordHidden),
        color: MyDayColors.black,
        iconSize: 20,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    );
  }
}