import 'package:flutter/material.dart';
import 'package:workoutplan/global.dart' as global;
import 'package:workoutplan/models/TimedPlan.dart';
import 'package:workoutplan/widgets/Button.dart';
import 'package:workoutplan/widgets/SimpleFormField.dart';

class TimedPlanForm extends StatelessWidget {

  int dayId;
  int planId;

  TimedPlanForm(this.dayId, this.planId);
  TimedPlanForm.add(dayId) {
    this.dayId = dayId;
    this.planId = -1;
  }

  Widget build(BuildContext context) {
    TimedPlan plan;
    if(planId == -1) {
      plan = new TimedPlan(null, null);
    } else {
      plan = global.days[dayId].plans[planId];
    }
    return Center(
      child:
        Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            new SimpleFormField('Edzés neve', plan.name != null ? plan.name : '', 340, TextInputType.text),
            new SimpleFormField('Időtartam (perc)', plan.minute != null ? plan.minute.toString() : '', 200, TextInputType.number),
            Spacer(),
            Button('Kész', Icons.done, () => {}, 340, 50),
            Spacer()
          ]
        )
      )
    );
  }
}