import 'package:flutter/material.dart';

class DayActions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.swap_vertical_circle_outlined, size: 30, color: Colors.green),
        SizedBox(height: 50,),
        Icon(Icons.bedtime_outlined, size: 30, color: Colors.green)
      ]
    );
  }
}