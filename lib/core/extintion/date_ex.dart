import 'package:intl/intl.dart';

extension DateEx on DateTime {
  String get getMonthName {
    DateFormat dateFormat = DateFormat("MMMM");
    return dateFormat.format(this);
  }
}
