import 'package:flutter/material.dart';
import 'package:workoutplan/routes/Planner.dart';
import 'package:workoutplan/widgets/Button.dart';
import 'package:workoutplan/global.dart' as global;

class HomePage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edzésterv készítő")),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("./assets/images/workout_background.jpg"), 
            fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Button('Tervezés', Icons.calendar_today, () => global.navigate(context, Planner()), 360, 60),
              SizedBox(height: 30),
              Button('Kalória számláló', Icons.calculate_outlined, () => global.navigate(context, Planner()), 360, 60),
              Spacer()
            ]
          )
        )
      )
    );
  }
}