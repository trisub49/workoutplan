import 'package:flutter/material.dart';
import 'package:workoutplan/global.dart' as global;
import 'package:workoutplan/models/CalisthenicPlan.dart';
import 'package:workoutplan/widgets/Button.dart';
import 'package:workoutplan/widgets/SimpleFormField.dart';

class CalisthenicPlanForm extends StatelessWidget {

  final int dayId;
  final int planId;

  CalisthenicPlanForm(this.dayId, this.planId);

  Widget build(BuildContext context) {
    CalisthenicPlan plan = global.days[dayId].plans[planId];
    return Center(
      child:
        Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            new SimpleFormField('Edzés neve', plan.name, 340),
            new SimpleFormField('Sorozatszám', plan.serial.toString(), 125),
            new SimpleFormField('Ismétlésszám', plan.rep.toString(), 125),
            Spacer(),
            Button('Kész', Icons.done, () => {}, 340, 50),
            Spacer()
          ]
        )
      )
    );
  }
}