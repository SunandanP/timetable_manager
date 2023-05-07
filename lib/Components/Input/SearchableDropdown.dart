import 'package:flutter/material.dart';

class ChoiceCode extends StatefulWidget {
  ChoiceCode({required this.items, required this.name});
  final List<String> items;
  final String name;

  @override
  State<ChoiceCode> createState() => _ChoiceCodeState();
}

class _ChoiceCodeState extends State<ChoiceCode> {
  final TextEditingController textEditingController = TextEditingController();
  String? selectedValues = "";

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}
