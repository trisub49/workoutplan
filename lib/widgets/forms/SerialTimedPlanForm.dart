import 'package:flutter/material.dart';
import 'package:workoutplan/global.dart' as global;
import 'package:workoutplan/models/SerialTimedPlan.dart';
import 'package:workoutplan/widgets/Button.dart';
import 'package:workoutplan/widgets/SimpleFormField.dart';

class SerialTimedPlanForm extends StatefulWidget {

  int dayId;
  int planId;

  SerialTimedPlanForm(this.dayId, this.planId);
  SerialTimedPlanForm.add(dayId) {
    this.dayId = dayId;
    this.planId = -1;
  }

  _SerialTimedPlanFormState createState() {
    return _SerialTimedPlanFormState(dayId, planId);
  }
}

class _SerialTimedPlanFormState extends State<SerialTimedPlanForm> {

  int dayId;
  int planId;
  final _formKey = GlobalKey<FormState>();

  _SerialTimedPlanFormState(this.dayId, this.planId);

  Widget build(BuildContext context) {

    SerialTimedPlan plan;

    if(planId == -1) {
      plan = new SerialTimedPlan(null, null, null);
    } else {
      plan = global.days[dayId].plans[planId];
    }

    TextEditingController name = TextEditingController(text: plan.name != null ? plan.name : '');
    TextEditingController serial = TextEditingController(text: plan.serial != null ? plan.serial.toString() : '');
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
              SimpleFormField('Edzés neve', 340, TextInputType.text, name),
              SimpleFormField('Sorozatszám', 125, TextInputType.number, serial),
              SimpleFormField('Időtartam (perc)', 150, TextInputType.number, minute),
              Spacer(),
              Button('Kész', Icons.done, () => validateForm(context, dayId, planId, name.text, serial.text, minute.text), 340, 50),
              Spacer()
            ]
          )
        )
    );
  }
  void validateForm(context, dayId, planId, name, serial, minute) {
    if(_formKey.currentState.validate()) {
      if(planId == -1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Terv hozzáadva!')));
        global.days[dayId].plans.add(new SerialTimedPlan(name, int.parse(serial), int.parse(minute)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Terv módosítva!')));
        global.days[dayId].plans[planId] = new SerialTimedPlan(name, int.parse(serial), int.parse(minute));
      }
      Navigator.pop(context);
    }
  }
}