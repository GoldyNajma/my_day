import 'package:flutter/material.dart';

void showTextOnlySnackBar({
  required BuildContext context, 
  required String text,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}