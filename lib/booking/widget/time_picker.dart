import 'package:flutter/material.dart';
import 'package:qbooking/booking/widget/time_button_pick.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay selectedTime = TimeOfDay.now();
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Icon(Icons.access_time_sharp),
            Text(
              "Time",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text("9:00"),
              SizedBox(
                width: 30,
              ),
              Text("10:00"),
              SizedBox(
                width: 30,
              ),
              Text("11:00"),
              SizedBox(
                width: 30,
              ),
              Text("12:00"),
              SizedBox(
                width: 30,
              ),
              Text("13:00"),
              SizedBox(
                width: 30,
              ),
              Text("14:00"),
              SizedBox(
                width: 30,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TimePickerButton(titleTime: 'Start time',),
              TimePickerButton(titleTime: 'End time',)
            ],
          ),
        )
      ],
    );
  }
}
