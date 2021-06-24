import 'Plan.dart';

class CalisthenicPlan extends Plan {
  
  int rep;
  int serial;

  CalisthenicPlan(name, serial, rep) {
    super.name = name;
    this.rep = rep;
    this.serial = serial;
  }

  @override
  String toString() {
    return '${name} (${serial} x ${rep})';
  }

}