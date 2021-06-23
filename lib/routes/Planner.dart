import 'package:flutter/material.dart';
import 'package:workoutplan/widgets/DayPlan.dart';

class Planner extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(title: Text('Tervezés')),
      body: ListView(
        children: [
          DayPlan('Hétfő', "Lábnap", "16:30", "17:30", ["3 x 25 guggolás", "4 x 10 nyomás", "asd"]),
          DayPlan('Kedd', "Bicepsz", "15:30", "17:00", ["asd", "asd", "asd"]),
          DayPlan('Szerda', "Tricepsz", "16:30", "17:30", []),
          DayPlan('Csütörtök', "Hátnap", "16:30", "17:30", ["asd", "asd", "asd"]),
          DayPlan('Péntek', "Lábnap", "16:30", "17:30", []),
          DayPlan('Szombat', "Lábnap", "16:30", "17:30", ["asd", "asd", "asd"]),
          DayPlan('Vasárnap', "Lábnap", "16:30", "17:30", [])
        ]
      )
    );
  }
}