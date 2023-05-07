import 'package:timetable_manager/Components/LectureCard.dart';
import 'package:timetable_manager/Logic/Allocation.dart';
import 'package:timetable_manager/Logic/TheoryAllocation.dart';
import 'package:flutter/material.dart';


class AllocationCard extends StatelessWidget {
  List<Allocation> alloctions;
  String day;

  AllocationCard({required this.day, required this.alloctions});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SlotCard(flex: 1, text: day),
          ...alloctions.map((e){
            if(e.runtimeType != TheoryAllocation().runtimeType){
              return LabCard(flex: 2, text: e.stringRep());
            }
            else
              return LectureCard(flex: 1, text: e);
          })
          // LectureCard(flex: 1, text: "text"),
        ],),
    );
  }
}


class TeacherAllocationCard extends StatelessWidget {
  List<Allocation> alloctions;
  String day;
  String teacherName;

  TeacherAllocationCard({required this.day, required this.alloctions, required this.teacherName});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SlotCard(flex: 1, text: day),
          ...alloctions.map((e){
            if(e.runtimeType != TheoryAllocation().runtimeType){
              for(int i = 0; i < 3; i++){
                if(e.stringRep()[i].contains(teacherName)){
                  return SlotCard(flex: 2, text: e.stringRep()[i]);
                }
              }
              return SlotCard(flex: 2, text: "Not Found!");

            }
            else
              return LectureCard(flex: 1, text: e);
          })
          // LectureCard(flex: 1, text: "text"),
        ],),
    );
  }
}

