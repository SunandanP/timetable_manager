import 'package:flutter/material.dart';

class DText extends StatelessWidget {
  DText({required this.text, required this.head});
  String text;
  double head;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      fontSize: head,
      fontWeight: FontWeight.w400
    ),);
  }
}
