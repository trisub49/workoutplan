import 'package:flutter/material.dart';
import 'package:workoutplan/widgets/DayPlan.dart';
import 'package:workoutplan/global.dart' as global;

class Planner extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    global.initDays();
    return Scaffold(
      appBar: AppBar(title: Text('Tervezés')),
      body: ListView(
        children: _loadDays()
        /*
          DayPlan('Hétfő', "Lábnap", "16:30", "17:30", ["3 x 25 guggolás", "4 x 10 nyomás", "asd"]),
          DayPlan('Kedd', "Bicepsz", "15:30", "17:00", ["asd", "asd", "asd"]),
          DayPlan('Szerda', "Tricepsz", "16:30", "17:30", []),
          DayPlan('Csütörtök', "Hátnap", "16:30", "17:30", ["asd", "asd", "asd"]),
          DayPlan('Péntek', "Lábnap", "16:30", "17:30", []),
          DayPlan('Szombat', "Lábnap", "16:30", "17:30", ["asd", "asd", "asd"]),
          DayPlan('Vasárnap', "Lábnap", "16:30", "17:30", [])
          */
        
      )
    );
  }

  List<Widget> _loadDays() {

    if(global.days.length > 0) {
      return new List<Widget>.generate(global.days.length, (int index) {
        return new DayPlan(global.days[index].day, global.days[index].title, global.days[index].startTime, global.days[index].endTime, global.days[index].plans);
      });
    } else {
      return [Icon(Icons.not_interested, size: 100, color: Colors.grey)];
    }
    
  }
}