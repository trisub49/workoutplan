import 'package:flutter/material.dart';
import 'package:workoutplan/global.dart' as global;
import 'package:workoutplan/models/WeightPlan.dart';
import 'package:workoutplan/widgets/Button.dart';
import 'package:workoutplan/widgets/SimpleFormField.dart';

class WeightPlanForm extends StatefulWidget {

  int dayId;
  int planId;

  WeightPlanForm(this.dayId, this.planId);
  WeightPlanForm.add(dayId) {
    this.dayId = dayId;
    this.planId = -1;
  }

  _WeightPlanFormState createState() { 
    return _WeightPlanFormState(dayId, planId);
  }
}

class _WeightPlanFormState extends State<WeightPlanForm> {

  int dayId;
  int planId;
  final _formKey = GlobalKey<FormState>();

  _WeightPlanFormState(this.dayId, this.planId);

  Widget build(BuildContext context) {

    WeightPlan plan;

    if(planId == -1) {
      plan = new WeightPlan(null, null, null, null);
    } else {
      plan = global.days[dayId].plans[planId];
    }

    TextEditingController name = TextEditingController(text: plan.name != null ? plan.name : '');
    TextEditingController serial = TextEditingController(text: plan.serial != null ? plan.serial.toString() : '');
    TextEditingController rep = TextEditingController(text: plan.rep != null ? plan.rep.toString() : '');
    TextEditingController weight = TextEditingController(text: plan.weight != null ? plan.weight.toString() : '');

    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SimpleFormField('Edzés neve', 340, TextInputType.text, name),
            SimpleFormField('Sorozatszám', 125, TextInputType.number, serial),
            SimpleFormField('Ismétlésszám', 125, TextInputType.number, rep),
            SimpleFormField('Súly (kg)', 125, TextInputType.number, weight),
            Spacer(),
            Button('Kész', Icons.done, () => validateForm(context, dayId, planId, name.text, serial.text, rep.text, weight.text), 340, 50),
            Spacer()
          ]
        )
      )
    );
  }
  void validateForm(context, dayId, planId, name, serial, rep, weight) {
    if(_formKey.currentState.validate()) {
      if(planId == -1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Terv hozzáadva!')));
        global.days[dayId].plans.add(new WeightPlan(name, int.parse(serial), int.parse(rep), int.parse(weight)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Terv módosítva!')));
        global.days[dayId].plans[planId] = new WeightPlan(name, int.parse(serial), int.parse(rep), int.parse(weight));
      }
      Navigator.pop(context);
    }
  }
}