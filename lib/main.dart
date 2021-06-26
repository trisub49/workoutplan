import 'package:flutter/material.dart';
import 'package:workoutplan/global.dart' as global;
import 'package:workoutplan/routes/HomePage.dart';

void main() {
  global.initDays();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
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

