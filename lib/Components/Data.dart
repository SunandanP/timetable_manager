import 'package:timetable_manager/Logic/Subject.dart';

class Data{

  List<Subject> subjects=[];

  Data(){

    subjects.add(Subject.param("CG","214453","SE A",true,3));
    subjects.add(Subject.param("CG","214457","SE A",false,8));
    subjects.add(Subject.param("DBMS","214452","SE A",true,3));
    subjects.add(Subject.param("DBMS","214456","SE A",false,12));
    subjects.add(Subject.param("PA","214451","SE A",true,3));
    subjects.add(Subject.param("PA","214455","SE A",false,8));
    subjects.add(Subject.param("EM-III","207003","SE A",true,3));
    subjects.add(Subject.param("EM-III","207003","SE A",false,4));
    subjects.add(Subject.param("SE","214454","SE A",true,6));
    subjects.add(Subject.param("PBL","214458","SE A",false,16));


    subjects.add(Subject.param("CG","214453","SE B",true,3));
    subjects.add(Subject.param("CG","214457","SE B",false,8));
    subjects.add(Subject.param("DBMS","214452","SE B",true,3));
    subjects.add(Subject.param("DBMS","214456","SE B",false,12));
    subjects.add(Subject.param("PA","214451","SE B",true,3));
    subjects.add(Subject.param("PA","214455","SE B",false,8));
    subjects.add(Subject.param("EM-III","207003","SE B",true,3));
    subjects.add(Subject.param("EM-III","207003","SE B",false,4));
    subjects.add(Subject.param("SE","214454","SE B",true,6));
    subjects.add(Subject.param("PBL","214458","SE B",false,16));


    subjects.add(Subject.param("Honor Course","310503","TE",true,4));
    subjects.add(Subject.param("AI","314454","TE",true,3));
    subjects.add(Subject.param("CC","314454","TE",true,3));
    subjects.add(Subject.param("DS & BDA","314452","TE",true,3));
    subjects.add(Subject.param("DS & BDA","314457","TE",false,8));
    subjects.add(Subject.param("CNS","314451","TE",true,3));
    subjects.add(Subject.param("CNS","314456","TE",false,16));
    subjects.add(Subject.param("WAD","314453","TE",true,3));
    subjects.add(Subject.param("Lab Practice-IV","314453","TE",false,3));
    subjects.add(Subject.param("LP-II","314453","TE",false,16));

    subjects.add(Subject.param("Social Computing","414451","BE",true,3));
    subjects.add(Subject.param("Blockchain","414452","BE",true,3));
    subjects.add(Subject.param("Startup & Entrepreneurship","414453","BE",true,3));
    subjects.add(Subject.param("HC  ","410503","BE",true,4));
    subjects.add(Subject.param("DS","414450","BE",true,3));
    subjects.add(Subject.param("LP-V","414454","BE",false,12));
    subjects.add(Subject.param("LP-VI","414455","BE",false,6));
    

  }
}