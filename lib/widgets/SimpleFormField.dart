import 'package:flutter/material.dart';

class SimpleFormField extends StatelessWidget {

  final String labelText;
  final String initialValue;
  final double width;
  final TextInputType type;

  SimpleFormField(this.labelText, this.initialValue, this.width, this.type);

  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: type,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Adj meg egy értéket!';
          }
          return null;
        },
        decoration: InputDecoration(labelText: this.labelText),
        initialValue: this.initialValue
      )
    );
  }
}