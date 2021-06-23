import 'package:flutter/material.dart';
import 'package:workoutplan/widgets/Button.dart';

void main() 
{
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
        primarySwatch: Colors.cyan
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
                  Button('Tervezés', Icons.calendar_today, () => setPage(1)),
                  SizedBox(height: 30),
                  Button('Jegyzet', Icons.edit_rounded, () => setPage(2)),
                  SizedBox(height: 30),
                  Button('Kalória számláló', Icons.calculate_outlined, () => setPage(3)),
                  Spacer()
                ]
              )
            )
          )
        );
  }

  setPage(page) {
    page ++;
    return page;
  }
}
