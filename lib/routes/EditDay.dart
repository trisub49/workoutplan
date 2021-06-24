import 'package:flutter/material.dart';
import 'package:workoutplan/widgets/Button.dart';
import 'package:workoutplan/widgets/DayActions.dart';
import 'package:workoutplan/widgets/EditTitleAndTime.dart';
import 'package:workoutplan/widgets/ListPlan.dart';
import 'package:workoutplan/global.dart' as global;

class EditDay extends StatelessWidget {

  final int dayId;

  EditDay(this.dayId);

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
              child: Text(global.days[dayId].day, style: TextStyle(fontSize: 36, fontFamily: 'Roboto', fontWeight: FontWeight.w100))
            )
          ),
          Container( 
            decoration: BoxDecoration(color: Colors.grey.shade100),
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                EditTitleAndTime(),
                Spacer(),
                DayActions(),
              ]
            )
          ),
          SizedBox(height: 40),
          ListPlan(global.days[dayId].plans),
          SizedBox(height: 40),
          Center(child:Button('Új terv', Icons.add, () => {}, 200, 50))
        ]
      )
    );
  }
}