import 'package:flutter/material.dart';

Future<TimeOfDay?> timePicker(
    {required BuildContext context, required TimeOfDay initValue}) async {
  return await showTimePicker(
    context: context,
    initialTime: initValue,
    initialEntryMode: TimePickerEntryMode.dial,
    builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child!,
      );
    },
  );
}
