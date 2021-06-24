import 'Plan.dart';

class SerialTimedPlan extends Plan {
  
  int minute;
  int serial;

  SerialTimedPlan(name, serial, minute) {
    super.name = name;
    this.serial = serial;
    this.minute = minute;
  }

  @override
  String toString() {
    return '${name} (${serial} x ${minute} perc)';
  }
}