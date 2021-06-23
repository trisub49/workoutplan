import 'package:flutter/material.dart';

class Button extends StatelessWidget 
{
  final String title;
  final VoidCallback onPress;

  Button(this.title, this.onPress);

  @override
  Widget build(BuildContext context) 
  {
    return SizedBox(
      width: 300, 
      height: 70,
      child: ElevatedButton(
        child: Text(
          title,
          style: TextStyle(fontSize: 24.0)
        ),
        onPressed: onPress
      )
    );
  }
}