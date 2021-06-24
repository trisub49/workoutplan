import 'package:flutter/material.dart';

class EditTitleAndTime extends StatefulWidget {

  @override
  State<EditTitleAndTime> createState() => _EditTitleAndTimeState();
}

class _EditTitleAndTimeState extends State<EditTitleAndTime> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(7.5),
                width: 260,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Napod elnevezése, pl. Lábnap',
                  ),
                  validator: (String value) {
                  }
                )
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Icon(Icons.timer_sharp, size: 36),
                padding: EdgeInsets.all(7.5)
              ),
              Container(
                width: 100,
                padding: EdgeInsets.all(7.5),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Kezdés',
                  ),
                  validator: (String value) {
                  }
                )
              ),
              Container(child: Text('-'), width: 10),
              Container(
                width: 100,
                padding: EdgeInsets.all(7.5),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Befejezés',
                  ),
                  validator: (String value) {
                  }
                )
              )
            ]
          )
        ]
      )
    );
  }
}