import 'package:flutter/material.dart';
import 'package:workoutplan/models/Plan.dart';
import 'package:workoutplan/routes/EditDay.dart';
import 'package:workoutplan/global.dart' as global;

class DayPlan extends StatefulWidget {

  final String day;
  final String title;
  final String startTime;
  final String endTime;
  final List<Plan> plans;

  DayPlan(this.day, this.title, this.startTime, this.endTime, this.plans);

  _DayPlanState createState() {
    return _DayPlanState(day, title, startTime, endTime, plans);
  }
}

class _DayPlanState extends State<DayPlan> {

  String day;
  String title;
  String startTime;
  String endTime;
  List<Plan> plans;

  _DayPlanState(this.day, this.title, this.startTime, this.endTime, this.plans);

  Widget build(BuildContext context) {

    return Container(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(day, style: TextStyle(fontSize: 36.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w100)), 
              Text(startTime.length > 0 && endTime.length > 0 ? '${startTime} - ${endTime}' : '', style: TextStyle(color: Colors.blue)),
              Spacer(),
              Text(title.length > 0 ? title : 'Nincs megadva', style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w100, fontStyle: FontStyle.italic)),
              Spacer(),
              IconButton(
                icon: Icon(Icons.edit_rounded, size: 24),
                tooltip: 'Szerkesztés',
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditDay(global.getDayId(day)))).then((value) => setState(() {}))
              )
            ]
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: _loadPlans(),
          )
        ]
      ),
      padding: EdgeInsets.all(15.0),
      height: 200,
      width: 380,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.5)
      ),
    );
  }

  void navigate(context, page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  List<Widget> _loadPlans() {

    if(plans.length > 0) {
      return new List<Widget>.generate(plans.length, (int index) {
        return Text(
          plans[index].toString(), 
          style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w300)
        );
      });
    } else {
      return [
        Spacer(),
        Icon(Icons.not_interested, size: 100, color: Colors.grey),
        Spacer()
      ];
    }
  }
}