import 'package:timetable_manager/Components/AllocationCard.dart';
import 'package:timetable_manager/Components/Specifics/dd.dart';
import 'package:timetable_manager/Logic/Subject.dart';
import 'package:flutter/material.dart';
import '../LectureCard.dart';
import '../Specifics/NavBar.dart';
import '../headers.dart';
import 'package:logger/logger.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:timetable_manager/Components/Data.dart';

class TeacherTimetable extends StatefulWidget {
  String teacherName;

  TeacherTimetable({required this.teacherName});

  @override
  State<StatefulWidget> createState() {
    return _TeacherTimetableState();
  }
}

class _TeacherTimetableState extends State<TeacherTimetable> {
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
                  setState(() {});
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
                TeacherAllocationCard(day: "Monday", alloctions: monday, teacherName: widget.teacherName),
                TeacherAllocationCard(day: "Tuesday", alloctions: monday,teacherName: widget.teacherName),
                TeacherAllocationCard(day: "Wednesday", alloctions: monday, teacherName: widget.teacherName),
                TeacherAllocationCard(day: "Thursday", alloctions: monday, teacherName: widget.teacherName),
                TeacherAllocationCard(day: "Friday", alloctions: monday, teacherName: widget.teacherName),
                TeacherAllocationCard(day: "Saturday", alloctions: monday, teacherName: widget.teacherName),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
