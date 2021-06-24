import 'Plan.dart';

class Day {

  String day;
  String title;
  String startTime;
  String endTime;
  List<Plan> plans;

  Day(this.day, this.title, this.startTime, this.endTime, this.plans);
}