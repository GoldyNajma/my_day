import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class MyDayTaskItem extends StatelessWidget {
  final String title;
  final bool checked;

  const MyDayTaskItem({ 
    Key? key, 
    required this.title, 
    required this.checked, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    List<Widget> rowChildren = <Widget>[
      IconButton(
        icon: Icon(this.checked ? Boxicons.bxs_check_circle : Boxicons.bx_radio_circle,
          size: this.checked ? 25 : 35),
        color: themeData.accentColor,
        onPressed: () {},
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Text(this.title.isEmpty ? '<Untitled Task>' : this.title, 
          style: textTheme.bodyText1!.apply(
            fontStyle: this.title.isEmpty 
              ? FontStyle.italic 
              : FontStyle.normal,
          ), 
          maxLines: 2, 
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ];

    if (this.checked) {
      rowChildren.add(IconButton(
        icon: Icon(Boxicons.bx_trash_alt),
        iconSize: 20,
        onPressed: () {},
      ));
    }

    return Row(children: rowChildren);
  }
}