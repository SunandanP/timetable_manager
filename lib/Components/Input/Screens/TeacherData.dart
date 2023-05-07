import 'package:flutter/material.dart';
import 'package:timetable_manager/Components/Input/ModalExisting.dart';
import 'package:timetable_manager/Components/Input/TeacherListItem.dart';

import 'package:timetable_manager/Components/Specifics/NavBar.dart';

class TeacherData extends StatefulWidget {
  const TeacherData({Key? key}) : super(key: key);

  @override
  State<TeacherData> createState() => _TeacherDataState();
}

class _TeacherDataState extends State<TeacherData> {
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
          drawer: NavBar(page: 3,),
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
