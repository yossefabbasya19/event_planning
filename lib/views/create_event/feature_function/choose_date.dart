import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<DateTime> chooseDate(BuildContext context) async {
  DateTime selectDate =
      await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
      ) ??
          DateTime.now();
  return selectDate;
}