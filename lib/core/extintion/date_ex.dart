import 'package:intl/intl.dart';

extension DateEx on DateTime {
  String get getMonthName {
    DateFormat dateFormat = DateFormat("MMMM");
    return dateFormat.format(this);
  }
  String get dateFormated{
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    return dateFormat.format(this);
  }
  String get dateFormatedForListTile{
    DateFormat dateFormat = DateFormat("dd MMMM yyyy");
    return dateFormat.format(this);
  }
  String get dateFormatWithHourAndMinutes{
    DateFormat dateFormat = DateFormat("hh:mma");
    return dateFormat.format(this);
  }
}
