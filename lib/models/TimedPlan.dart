import 'Plan.dart';

class TimedPlan extends Plan {
  
  int minute;

  TimedPlan.ex(name, minute) {
    super.name = name;
    this.minute = minute;
  }
  TimedPlan();

  @override
  String toString() {
    return '${name} (${minute} perc)';
  }

}