import 'package:timetable_manager/Components/LectureCard.dart';
import 'package:timetable_manager/Logic/Allocation.dart';
import 'package:timetable_manager/Logic/Teacher.dart';
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
            else{
              if(e.stringRep().toString() != "null null null"){
                return LectureCard(flex: 1, text: e);
              }
              else{
                return Container();
              }

            }


          })
          // LectureCard(flex: 1, text: "text"),
        ],),
    );
  }
}


class TeacherAllocationCard extends StatelessWidget {
  String day;
  Teacher teacher;
  String teacherName;
  int dayNo;


  TeacherAllocationCard({required this.day, required this.teacher, required this.teacherName, required this.dayNo});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SlotCard(flex: 1, text: day),
          ...(teacher.schedule[dayNo]).map((e){
              return TLectureCard(flex: 1, text: e);
          })
          // LectureCard(flex: 1, text: "text"),
        ],),
    );
  }
}

