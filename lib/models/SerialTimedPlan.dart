import 'Plan.dart';

class SerialTimedPlan extends Plan {
  
  int minute;
  int serial;

  SerialTimedPlan(name, serial, minute) {
    super.name = name;
    super.type = SerialTimedPlan;
    this.serial = serial;
    this.minute = minute;
  }

  @override
  String toString() {
    return '${name} (${serial} x ${minute} perc)';
  }
}