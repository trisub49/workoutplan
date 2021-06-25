import 'Plan.dart';

class TimedPlan extends Plan {
  
  int minute;

  TimedPlan(name, minute) {
    super.name = name;
    super.type = TimedPlan;
    this.minute = minute;
  }

  @override
  String toString() {
    return '${name} (${minute} perc)';
  }

}