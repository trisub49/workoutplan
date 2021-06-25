import 'package:flutter/material.dart';
import 'package:workoutplan/models/Plan.dart';
import 'package:workoutplan/routes/EditPlan.dart';
import 'package:workoutplan/widgets/SubmitPlanDelete.dart';
import 'package:workoutplan/global.dart' as global;

class ListPlan extends StatefulWidget {

  final int dayId;
  final List<Plan> plans;

  ListPlan(this.dayId, this.plans);

  _ListPlanState createState() {
    return _ListPlanState(this.dayId, this.plans);
  }
}

class _ListPlanState extends State<ListPlan> {

  int dayId;
  List<Plan> plans;

  _ListPlanState(this.dayId, this.plans);
  
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
                icon: Icon(Icons.edit_outlined, size: 26.0, color: Colors.lightBlue),
                tooltip: 'Terv szerkesztése',
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditPlan(dayId, index))).then((value) => setState(() {}))
              ),
              SizedBox(width: 20),
              IconButton(
                icon: Icon(Icons.delete_outlined, size: 26.0, color: Colors.red.shade300),
                tooltip: 'Terv törlése',
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (_) => SubmitPlanDelete(context, dayId, index),
                    barrierDismissible: false
                  ).then((value) => setState(() {}));
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
}