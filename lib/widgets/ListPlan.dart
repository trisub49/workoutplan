import 'package:flutter/material.dart';
import 'package:workoutplan/models/Plan.dart';

class ListPlan extends StatelessWidget {

  List<Plan> plans;

  ListPlan(this.plans);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: _loadPlans());
  }

  List<Widget> _loadPlans() {

    if(plans.length > 0) {
      return new List<Widget>.generate(plans.length, (int index) {
        return Container(
          decoration: BoxDecoration(color: (index % 2) == 0 ? Colors.white : Colors.grey.shade100),
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(plans[index].toString(), style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w300)),
              Spacer(),
              Icon(Icons.edit_outlined, size: 30.0, color: Colors.lightBlue),
              SizedBox(width: 20),
              Icon(Icons.delete_outlined, size: 30.0, color: Colors.red.shade300)
            ]
          )
        );
      });
    } else {
      return [Icon(Icons.not_interested, size: 100, color: Colors.grey)];
    }
  }
}