import 'package:flutter/material.dart';

class TimeUtil {
  static TimeOfDay stringToTimeOfDay(String tod) {
    try {
      // final format = DateFormat.jm();
      return TimeOfDay(
          hour: int.parse(tod.split(":")[0]),
          minute: int.parse(tod.split(":")[1]));
    } catch (e) {
      return TimeOfDay.now();
    }
  }

  static String timeOfDayToString(TimeOfDay tod) {
    try {
      // final format = DateFormat.jm()

      return '${tod.hour.toString().padLeft(2, '0')}:${tod.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return "00:00";
    }
  }
}
