import 'package:flutter/material.dart';
import 'package:workoutplan/widgets/DayPlan.dart';
import 'package:workoutplan/global.dart' as global;

class Planner extends StatelessWidget 
{
  
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(title: Text('Tervezés')),
      body: ListView(
        children: _loadDays()
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