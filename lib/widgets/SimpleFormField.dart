import 'package:flutter/material.dart';

class SimpleFormField extends StatelessWidget {

  final String labelText;
  final double width;
  final TextInputType type;
  final controller;

  SimpleFormField(this.labelText, this.width, this.type, this.controller);

  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: this.controller,
        keyboardType: type,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Adj meg egy értéket!';
          }
          return null;
        },
        decoration: InputDecoration(labelText: this.labelText)
      )
    );
  }
}