import 'package:flutter/material.dart';

extension timeEx on TimeOfDay {
  String get timeFormated {
    if (minute < 10) {
      if (hourOfPeriod < 10) return "0$hourOfPeriod:0$minute";
      return "$hourOfPeriod:0$minute";
    }
    if (hourOfPeriod < 10) return "0$hourOfPeriod:$minute";
    return "$hourOfPeriod:$minute";
  }
}
