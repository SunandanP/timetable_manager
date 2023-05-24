import 'package:timetable_manager/Components/AllocationCard.dart';
import 'package:timetable_manager/Data.dart';
import 'package:timetable_manager/Logic/Allocation.dart';
import 'package:flutter/material.dart';
import '../LectureCard.dart';
import '../Specifics/NavBar.dart';
import '../headers.dart';
import 'package:logger/logger.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ClassTimetable extends StatefulWidget {

  ClassTimetable({required this.data});
  Data data;

  List<List<Allocation>> alloc = [];
  @override
  State<StatefulWidget> createState() {
    return _ClassTimetableState();
  }
}

class _ClassTimetableState extends State<ClassTimetable> {
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
    widget.data.fit();
    widget.alloc = widget.data.getClassSchedules["SE-B"]!;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      title: "Timetable Manager",
      home: Scaffold(
        drawer: NavBar(page: 0,),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                _printScreen();
              },
              icon: const Icon(Icons.print),
            ),
            IconButton(onPressed: (){
              setState(() {
                  widget.data.fit();
              });
            }, icon: Icon(Icons.refresh))
          ],
          title: Text("Class Timetable"),
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
                AllocationCard(day: "Monday", alloctions: widget.alloc[0]),
                AllocationCard(day: "Tuesday", alloctions: widget.alloc[1]),
                AllocationCard(day: "Wednesday", alloctions: widget.alloc[2]),
                AllocationCard(day: "Thursday", alloctions: widget.alloc[3]),
                AllocationCard(day: "Friday", alloctions: widget.alloc[4]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
