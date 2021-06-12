import 'package:flutter/material.dart';
import 'package:my_day/common/my_day_colors.dart';

class MyDayTaskTitleField extends StatelessWidget {
  final TextEditingController? controller;

  const MyDayTaskTitleField({ 
    Key? key, 
    this.controller, 
  }) : super(key: key);

  InputBorder _buildInputBorder(Color color) => UnderlineInputBorder(
    borderSide: BorderSide(color: color, width: 1),
  );

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    InputBorder normalInputBorder = _buildInputBorder(MyDayColors.black);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Task Title', style: textTheme.bodyText2!.apply(
          color: MyDayColors.darkGrey,
        )),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          style: textTheme.bodyText2,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.all(2),
            border: normalInputBorder,
            enabledBorder: normalInputBorder,
            focusedBorder: normalInputBorder,
          ),
        ),
      ],
    );
  }
}