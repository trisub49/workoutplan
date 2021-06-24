import 'package:flutter/material.dart';
import 'package:workoutplan/routes/Planner.dart';
import 'package:workoutplan/widgets/Button.dart';
import 'package:workoutplan/global.dart' as global;

void main() {
  global.initDays();
  runApp(MyApp());
}

class MyApp extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      title: 'Edzésterv készítő',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Roboto'
      ),
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
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
              Button('Tervezés', Icons.calendar_today, () => navigate(context, Planner()), 360, 60),
              SizedBox(height: 30),
              Button('Jegyzet', Icons.edit_rounded, () => navigate(context, Planner()), 360, 60),
              SizedBox(height: 30),
              Button('Kalória számláló', Icons.calculate_outlined, () => navigate(context, Planner()), 360, 60),
              Spacer()
            ]
          )
        )
      )
    );
  }

  void navigate(context, page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
