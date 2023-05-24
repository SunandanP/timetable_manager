import 'package:timetable_manager/Components/AllocationCard.dart';
import 'package:timetable_manager/Components/Specifics/dd.dart';
import 'package:timetable_manager/Logic/Subject.dart';
import 'package:flutter/material.dart';
import 'package:timetable_manager/Logic/Teacher.dart';
import '../LectureCard.dart';
import '../Specifics/NavBar.dart';
import '../headers.dart';
import 'package:logger/logger.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:timetable_manager/Data.dart';

class TeacherTimetable extends StatefulWidget {
  String teacherName;
  int teacherPosition;


  TeacherTimetable({required this.teacherName, required this.teacherPosition});

  @override
  State<StatefulWidget> createState() {
    return _TeacherTimetableState();
  }
}

class _TeacherTimetableState extends State<TeacherTimetable> {
  Teacher teacher = Teacher();
  Data data = Data();

  final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();
  @override
  void _printScreen() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      final image = await WidgetWraper.fromKey(
          key: _printKey, orientation: PdfImageOrientation.topLeft);

      doc.addPage(pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Expanded(
                child: pw.Image(image),
              ),
            );
          }));
      Logger().i("DONE");
      return doc.save();
    });
  }

  @override
  Widget build(BuildContext context) {
    String val = "";
    data.fit();
    teacher = data.getTeacherSchedule[widget.teacherPosition];
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      title: "Timetable Manager",
      home: Scaffold(

        drawer: NavBar(
          page: 2,
        ),
        appBar: AppBar(

          actions: [
            // DD(list: Data().subjects.map((e) => e.name).toList()),
            IconButton(
              onPressed: () {
                _printScreen();
              },
              icon: const Icon(Icons.print),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    data.fit();
                    teacher = data.getTeacherSchedule[widget.teacherPosition];
                  });
                },
                icon: Icon(Icons.refresh))
          ],
          title: Text("Teacher's Timetable"),
        ),
        body: RepaintBoundary(
          key: _printKey,
          child: Container(
            margin: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ...times.map((e) {
                        return SlotCard(flex: 1, text: e);
                      })
                    ],
                  ),
                ),
                TeacherAllocationCard(day: "Monday", teacher: teacher, teacherName: widget.teacherName, dayNo:0),
                TeacherAllocationCard(day: "Tuesday", teacher: teacher,teacherName: widget.teacherName, dayNo:1),
                TeacherAllocationCard(day: "Wednesday", teacher: teacher, teacherName: widget.teacherName, dayNo:2),
                TeacherAllocationCard(day: "Thursday", teacher: teacher, teacherName: widget.teacherName, dayNo:3),
                TeacherAllocationCard(day: "Friday", teacher: teacher, teacherName: widget.teacherName, dayNo:4),
                //TeacherAllocationCard(day: "Saturday", teacher: data.getTeacherSchedule[teacherPosition].schedule[5], teacherName: widget.teacherName),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
