import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutplan/models/CalisthenicPlan.dart';
import 'package:workoutplan/models/Plan.dart';
import 'package:workoutplan/global.dart' as global;
import 'package:workoutplan/models/SerialTimedPlan.dart';
import 'package:workoutplan/models/TimedPlan.dart';
import 'package:workoutplan/models/WeightPlan.dart';
import 'package:workoutplan/widgets/forms/CalisthenicPlanForm.dart';
import 'package:workoutplan/widgets/forms/SerialTimedPlanForm.dart';
import 'package:workoutplan/widgets/forms/TimedPlanForm.dart';
import 'package:workoutplan/widgets/forms/WeightPlanForm.dart';


class EditPlan extends StatelessWidget {

  final int dayId;
  final int planId;

  EditPlan(this.dayId, this.planId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terv szerkesztés')),
      body: EditPlanForm(dayId, planId)
    );
  }
}

class EditPlanForm extends StatelessWidget {
  final int dayId;
  final int planId;

  EditPlanForm(this.dayId, this.planId);
  @override
  Widget build(BuildContext context) {
    return FormChooser(dayId, planId);
  }
}

class FormChooser extends StatelessWidget {

  final int dayId;
  final int planId;

  FormChooser(this.dayId, this.planId);

  @override
  Widget build(BuildContext context) {
    Plan actualPlan = global.days[dayId].plans[planId];

    if(actualPlan.type == WeightPlan) {
      return WeightPlanForm(this.dayId, this.planId);
    }
    if(actualPlan.type == CalisthenicPlan) {
      return CalisthenicPlanForm(this.dayId, this.planId);
    }
    if(actualPlan.type == TimedPlan) {
      return TimedPlanForm(this.dayId, this.planId);
    }
    if(actualPlan.type == SerialTimedPlan) {
      return SerialTimedPlanForm(this.dayId, this.planId);
    }
    return null;
  }
}
