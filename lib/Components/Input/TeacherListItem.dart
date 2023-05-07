// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:timetable_manager/Components/Input/ModalExisting.dart';
import 'package:timetable_manager/Logic/Subject.dart';

class TeacherListItem extends StatefulWidget {
   TeacherListItem({Key? key, this.no = 0, this.workingHours = 0, this.teacherName = "", this.sem = 1, this.subjectList = const ["","","",""]}) : super(key: key);
  int no;
  String teacherName;
  int workingHours;
  List<String> subjectList;
  int sem;


  @override
  State<TeacherListItem> createState() => _TeacherListItemState();
}

class _TeacherListItemState extends State<TeacherListItem> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          ModalExisting().generate(context, teacherName: widget.teacherName, workingHours: widget.workingHours);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                    flex: 1, child: Container()),
                Expanded(
                    flex: 1, child: Text("${widget.no}",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500)),),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(widget.teacherName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text("${widget.workingHours}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text("${widget.sem}",
                        textAlign: TextAlign.justify,
                        style: TextStyle(

                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                ),

                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...widget.subjectList.map((e){
                          return Text(
                            e,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          );
                        })
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TeacherListHeader extends StatelessWidget {
  const TeacherListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ElevatedButton(
        onPressed: (){},

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1, child: Container()),
                Expanded(
                  flex: 1, child: Text("Serial No.",
                    textAlign: TextAlign.start,
                    style: TextStyle(

                        fontSize: 20, fontWeight: FontWeight.w500)),),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text("Name",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text("Work Hours \n(Hrs/Week)",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text("Semester",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    child:Text("Subjects",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
