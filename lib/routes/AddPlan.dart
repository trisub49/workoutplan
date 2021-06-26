import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutplan/models/CalisthenicPlan.dart';
import 'package:workoutplan/models/SerialTimedPlan.dart';
import 'package:workoutplan/models/TimedPlan.dart';
import 'package:workoutplan/models/WeightPlan.dart';
import 'package:workoutplan/widgets/Button.dart';
import 'package:workoutplan/widgets/forms/CalisthenicPlanForm.dart';
import 'package:workoutplan/widgets/forms/SerialTimedPlanForm.dart';
import 'package:workoutplan/widgets/forms/TimedPlanForm.dart';
import 'package:workoutplan/widgets/forms/WeightPlanForm.dart';

class AddPlan extends StatefulWidget {

  final int dayId;

  AddPlan(this.dayId);

  _AddPlanState createState() => _AddPlanState(this.dayId);
}

class _AddPlanState extends State<AddPlan> {

  int dayId;
  Type planType;

  _AddPlanState(this.dayId);

  Widget build(BuildContext context) {

    if(planType == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Milyen típusú edzés?')), 
        body: Center(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button('Edzés súllyal', Icons.add, () => { setState(() => planType = WeightPlan) }, 300, 50),
                SizedBox(height: 30),
                Button('Edzés saját súllyal', Icons.add, () => { setState(() => planType = CalisthenicPlan) }, 300, 50),
                SizedBox(height: 30),
                Button('Edzés idővel', Icons.add, () => { setState(() => planType = TimedPlan) }, 300, 50),
                SizedBox(height: 30),
                Button('Edzés sorozatszám és idővel', Icons.add, () => { setState(() => planType = SerialTimedPlan) }, 300, 50),
              ]
            )
          )
        )
      );
    } else {
      if(planType == WeightPlan) {
        return Scaffold(appBar: AppBar(title: Text('Edzés súllyal')), body: WeightPlanForm.add(dayId));
      } 
      if(planType == CalisthenicPlan) {
        return Scaffold(appBar: AppBar(title: Text('Edzés saját súllyal')), body: CalisthenicPlanForm.add(dayId));
      } 
      if(planType == TimedPlan) {
        return Scaffold(appBar: AppBar(title: Text('Edzés idővel')), body: TimedPlanForm.add(dayId));
      } 
      if(planType == SerialTimedPlan) {
        return Scaffold(appBar: AppBar(title: Text('Edzés sorozatszám és idővel')), body: SerialTimedPlanForm.add(dayId));
      } 
    }
    return null;
  }
}