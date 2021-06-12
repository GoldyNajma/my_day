import 'package:flutter/material.dart';

class MyDayOverscrollGlowDisallower extends StatelessWidget {
  final Widget child;

  const MyDayOverscrollGlowDisallower({ 
    Key? key, 
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => NotificationListener<OverscrollIndicatorNotification>(
    onNotification: (overscroll) {
      overscroll.disallowGlow();
      return false;
    },
    child: this.child,
  );
}