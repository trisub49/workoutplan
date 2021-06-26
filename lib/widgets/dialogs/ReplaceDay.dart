import 'package:flutter/material.dart';
import 'package:workoutplan/global.dart' as global;
import 'package:workoutplan/models/Day.dart';

class ReplaceDay extends StatefulWidget {

  final int dayId;

  ReplaceDay(this.dayId);

  _ReplaceDayState createState() => _ReplaceDayState(this.dayId);

}

class _ReplaceDayState extends State<ReplaceDay> {

  final int dayId;

  int choosenId;
  Day copyOfAnotherDay;

  _ReplaceDayState(this.dayId);

  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Napi terv csere'),
      content: Column(
        children: [
          Text('Melyik napra szeretnéd lecserélni?', style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w300)),
          SizedBox(height: 10),
          Column(
            children: _listAvailableDays(dayId)
          ),
        ]
      ),
      actions: [
        ElevatedButton(
          child: Text('Csere!'), 
          onPressed: () => {
            if(choosenId != dayId) {
              
              copyOfAnotherDay = global.days[choosenId],

              global.days[choosenId] = global.days[dayId],
              global.days[dayId] = copyOfAnotherDay,
              global.days[choosenId].day = global.dayNames[choosenId],
              global.days[dayId].day = global.dayNames[dayId],
              
              Navigator.pop(context)
            }
          }
        ),
        ElevatedButton(child: Text('Vissza'), onPressed: () => Navigator.pop(context))
      ],
    );
  }

  List<Widget> _listAvailableDays(int dayId) {
    
    List<Widget> days = [];

    for(var i = 0; i < global.days.length; i ++) {
      if(i != dayId) {
        days.add(
          new RadioListTile(
            title: Row(
              children: [
                Text(global.days[i].day),
                Spacer(),
                Text(global.days[i].title)
              ]
            ),
            value: i,
            groupValue: choosenId, 
            onChanged: (value) {
              setState(() => choosenId = value);
            }
          )
        );
      }
    }
    return days;
  }
}