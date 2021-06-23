import 'package:flutter/material.dart';

class DayPlan extends StatelessWidget 
{
  final String day;
  final List<String> dailyPlans;

  DayPlan(this.day, this.dailyPlans);

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(day, style: TextStyle(fontSize: 36.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w100)), 
              Text('16:30 - 17:30', style: TextStyle(color: Colors.blue)),
              Spacer(),
              IconButton(
                icon: Icon(Icons.edit_rounded, size: 24,),
                tooltip: 'Szerkesztés',
                onPressed: () {  }
              )
            ]
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Asd', style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'Roboto')),
              Text('Asd', style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w300)),
              Text('Asd', style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w300)),
              Text('Asd', style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w300)),
              Text('Asd', style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w300)),
              Text('Asd', style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w300)),
              Text('Asd', style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w300)),
              Text('Asd', style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w300)),
            ],
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
}