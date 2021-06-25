import 'package:flutter/material.dart';
import 'package:workoutplan/global.dart' as global;
import 'package:workoutplan/models/SerialTimedPlan.dart';
import 'package:workoutplan/widgets/Button.dart';
import 'package:workoutplan/widgets/SimpleFormField.dart';

class SerialTimedPlanForm extends StatelessWidget {

  int dayId;
  int planId;

  SerialTimedPlanForm(this.dayId, this.planId);
  SerialTimedPlanForm.add(dayId) {
    this.dayId = dayId;
    this.planId = -1;
  }

  Widget build(BuildContext context) {
    SerialTimedPlan plan;
    if(planId == -1) {
      plan = new SerialTimedPlan(null, null, null);
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
            SimpleFormField('Edzés neve', plan.name != null ? plan.name : '', 340, TextInputType.text),
            SimpleFormField('Sorozatszám', plan.serial != null ? plan.serial.toString(): '', 125, TextInputType.number),
            SimpleFormField('Időtartam (perc)', plan.minute != null ? plan.minute.toString() : '', 150, TextInputType.number),
            Spacer(),
            Button('Kész', Icons.done, () => {}, 340, 50),
            Spacer()
          ]
        )
      )
    );
  }
}