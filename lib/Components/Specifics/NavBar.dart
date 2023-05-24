import 'package:timetable_manager/Data.dart';

import '../Timetables/ClassTimetable.dart';
import '../Timetables/DepartmentTimetable.dart';
import '../Timetables/TeacherTimetable.dart';
import 'package:flutter/material.dart';
import 'package:timetable_manager/Components/Input/Screens/TeacherData.dart';
import 'package:timetable_manager/Components/Specifics/DText.dart';
import 'package:timetable_manager/Components/Input/Screens/InfraData.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key, required this.page}) : super(key: key);
  int page = 0;
  Data data = Data();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              accountName: DText(
                  text: "INTERNATIONAL INSTITUTE\nOF INFORMATION TECHNOLOGY",
                  head: 17),
              accountEmail: DText(
                  text: "Department of Information Technology", head: 15)),
          ListTile(
            leading: Icon(Icons.book_outlined),
            title: DText(text: "Class Timetabels", head: 18),
            onTap: () {
              if (page != 0) {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ClassTimetable(data: data,)));
                page = 0;
                print("page : $page");
              } else {
                print("else : $page");
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: DText(text: "Department Timetabels", head: 18),
            onTap: () {
              if (page != 1) {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => DepartmentTimetable(),
                  ),

                );
                page = 1;
                print("page : $page");
              } else {
                print("else : $page");
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: DText(text: "Teacher's Timetabels", head: 18),
            onTap: () {
              if (page != 2) {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => TeacherTimetable(
                              teacherName: "SS",
                              teacherPosition: 1,
                            )));
                page = 2;
                print("page : $page");
              } else {
                print("else : $page");
              }
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add),
            title: DText(text: "Teacher Data", head: 18),
            onTap: () {
              if (page != 3) {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => TeacherData()));
                page = 3;
                print("page : $page");
              } else {
                print("else : $page");
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: DText(text: "Infrastructure Data", head: 18),
            onTap: () {
              if (page != 4) {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => InfraData()));
                page = 4;
                print("page : $page");
              } else {
                print("else : $page");
              }
            },
          ),
        ],
      ),
    );
  }
}
