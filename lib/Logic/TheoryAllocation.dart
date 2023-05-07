import 'Allocation.dart';

class TheoryAllocation extends Allocation {
  String _classRoom= "315";
  String _teacher= "SS";
  String _subject = "OOP";

  TheoryAllocation(){
    _classRoom = "315";
    _teacher = "SS";
    _subject = "OOP";
  }
  TheoryAllocation.param(this._classRoom, this._subject, this._teacher);
  String get classRoom => this._classRoom;
  set classRoom(String value) => this._classRoom = value;
  get teacher => this._teacher;
  set teacher(value) => this._teacher = value;
  get subject => this._subject;
  set subject(value) => this._subject = value;

  @override
  List<String> stringRep() {
    return ["$_classRoom $_subject $_teacher "];
  }
}
