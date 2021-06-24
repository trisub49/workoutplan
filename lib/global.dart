import 'models/Day.dart';
import 'models/Plan.dart';

List<String> dayNames = ['Hétfő', 'Kedd', 'Szerda', 'Csütörtök', 'Péntek', 'Szombat', 'Vasárnap'];
List<Day> days = [];

getDayId(String dayName) {
  return dayNames.indexOf(dayName);
}

initDays() {
  for (var day in dayNames) {
    days.add(new Day(day, '', '', '',  [new Plan('asd', 2, 3, '', 50)]));
  }
}
  