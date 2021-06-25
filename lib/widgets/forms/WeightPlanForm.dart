import 'package:flutter/material.dart';
import 'package:workoutplan/global.dart' as global;
import 'package:workoutplan/models/WeightPlan.dart';
import 'package:workoutplan/widgets/Button.dart';
import 'package:workoutplan/widgets/SimpleFormField.dart';

class WeightPlanForm extends StatelessWidget {

  int dayId;
  int planId;

  WeightPlanForm(this.dayId, this.planId);
  WeightPlanForm.add(dayId) {
    this.dayId = dayId;
    this.planId = -1;
  }

  Widget build(BuildContext context) {
    WeightPlan plan;
    if(planId == -1) {
      plan = new WeightPlan(null, null, null, null);
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
            SimpleFormField('Sorozatszám', plan.serial != null ? plan.serial.toString() : '', 125, TextInputType.number),
            SimpleFormField('Ismétlésszám', plan.rep != null ? plan.rep.toString() : '', 125, TextInputType.number),
            SimpleFormField('Súly (kg)', plan.weight != null ? plan.weight.toString(): '', 125, TextInputType.number),
            Spacer(),
            Button('Kész', Icons.done, () => {}, 340, 50),
            Spacer()
          ]
        )
      )
    );
  }
}