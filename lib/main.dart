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
        primarySwatch: Colors.green
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
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Button('Tervezés', () => setPage(1)),
            SizedBox(height: 20),
            Button('Jegyzet', () => setPage(2)),
            Spacer()
          ])
        
      )
    );
  }

  setPage(page) {
    page ++;
    return page;
  }
}
