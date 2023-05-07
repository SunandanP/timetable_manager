import 'package:flutter/material.dart';
import 'package:timetable_manager/Components/Input/TextArea.dart';
import 'package:timetable_manager/Components/Specifics/DText.dart';

class ModalExisting {


  dynamic generate(BuildContext context,
      {String teacherName = "", int workingHours = 0}) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return ModalData();
      },
    );
  }
}

class ModalData extends StatefulWidget {
  const ModalData({Key? key}) : super(key: key);

  @override
  State<ModalData> createState() => _ModalDataState();
}

class _ModalDataState extends State<ModalData> {
  TextArea name = TextArea(label: "Teacher's Name", id: "name");
  TextArea workhr = TextArea(label: "Working Hours", id: "whr");
  String? selectedValue;
  static const List<String> clasec = <String>[
    'SE-IT-A',
    'SE-IT-B',
    'TE-IT',
    'BE-IT'
  ];
  static const List<String> sem = <String>['1', '2'];
  static const List<String> subjectsSEsem1 = <String>[
    'OOP',
    'DSA',
    'LDCO',
    'DM',
    'BCN',
  ];

  static const List<String> subjectsSEsem2 = ['CG', 'DBMS', 'PA', 'M3', 'SE'];

  @override
  Widget build(BuildContext context) {
    String teacherName = "";
    int workingHours = 0;
    name.controller.text = teacherName;
    if (workingHours != 0) {
      workhr.controller.text = "$workingHours";
    }
    String classVal = "", semVal = "";
    return Container(
      height: 450,
      child: Center(
        child: Container(
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    margin: EdgeInsets.all(20),
                    child: DText(
                        text: (teacherName != "")
                            ? "Update existing teacher"
                            : "Add a new teacher",
                        head: 20)),
              ]),
              Container(child: name, height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100,
                      child: Container(
                        child: workhr,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: DropdownButtonFormField(
                        onChanged: (value) {
                          setState(() {
                            classVal = value!;
                          });
                        },
                        items: clasec
                            .map((value) => DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        ))
                            .toList(),
                        elevation: 4,
                        decoration: InputDecoration(
//Add isDense true and zero Padding.
//Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                            isDense: true,
                            contentPadding: EdgeInsets.all(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
//Add more decoration as you want here
//Add label If you want but add hint outside the decoration to be aligned in the button perfectly
                            prefixIcon: const Icon(
                                Icons.view_timeline_outlined,
                                size: 16),
                            fillColor: Colors.white),
                        isExpanded: true,
                        hint: const Text(
                          'Class',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.center,
                      child: DropdownButtonFormField(
                        onChanged: (value) {
                          setState(() {
                            semVal = value!;
                          });
                        },
                        items: sem
                            .map((value) => DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        ))
                            .toList(),
                        elevation: 4,
                        decoration: InputDecoration(
//Add isDense true and zero Padding.
//Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                            isDense: true,
                            contentPadding: EdgeInsets.all(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
//Add more decoration as you want here
//Add label If you want but add hint outside the decoration to be aligned in the button perfectly
                            prefixIcon: const Icon(
                                Icons.view_timeline_outlined,
                                size: 16),
                            fillColor: Colors.white),
                        isExpanded: true,
                        hint: Text(
                          'Semester',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: DropdownButtonFormField(
                  onChanged: (value) {},
                  items:
                  (((classVal == "SE-IT-A" || classVal == "SE-IT-B") &&
                      semVal == "1")
                      ? subjectsSEsem1
                      : subjectsSEsem2)
                      .map((value) => DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  ))
                      .toList(),
                  elevation: 4,
                  decoration: InputDecoration(
//Add isDense true and zero Padding.
//Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                      isDense: true,
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
//Add more decoration as you want here
//Add label If you want but add hint outside the decoration to be aligned in the button perfectly
                      prefixIcon: const Icon(Icons.book, size: 16),
                      fillColor: Colors.white),
                  isExpanded: true,
                  hint: Text(
                    'Subject',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ) ,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Close",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

