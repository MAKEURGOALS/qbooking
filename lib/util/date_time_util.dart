import 'package:intl/intl.dart';

class DateTimeUtil {
  static String dateTimeToString(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final formated = formatter.format(date);
    return formated;
  }

  static DateTime stringToDateTime(String date) {
    try {
      final time = DateTime.tryParse(date);
      return time ?? DateTime.now();
    } catch (e) {
      return DateTime.now();
    }
  }
}
