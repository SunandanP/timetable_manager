import 'package:timetable_manager/Logic/Allocation.dart';
import 'package:timetable_manager/Logic/Classroom.dart';
import 'package:timetable_manager/Logic/LinearFittingAlgorithm.dart';
import 'package:timetable_manager/Logic/Schedules.dart';
import 'package:timetable_manager/Logic/Subject.dart';
import 'package:timetable_manager/Logic/Teacher.dart';

class Data{
List<Teacher> teachers = new List.generate(20, (_) => new Teacher());
List<Classroom> classrooms = new List.generate(13, (_) => new Classroom());

List<Teacher> get teachersList => this.teachers;
List<Classroom> get classroomList => this.classrooms;

  Data(){
    teachers[0].name = "Dr. Jyoti Surve";
    teachers[0].shortName = "JS";
    teachers[0].subjects = [
      Subject.param("PBL", "214458", "SE-A", false, 8),
      Subject.param("Elective-V", "414451", "BE", true, 3)
    ];

    teachers[1].name = "Prof. Sarang Saoji";
    teachers[1].shortName = "SS";
    teachers[1].subjects = [
      Subject.param("CG", "214453", "SE-A", true, 3),
      Subject.param("CGL", "214457", "SE-A", false, 8),
      Subject.param("PBL", "214458", "SE-B", false, 4)
    ];

    teachers[2].name = "Dr. Bhavana Kanawade";
    teachers[2].shortName = "BK";
    teachers[2].subjects = [
      Subject.param("PBL", "214458", "SE-B", false, 4),
      Subject.param("HC", "310503", "TE", true, 4),
      Subject.param("LP-V", "414454", "BE", false, 6),
      Subject.param("AC", "414457", "BE", true, 1)
    ];

    teachers[3].name = "Prof. Keshav Tambre";
    teachers[3].shortName = "KT";
    teachers[3].subjects = [
      Subject.param("DBMS", "214452", "SE-A", true, 3),
      Subject.param("DBMSL", "214456", "SE-A", false, 12),
      Subject.param("AC", "214459", "SE-A", true, 1)
    ];

    teachers[4].name = "Prof. Nilesh Mali";
    teachers[4].shortName = "NDM";
    teachers[4].subjects = [
      Subject.param("PBL", "214458", "SE-B", false, 8),
      Subject.param("CC", "314454", "TE", true, 3),
      Subject.param("LP-II", "314458", "TE", false, 6)
    ];

    teachers[5].name = "Prof. Sonali Patil";
    teachers[5].shortName = "SP";
    teachers[5].subjects = [
      Subject.param("AI", "314454", "TE", true, 3),
      Subject.param("LP-II", "314458", "TE", false, 2),
      Subject.param("Elective-VI", "414452", "BE", true, 3),
      Subject.param("LP-VI", "414455", "BE", false, 6)
    ];

    teachers[6].name = "Prof. Prashant Mandale";
    teachers[6].shortName = "PM";
    teachers[6].subjects = [
      Subject.param("DSBD", "314452", "TE", true, 3),
      Subject.param("DSBDL", "314457", "TE", false, 8),
      Subject.param("S&E", "414453", "BE", true, 3),
    ];

    teachers[7].name = "Prof. Kamna Sahu";
    teachers[7].shortName = "KS";
    teachers[7].subjects = [
      Subject.param("PA", "214451", "SE-A", true, 3),
      Subject.param("PSDL", "214455", "SE-A", false, 8),
      Subject.param("PA", "214451", "SE-B", true, 3),
      Subject.param("PSDL", "214455", "SE-B", false, 2)
    ];

    teachers[8].name = "Prof. Megha Mehar";
    teachers[8].shortName = "MM";
    teachers[8].subjects = [
      Subject.param("PBL", "214458", "SE-A", false, 4),
      Subject.param("CG", "214453", "SE-B", true, 3),
      Subject.param("CGL", "214457", "SE-B", false, 8)
    ];

    teachers[9].name = "Prof. Pradnya Patange";
    teachers[9].shortName = "PP";
    teachers[9].subjects = [
      Subject.param("CNS", "314451", "TE", true, 3),
      Subject.param("CNSL", "314456", "TE", false, 12),
      Subject.param("AC6", "314459", "TE", true, 1)
    ];

    teachers[10].name = "Prof. Monali Bansode";
    teachers[10].shortName = "MB";
    teachers[10].subjects = [
      Subject.param("WAD", "314453", "TE", true, 3),
      Subject.param("LP-II", "314458", "TE", false, 8),
      Subject.param("HC", "410503", "BE", true, 4)
    ];

    teachers[11].name = "Prof. Sayali Sabale";
    teachers[11].shortName = "SBS";
    teachers[11].subjects = [
      Subject.param("PSDL", "214455", "SE-B", false, 6),
      Subject.param("DS", "414450", "BE", true, 3),
      Subject.param("LP-V", "414454", "BE", false, 6)
    ];

    teachers[12].name = "Prof. Nitin Gulhane";
    teachers[12].shortName = "NG";
    teachers[12].subjects = [
      Subject.param("SE", "214454", "SE-A", true, 3),
      Subject.param("SE", "214454", "SE-B", true, 3),
      Subject.param("PBL", "214458", "SE-A", false, 4),
      Subject.param("PBL", "214458", "SE-B", false, 4),
    ];

    teachers[13].name = "Prof. Mandar Datar";
    teachers[13].shortName = "MD";
    teachers[13].subjects = [
      Subject.param("M3", "207003", "SE-B", true, 3),
    ];

    teachers[14].name = "Prof. Namdev Mhetre";
    teachers[14].shortName = "NM";
    teachers[14].subjects = [
      Subject.param("M3", "207003", "SE-A", true, 3),
    ];

    teachers[15].name = "Prof. Prachi Nilekar";
    teachers[15].shortName = "PN";
    teachers[15].subjects = [
      Subject.param("DBMS", "214452", "SE-B", true, 3),
      Subject.param("DBMSL", "214456", "SE-B", false, 12)
    ];



    classrooms[0].roomNo = "314";

    classrooms[1].roomNo = "315";

    classrooms[2].roomNo = "309";

    classrooms[3].roomNo = "214";
    classrooms[3].isClass = false;
    classrooms[3].subjects = ["CGL", "DBMSL", "CNSL"];

    classrooms[4].roomNo = "213";
    classrooms[4].isClass = false;
    classrooms[4].subjects = ["DBMSL", "LP-II", "CNSL"];

    classrooms[5].roomNo = "224";
    classrooms[5].isClass = false;
    classrooms[5].subjects = ["PBL", "DSBDL", "LP-II", "CGL"];

    classrooms[6].roomNo = "225";
    classrooms[6].isClass = false;
    classrooms[6].subjects = ["DSBDL", "CGL"];

    classrooms[7].roomNo = "316";
    classrooms[7].isClass = false;
    classrooms[7].subjects = ["PSDL"];

    classrooms[8].roomNo = "317";
    classrooms[8].isClass = false;
    classrooms[8].subjects = ["PBL"];

    classrooms[9].roomNo = "CC1";
    classrooms[9].isClass = false;
    classrooms[9].subjects = ["LP-V"];

    classrooms[10].roomNo = "CC2";
    classrooms[10].isClass = false;
    classrooms[10].subjects = ["LP-V"];

    classrooms[11].roomNo = "A6";
    classrooms[11].isClass = false;
    classrooms[11].subjects = ["LP-VI"];

    classrooms[12].roomNo = "310";
    LinearFittingAlgorithm.infra.classes = classrooms;
    LinearFittingAlgorithm.infra.teachers = teachers;
  }

  void fit(){
    LinearFittingAlgorithm.fit();
  }

  List<Teacher> get getTeacherSchedule => LinearFittingAlgorithm.schedules.teacherSchedules;
  List<Classroom> get getClassroomSchedules => LinearFittingAlgorithm.schedules.classroomSchedules;
  Map<String, List<List<Allocation>>> get getClassSchedules => LinearFittingAlgorithm.schedules.classSchedules;
}
