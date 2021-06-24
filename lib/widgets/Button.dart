import 'package:flutter/material.dart';

class Button extends StatelessWidget 
{
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final double width;
  final double height;

  Button(this.title, this.icon, this.onPress, this.width, this.height);

  @override
  Widget build(BuildContext context) 
  {
    return SizedBox(
      width: this.width, 
      height: this.height,
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