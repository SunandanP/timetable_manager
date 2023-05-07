import 'Allocation.dart';
import 'TheoryAllocation.dart';


class LabAllocation extends Allocation{
  List<Allocation> _allocations = [];

  LabAllocation(){
    _allocations.add(TheoryAllocation());
    _allocations.add(TheoryAllocation());
    _allocations.add(TheoryAllocation());
    _allocations.add(TheoryAllocation());

    isTheory = false;
  }

  List<Allocation> get allocations => this._allocations;
  set allocations(List<Allocation> value) => this._allocations = value;

  @override
  List<String> stringRep() {
    return [
      "A-${allocations[0].stringRep()[0]}",
      "B-${allocations[1].stringRep()[0]}",
      "C-${allocations[2].stringRep()[0]}",
      "D-${allocations[3].stringRep()[0]}"
    ];
  }


}