import 'package:flutter/material.dart';

Future<TimeOfDay> chooseTime(BuildContext context) async {
  late TimeOfDay eventTime;
  eventTime =
      await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
      TimeOfDay.now();
  return eventTime;
}
