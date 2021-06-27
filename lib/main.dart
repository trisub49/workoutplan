import 'package:flutter/material.dart';
import 'package:workoutplan/global.dart' as global;
import 'package:workoutplan/routes/HomePage.dart';

void main() {
  runApp(MyApp());
  global.loadAllFood();
  global.initDays();
}

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edzésterv készítő',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Roboto'
      ),
      home: HomePage()
    );
  }
}

