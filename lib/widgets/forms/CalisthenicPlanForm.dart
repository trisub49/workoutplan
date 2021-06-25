import 'package:flutter/material.dart';
import 'package:workoutplan/global.dart' as global;
import 'package:workoutplan/models/CalisthenicPlan.dart';
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

    TextEditingController name = TextEditingController(text: plan.name != null ? plan.name : '');
    TextEditingController serial = TextEditingController(text: plan.serial != null ? plan.serial.toString() : '');
    TextEditingController rep = TextEditingController(text: plan.rep != null ? plan.rep.toString() : '');

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
              new SimpleFormField('Sorozatszám', 125, TextInputType.number, serial),
              new SimpleFormField('Ismétlésszám', 125, TextInputType.number, rep),
              Spacer(),
              Button('Kész', Icons.done, () => validateForm(context, dayId, planId, name.text, serial.text, rep.text), 340, 50),
              Spacer()
            ]
          )
      )
    );
  }
  void validateForm(context, dayId, planId, name, serial, rep) {
    if(_formKey.currentState.validate()) {
      if(planId == -1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Terv hozzáadva!')));
        global.days[dayId].plans.add(new CalisthenicPlan(name, int.parse(serial), int.parse(rep)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Terv módosítva!')));
        global.days[dayId].plans[planId] = new CalisthenicPlan(name, int.parse(serial), int.parse(rep));
      }
      Navigator.pop(context);
    }
  }
}