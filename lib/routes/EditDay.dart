import 'package:flutter/material.dart';
import 'package:workoutplan/models/Plan.dart';
import 'package:workoutplan/widgets/Button.dart';
import 'package:workoutplan/global.dart' as global;
import 'package:workoutplan/widgets/dialogs/ReplaceDay.dart';
import 'package:workoutplan/widgets/dialogs/SubmitPlanDelete.dart';
import 'package:workoutplan/widgets/dialogs/SubmitRestDay.dart';
import 'AddPlan.dart';
import 'EditPlan.dart';

class EditDay extends StatefulWidget {

  final int dayId;

  EditDay(this.dayId);

  EditDayState createState() {
    return EditDayState(this.dayId);
  }
}

class EditDayState extends State<EditDay> {

  int dayId;

  String day;
  String title;
  String startTime;
  String endTime;
  List<Plan> plans;

  EditDayState(this.dayId);

  initState() {
    this.day = global.days[dayId].day;
    this.title = global.days[dayId].title;
    this.startTime = global.days[dayId].startTime;
    this.endTime = global.days[dayId].endTime;
    this.plans = global.days[dayId].plans;
  }

  Widget build(BuildContext context) {
    
    TextEditingController titleCon = TextEditingController(text: this.title);
    TextEditingController startTimeCon = TextEditingController(text: this.startTime);
    TextEditingController endTimeCon = TextEditingController(text: this.endTime);

    return Scaffold(
      appBar: AppBar(title: Text('Napi terv szerkesztése')),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(this.day, style: TextStyle(fontSize: 36, fontFamily: 'Roboto', fontWeight: FontWeight.w100))
            )
          ),
          Container( 
            decoration: BoxDecoration(color: Colors.grey.shade100),
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(7.5),
                            width: 260,
                            child: TextFormField(
                              controller: titleCon,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                labelText: 'Elnevezés, például: Lábnap',
                              ),
                              validator: (String value) {
                                this.title = value;
                                global.days[dayId].title = value;
                                return null;
                              }
                            )
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(Icons.timer_sharp, size: 30, color: Colors.grey),
                            padding: EdgeInsets.all(7.5)
                          ),
                          Container(
                            width: 100,
                            padding: EdgeInsets.all(7.5),
                            child: TextFormField(
                              controller: startTimeCon,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                labelText: 'Kezdés',
                              ),
                              validator: (String value) {
                                this.startTime = value;
                                global.days[dayId].startTime = value;
                                return null;
                              }
                            )
                          ),
                          Container(child: Text('-'), width: 10),
                          Container(
                            width: 100,
                            padding: EdgeInsets.all(7.5),
                            child: TextFormField(
                              controller: endTimeCon,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                labelText: 'Befejezés',
                              ),
                              validator: (String value) {
                                this.endTime = value;
                                global.days[dayId].endTime = value;
                                return null;
                              }
                            )
                          )
                        ]
                      )
                    ]
                  )
                ),
                Spacer(),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.swap_vertical_circle_outlined, size: 30, color: Colors.green), 
                      onPressed: () {
                        showDialog(
                          context: context, 
                          builder: (_) => ReplaceDay(dayId),
                          barrierDismissible: false
                        )
                        .then((value) => setState(() {
                          title = global.days[dayId].title;
                          startTime = global.days[dayId].startTime;
                          endTime = global.days[dayId].endTime;
                          plans = global.days[dayId].plans;
                        }));
                      }
                    ),
                    SizedBox(height: 50),
                    IconButton(
                      icon: Icon(Icons.bedtime_outlined, size: 30, color: Colors.green),
                      onPressed: () => {
                        showDialog(
                          context: context, 
                          builder: (_) => SubmitRestDay(context, dayId),
                          barrierDismissible: false
                        )
                        .then((value) => setState(() => {
                          this.plans = [],
                          this.title = 'Pihenőnap',
                          this.startTime = '',
                          this.endTime = ''
                        }))
                      }
                    )
                  ]
                )
              ]
            )
          ),
          SizedBox(height: 20),
          Center(
            child: Button('Új terv', Icons.add, 
            () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddPlan(dayId))).then((value) => setState(() {})), 200, 40)
          ),
          SizedBox(height: 20),
          Column( 
            children: _loadPlans(context)
          )
        ]
      )
    );
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
                    builder: (_) => SubmitPlanDelete(dayId, index),
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