import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class MyDayBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double backArrowIconSize;
  final List<Widget>? actions;

  const MyDayBackAppBar({ 
    Key? key, 
    this.backArrowIconSize = 32, 
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Boxicons.bx_arrow_back),
        onPressed: () => Navigator.pop(context),
        iconSize: this.backArrowIconSize,
      ),
      actions: this.actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}