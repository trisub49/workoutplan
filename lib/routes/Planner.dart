import 'package:flutter/material.dart';
import 'package:workoutplan/models/Day.dart';
import 'package:workoutplan/models/Plan.dart';
import 'package:workoutplan/global.dart' as global;

import 'EditDay.dart';

class Planner extends StatefulWidget {

  _PlannerState createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {

  List<Day> week;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tervezés')),
      body: ListView(
        children: _loadDays(context)
      )
    );
  }

  List<Widget> _loadDays(BuildContext context) {
    week = global.days;
    
    if(global.days.length > 0) {
      return new List<Widget>.generate(week.length, (int index) {
        Day day = week[index];
        return Container(
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(day.day, style: TextStyle(fontSize: 32.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w100)), 
                  Text(day.startTime.length > 0 && day.endTime.length > 0 ? '${day.startTime} - ${day.endTime}' : '', style: TextStyle(color: Colors.green)),
                  Spacer(),
                  Text(day.title.length > 0 ? day.title : 'Nincs megadva', style: TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w100, fontStyle: FontStyle.italic)),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.edit_outlined, size: 24, color: Colors.lightBlue),
                    tooltip: 'Szerkesztés',
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditDay(index)))
                    .then((value) => setState(() {
                      week = global.days;
                    }))
                  )
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: _loadPlans(index),
              )
            ]
          ),
          padding: EdgeInsets.all(15.0),
          height: 200,
          width: 380,
          decoration: BoxDecoration(
            color: index % 2 == 0 ? Colors.white : Colors.grey.shade100,
            border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.5)
          ),
        );
      });
    } else {
      return [Icon(Icons.not_interested, size: 100, color: Colors.grey)];
    }
  }
  List<Widget> _loadPlans(dayId) {

    List<Plan> plans = week[dayId].plans;

    if(week[dayId].plans.length > 0) {
      return new List<Widget>.generate(plans.length, (int index) {
        List<String> planTiles = plans[index].toString().split(' (');
        return Container(
          padding: EdgeInsets.symmetric(vertical: 3.75),
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(planTiles[0], style: TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w300)),
              Text('(' + planTiles[1], style: TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.bold))
            ]
          )
        );
      });
    } else {
      return [
        Spacer(),
        Icon(Icons.not_interested, size: 100, color: Colors.grey),
        Spacer()
      ];
    }
  }
}