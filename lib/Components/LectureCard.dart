import 'package:flutter/material.dart';
import 'package:timetable_manager/Logic/TheoryAllocation.dart';

import '../Logic/Allocation.dart';

class LectureCard extends StatelessWidget {
  int flex;
  Allocation text;

  LectureCard({super.key, required this.flex, required this.text});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.all(2),
        child: Card(

          margin: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          elevation: 5,
          child: Center(
            heightFactor: 1.5,
            widthFactor: text.stringRep().length*0.63,
            child: Text(
              text.stringRep()[0],
              style: const TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}

class SlotCard extends StatelessWidget {
  int flex;
  String text;

  SlotCard({super.key, required this.flex, required this.text});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.all(2),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          elevation: 5,
          child: Center(
            heightFactor: 1.5,
            widthFactor: text.length*0.63,
            child: Text(
              text,
              style: const TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}

class LabCard extends StatelessWidget {
  int flex;
  List<String> text;

  LabCard({super.key, required this.flex, required this.text});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.all(2),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          elevation: 5,
          child: Center(
            heightFactor: 1.5,
            widthFactor: text.length*0.63,
            child: Column(
              children: [
                ...text.map((e) {
                return Text(e, style: TextStyle( fontSize: 22),);
              })]
            ),
          ),
        ),
      ),
    );
  }
}

