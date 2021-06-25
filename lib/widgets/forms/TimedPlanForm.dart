import 'package:flutter/material.dart';
import 'package:workoutplan/global.dart' as global;
import 'package:workoutplan/models/TimedPlan.dart';
import 'package:workoutplan/widgets/Button.dart';
import 'package:workoutplan/widgets/SimpleFormField.dart';

class TimedPlanForm extends StatelessWidget {

  final int dayId;
  final int planId;

  TimedPlanForm(this.dayId, this.planId);

  Widget build(BuildContext context) {
    TimedPlan plan = global.days[dayId].plans[planId];
    return Center(
      child:
        Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            new SimpleFormField('Edzés neve', plan.name, 340),
            new SimpleFormField('Időtartam (perc)', plan.minute.toString(), 200),
            Spacer(),
            Button('Kész', Icons.done, () => {}, 340, 50),
            Spacer()
          ]
        )
      )
    );
  }
}