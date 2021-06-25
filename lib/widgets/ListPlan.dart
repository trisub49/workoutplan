import 'package:flutter/material.dart';
import 'package:workoutplan/models/Plan.dart';
import 'package:workoutplan/routes/EditPlan.dart';
import 'package:workoutplan/widgets/SubmitPlanDelete.dart';

class ListPlan extends StatelessWidget {

  int dayId;
  List<Plan> plans;

  ListPlan(this.dayId, this.plans);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _loadPlans(context));
  }

  List<Widget> _loadPlans(BuildContext context) {
    if(plans.length > 0) {
      return new List<Widget>.generate(plans.length, (int index) {
        return Container(
          decoration: BoxDecoration(color: (index % 2) == 0 ? Colors.white : Colors.grey.shade100),
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(plans[index].toString(), style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w300)),
              Spacer(),
              IconButton(
                icon: Icon(Icons.edit_outlined, size: 30.0, color: Colors.lightBlue),
                tooltip: 'Terv szerkesztése',
                onPressed: () => navigate(context, EditPlan(dayId, index))
              ),
              SizedBox(width: 20),
              IconButton(
                icon: Icon(Icons.delete_outlined, size: 30.0, color: Colors.red.shade300),
                tooltip: 'Terv törlése',
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (_) => SubmitPlanDelete(context, dayId, index),
                    barrierDismissible: false
                  );
                }
              )
            ]
          )
        );
      });
    } else {
      return [Icon(Icons.not_interested, size: 100, color: Colors.grey)];
    }
  }

  void navigate(context, page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}