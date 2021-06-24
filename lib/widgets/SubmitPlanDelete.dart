import 'package:flutter/material.dart';
import 'package:workoutplan/global.dart' as global;
import 'package:workoutplan/routes/EditDay.dart';
import 'package:workoutplan/routes/Planner.dart';

class SubmitPlanDelete extends StatelessWidget {

  final BuildContext preContext;
  final int dayId;
  final int planId;

  SubmitPlanDelete(this.preContext, this.dayId, this.planId);

  @override
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
    navigate(context, Planner());
    navigate(context, EditDay(dayId));
  }

  void navigate(context, page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}