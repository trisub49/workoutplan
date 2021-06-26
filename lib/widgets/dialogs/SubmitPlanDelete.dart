import 'package:flutter/material.dart';
import 'package:workoutplan/global.dart' as global;

class SubmitPlanDelete extends StatelessWidget {

  final int dayId;
  final int planId;

  SubmitPlanDelete(this.dayId, this.planId);

  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Megerősítés'),
      content: Text('Biztosan törölni szeretnéd a(z) ${global.days[dayId].plans[planId].name} tervet?'),
      actions: [
        ElevatedButton(child: Text('Igen'), onPressed: () => deletePlan(context, dayId, planId)),
        ElevatedButton(child: Text('Nem'), onPressed: () => Navigator.pop(context))
      ],
    );
  }

  void deletePlan(BuildContext context, int dayId, int planId) {
    global.days[dayId].plans.removeAt(planId);
    Navigator.pop(context);
  }
}