import 'package:flutter/material.dart';
import 'package:workoutplan/widgets/EditTitleAndTime.dart';
import 'package:workoutplan/widgets/ListPlan.dart';

class EditDay extends StatelessWidget {

  final String day;
  final String title;
  final String startTime;
  final String endTime;
  final List<String> plans;

  EditDay(this.day, this.title, this.startTime, this.endTime, this.plans);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Napi terv szerkesztése')),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(day, style: TextStyle(fontSize: 36, fontFamily: 'Roboto', fontWeight: FontWeight.w100))
            )
          ),
          Spacer(),
          Container( 
            decoration: BoxDecoration(color: Colors.grey.shade100),
            padding: EdgeInsets.all(15.0),
            child: EditTitleAndTime()
          ),
          ListPlan(plans)
        ]
      )
    );
  }
}