import 'package:flutter/material.dart';
import 'package:timetable_manager/Components/Input/ModalExisting.dart';
import 'package:timetable_manager/Components/Input/TeacherListItem.dart';
import 'package:timetable_manager/Components/Input/TextArea.dart';
import 'package:timetable_manager/Components/Specifics/NavBar.dart';

class InfraData extends StatelessWidget {
  TextArea name = TextArea(label: "Teacher's Name", id: "name");
  TextArea workhr = TextArea(label: "Working Hours", id: "whr");
  String? selectedValue;
  static const List<String> clasec = <String>['SE-IT-A', 'SE-IT-B', 'TE-IT', 'BE-IT'];
  static const List<String> sem = <String>['1', '2'];
  static const List<String> subjects = <String>['OOP', 'CG','DSA','LDCO','DM','BCN','DBMS','PA','M3','SE'];
  int cardNo = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: RepaintBoundary(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              ModalExisting().generate(context);
            },
          ),
          drawer: NavBar(page: 4,),
          appBar: AppBar(

            title: Text("Teacher Input Module"),
          ),
          body: Container(
              child: ListView(
                children: [
                  TeacherListHeader(),
                  TeacherListItem(no: cardNo++, workingHours: 12, teacherName: "Sarang Saoji"),
                  TeacherListItem(no: cardNo++, workingHours: 12, teacherName: "Sayali Sable"),
                  TeacherListItem(no: cardNo++, workingHours: 12, teacherName: "Prachi Nilekar"),
                ],
                shrinkWrap: true,
              )
          ),
        ),
      ),
    );
  }
}