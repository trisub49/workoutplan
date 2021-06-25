import 'package:flutter/material.dart';
import 'package:workoutplan/global.dart' as global;
import 'package:workoutplan/models/TimedPlan.dart';
import 'package:workoutplan/widgets/Button.dart';
import 'package:workoutplan/widgets/SimpleFormField.dart';

class TimedPlanForm extends StatefulWidget {

  int dayId;
  int planId;

  TimedPlanForm(this.dayId, this.planId);
  TimedPlanForm.add(dayId) {
    this.dayId = dayId;
    this.planId = -1;
  }

  _TimedPlanFormState createState() {
    return _TimedPlanFormState(dayId, planId);
  }
}

class _TimedPlanFormState extends State<TimedPlanForm> {

  int dayId;
  int planId;
  final _formKey = GlobalKey<FormState>();

  _TimedPlanFormState(this.dayId, this.planId);

  Widget build(BuildContext context) {

    TimedPlan plan;

    if(planId == -1) {
      plan = new TimedPlan(null, null);
    } else {
      plan = global.days[dayId].plans[planId];
    }

    TextEditingController name = TextEditingController(text: plan.name != null ? plan.name : '');
    TextEditingController minute = TextEditingController(text: plan.minute != null ? plan.minute.toString() : '');

    return Center(
      child:
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              new SimpleFormField('Edzés neve', 340, TextInputType.text, name),
              new SimpleFormField('Időtartam (perc)', 200, TextInputType.number, minute),
              Spacer(),
              Button('Kész', Icons.done, () => validateForm(context, dayId, planId, name.text, minute.text), 340, 50),
              Spacer()
            ]
          )
      )
    );
  }
  void validateForm(context, dayId, planId, name, minute) {
    if(_formKey.currentState.validate()) {
      if(planId == -1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Terv hozzáadva!')));
        global.days[dayId].plans.add(new TimedPlan(name, int.parse(minute)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Terv módosítva!')));
        global.days[dayId].plans[planId] = new TimedPlan(name, int.parse(minute));
      }
      Navigator.pop(context);
    }
  }
}