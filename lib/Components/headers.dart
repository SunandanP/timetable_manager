import 'package:timetable_manager/Logic/LabAllocation.dart';
import 'package:timetable_manager/Logic/TheoryAllocation.dart';

import '../Logic/Allocation.dart';



List<String> headers = ["Time", "SE", "TE", "BE"];
List<String> headers2 = ["Time", "SE A", "SE B", "TE", "BE"];
List<String> headers1 = ["Time", "CLASSES"];

List<String> times = [
  "Time",
  "8.30 - 9.30",
  "9.30 - 10.30",
  "10.30 - 10.45",
  "10.45 - 11.45",
  "11.45 - 12.45",
  "12.45 - 1.45",
  "1.45 - 2.45",
  "2.45 - 3.45",
  "3.45 - 4.45",
];
List<Allocation> monday = [
  TheoryAllocation.param("315", "OOP", "SS"),
  TheoryAllocation.param("316", "POP", "NG"),
  TheoryAllocation.param("", "Short Break", ""),
  LabAllocation(),

  TheoryAllocation.param("223", "BCN", "PP"),
  TheoryAllocation.param("", "Long Break", ""),
  TheoryAllocation.param("223", "BCN", "PP"),
  TheoryAllocation.param("315", "OOP", "SS"),
];
