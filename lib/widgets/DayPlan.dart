import 'package:flutter/material.dart';
import 'package:workoutplan/models/Plan.dart';
import 'package:workoutplan/routes/EditDay.dart';
import 'package:workoutplan/global.dart' as global;

class DayPlan extends StatefulWidget {

  final int dayId;
  final Color color;

  DayPlan(this.dayId, this.color);

  _DayPlanState createState() {
    return _DayPlanState(this.dayId, this.color);
  }
}

class _DayPlanState extends State<DayPlan> {

  int dayId;
  Color color;

  String day;
  String title;
  String startTime;
  String endTime;
  List<Plan> plans;

  initState() {
    this.day = global.days[dayId].day;
    this.title = global.days[dayId].title;
    this.startTime = global.days[dayId].startTime;
    this.endTime = global.days[dayId].endTime;
    this.plans = global.days[dayId].plans;
  }

  _DayPlanState(this.dayId, this.color);

  Widget build(BuildContext context) {

    return Container(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(day, style: TextStyle(fontSize: 32.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w100)), 
              Text(startTime.length > 0 && endTime.length > 0 ? '$startTime - $endTime' : '', style: TextStyle(color: Colors.blue)),
              Spacer(),
              Text(title.length > 0 ? title : 'Nincs megadva', style: TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w100, fontStyle: FontStyle.italic)),
              Spacer(),
              IconButton(
                icon: Icon(Icons.edit_outlined, size: 24, color: Colors.lightBlue),
                tooltip: 'Szerkesztés',
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditDay(global.getDayId(day))))
                .then((value) => setState(() {
                  title = global.days[dayId].title;
                  startTime = global.days[dayId].startTime;
                  endTime = global.days[dayId].endTime;
                  plans = global.days[dayId].plans;
                }))
              )
            ],
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
        color: this.color,
        border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.5)
      ),
    );
  }

  List<Widget> _loadPlans() {

    if(plans.length > 0) {
      return new List<Widget>.generate(plans.length, (int index) {
        List<String> planTiles = plans[index].toString().split(' (');
        
        return Container(
          padding: EdgeInsets.symmetric(vertical: 3.75),
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(planTiles[0], style: TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w300)),
              Text('(' + planTiles[1], style: TextStyle(fontSize: 16.0, color: Colors.blue, fontFamily: 'Roboto', fontWeight: FontWeight.w300))
            ]
          )
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