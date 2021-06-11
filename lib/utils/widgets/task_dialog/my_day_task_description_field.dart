import 'package:flutter/material.dart';
import 'package:my_day/common/my_day_colors.dart';

class MyDayTaskDescriptionField extends StatelessWidget {
  final TextEditingController? controller;

  const MyDayTaskDescriptionField({ 
    Key? key, 
    this.controller, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Task Description', style: textTheme.bodyText2!.apply(
          color: MyDayColors.darkGrey,
        )),
        const SizedBox(height: 9),
        Card(
          child: TextField(
            minLines: 5,
            maxLines: null,
            controller: controller,
            keyboardType: TextInputType.multiline,
            style: textTheme.bodyText2,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}