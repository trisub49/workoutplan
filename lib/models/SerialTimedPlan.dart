import 'Plan.dart';
import 'TimedPlan.dart';

class SerialTimedPlan extends TimedPlan {
  
  int serial;

  SerialTimedPlan(name, minute, serial) {
    super.name = name;
    super.minute = minute;
    this.serial = serial;
  }

  @override
  String toString() {
    return '${name} (${serial} x ${minute} perc)';
  }

}