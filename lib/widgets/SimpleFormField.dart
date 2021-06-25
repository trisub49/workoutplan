import 'package:flutter/material.dart';

class SimpleFormField extends StatelessWidget {

  final String labelText;
  final String initialValue;
  final double width;

  SimpleFormField(this.labelText, this.initialValue, this.width);

  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: this.labelText),
        initialValue: this.initialValue
      )
    );
  }
}