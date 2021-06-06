import 'package:flutter/material.dart';
import 'package:my_day/common/my_day_colors.dart';

class MyDayTextFormField extends StatelessWidget {
  final String label;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  
  const MyDayTextFormField({ 
    Key? key, 
    required this.label,  
    this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon, 
    this.autovalidateMode,
  }) : super(key: key);

  InputBorder _buildInputBorder(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: color),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(this.label, style: const TextStyle(
          color: MyDayColors.darkGrey,
          fontFamily: 'Ropa Sans',
          fontSize: 18,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
        )),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          autovalidateMode: autovalidateMode,
          decoration: InputDecoration(
            filled: true,
            fillColor: MyDayColors.lightGrey,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.all(20),
            border: InputBorder.none,
            enabledBorder: _buildInputBorder(Colors.transparent),
            errorBorder: _buildInputBorder(MyDayColors.red),
            focusedBorder: _buildInputBorder(Colors.transparent),
            focusedErrorBorder: _buildInputBorder(MyDayColors.red),
          ),
        ),
      ],
    );
  }
}