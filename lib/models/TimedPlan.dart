import 'Plan.dart';

class TimedPlan extends Plan {
  
  int minute;

  TimedPlan(name, minute) {
    super.name = name;
    this.minute = minute;
  }

  @override
  String toString() {
    return '${name} (${minute} perc)';
  }

}