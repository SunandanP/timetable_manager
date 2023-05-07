import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  TextArea({required this.label, required this.id});
  String label, id;
  final controller = TextEditingController();

  String getText() {
    return controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 80,
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            label: Text(
              label,
              style: TextStyle(fontSize: 16),
            )),
        controller: controller,
      ),
    );
  }
}
