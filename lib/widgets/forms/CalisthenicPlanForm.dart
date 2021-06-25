import 'package:flutter/material.dart';
import 'package:workoutplan/global.dart' as global;
import 'package:workoutplan/models/CalisthenicPlan.dart';
import 'package:workoutplan/routes/EditDay.dart';
import 'package:workoutplan/widgets/Button.dart';
import 'package:workoutplan/widgets/SimpleFormField.dart';

class CalisthenicPlanForm extends StatefulWidget {

  int dayId;
  int planId;

  CalisthenicPlanForm(this.dayId, this.planId);
  CalisthenicPlanForm.add(dayId) {
    this.dayId = dayId;
    this.planId = -1;
  }

  _CalisthenicPlanFormState createState() { 
    return _CalisthenicPlanFormState(dayId, planId);
  }
}

class _CalisthenicPlanFormState extends State<CalisthenicPlanForm> {

  int dayId;
  int planId;
  final _formKey = GlobalKey<FormState>();

  _CalisthenicPlanFormState(this.dayId, this.planId);

  Widget build(BuildContext context) {
    CalisthenicPlan plan;
    if(planId == -1) {
      plan = new CalisthenicPlan(null, null, null);
    } else {
      plan = global.days[dayId].plans[planId];
    }
    return Center(
      child:
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              new SimpleFormField('Edzés neve', plan.name != null ? plan.name : '', 340, TextInputType.text),
              new SimpleFormField('Sorozatszám', plan.serial != null ? plan.serial.toString() : '', 125, TextInputType.number),
              new SimpleFormField('Ismétlésszám', plan.rep != null ? plan.rep.toString() : '', 125, TextInputType.number),
              Spacer(),
              Button('Kész', Icons.done, () => validateForm(context,dayId, planId), 340, 50),
              Spacer()
            ]
          )
      )
    );
  }
  void validateForm(context, dayId, planId)
  {
    if(_formKey.currentState.validate()) {
      if(planId == -1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Terv hozzáadva!')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Terv módosítva!')));
      }
      Navigator.pop(context);
    }
  }
}