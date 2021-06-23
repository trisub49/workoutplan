import 'package:flutter/material.dart';

class Button extends StatelessWidget 
{
  final String title;
  final IconData icon;
  final VoidCallback onPress;

  Button(this.title, this.icon, this.onPress);

  @override
  Widget build(BuildContext context) 
  {
    return SizedBox(
      width: 360, 
      height: 60,
      child: ElevatedButton(
        
        child: Row(
          children: [
            Spacer(),
            Text(title, style: TextStyle(fontSize: 20.0, color: Colors.black)),
            Spacer(),
            Icon(icon, color: Colors.black, size: 24)
          ]
        ),
        onPressed: onPress
      )
    );
  }
}