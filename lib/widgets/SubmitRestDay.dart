import 'package:flutter/material.dart';
import 'package:workoutplan/global.dart' as global;

class SubmitRestDay extends StatelessWidget {

  final BuildContext preContext;
  final int dayId;

  SubmitRestDay(this.preContext, this.dayId);

  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Megerősítés'),
      content: Text('Szeretnéd megjelölni ezt a napot pihenőnapként? Ha igen, a jelenlegi adatok törlődnek.'),
      actions: [
        ElevatedButton(child: Text('Igen'), onPressed: () => deleteDayInfo(context, dayId)),
        ElevatedButton(child: Text('Nem'), onPressed: () => Navigator.pop(context))
      ],
    );
  }

  void deleteDayInfo(BuildContext context, int dayId) {
    global.days[dayId].plans = [];
    global.days[dayId].title = 'Pihenőnap';
    global.days[dayId].startTime = '';
    global.days[dayId].endTime = '';
    Navigator.pop(context);
  }
}