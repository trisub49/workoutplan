import 'package:workoutplan/models/WeightPlan.dart';

import 'models/CalisthenicPlan.dart';
import 'models/Day.dart';
import 'models/SerialTimedPlan.dart';
import 'models/TimedPlan.dart';

List<String> dayNames = ['Hétfő', 'Kedd', 'Szerda', 'Csütörtök', 'Péntek', 'Szombat', 'Vasárnap'];
List<Day> days = [];

getDayId(String dayName) {
  return dayNames.indexOf(dayName);
}

initDays() {
  days = [];
  for (var day in dayNames) {
    days.add(new Day(day, '', '', '',  [
      new WeightPlan('Fekvenyomás', 5, 20, 50), 
      new CalisthenicPlan('Fekvőtámasz', 6, 25),
      new TimedPlan('Futás', 30),
      new SerialTimedPlan('Plank', 5, 2)]));
  }
}
  