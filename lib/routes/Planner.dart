import 'package:flutter/material.dart';
import 'package:workoutplan/widgets/DayPlan.dart';
import 'package:workoutplan/global.dart' as global;

class Planner extends StatefulWidget {

  _PlannerState createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tervezés')),
      body: ListView(
        children: _loadDays(context)
      )
    );
  }

  List<Widget> _loadDays(BuildContext context) {
    if(global.days.length > 0) {
      return new List<Widget>.generate(global.days.length, (int index) {
        return new DayPlan(index, index % 2 == 0 ? Colors.white : Colors.grey.shade100);
      });
    } else {
      return [Icon(Icons.not_interested, size: 100, color: Colors.grey)];
    }
  }
}