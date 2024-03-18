import 'package:flutter/material.dart';


class TimePickerButton extends StatefulWidget {
 const TimePickerButton({
    super.key,
    required this.titleTime,
    required this.isStartTime,
    required this.onTimeSelected,
 });
 final String titleTime;
 final bool isStartTime;
 final Function(TimeOfDay) onTimeSelected;

 @override
 State<TimePickerButton> createState() => _TimePickerButtonState();
}

class _TimePickerButtonState extends State<TimePickerButton> {
 TimeOfDay selectedTime = TimeOfDay.now();

 @override
 Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.titleTime, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        ElevatedButton(
          onPressed: () async {
            final TimeOfDay? timeOfDay = await showTimePicker(
              context: context,
              initialTime: selectedTime,
              initialEntryMode: TimePickerEntryMode.dial,
              builder: (BuildContext context, Widget? child) {
                return MediaQuery(
                 data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                 child: child!,
                );
              },
            );
            if (timeOfDay != null) {
              setState(() {
                selectedTime = timeOfDay;
              });
              widget.onTimeSelected(selectedTime);
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, foregroundColor: Colors.black),
          child: Row(
            children: [
              const Icon(Icons.access_time),
              const SizedBox(width: 20),
              Text(selectedTime.format(context)) ,// Display time in AM/PM format
               const SizedBox(width: 5),
              // Display AM/PM based on the selected time
              Text(selectedTime.period == DayPeriod.am ? "AM" : "PM"),
            ],
          ),
        ),
      ],
    );
 }
}