import 'package:flutter/material.dart';
import 'package:qbooking/feature/booking/presentation/widget/time_button_pick.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  int currentIndex = 0;


  void handleTimeSelection(TimeOfDay selectedTime, bool isStartTime) {
    if (isStartTime) {
      setState(() {
        startTime = selectedTime;
      });
    } else {
      if (selectedTime.hour < startTime.hour ||
          (selectedTime.hour == startTime.hour &&
              selectedTime.minute < startTime.minute)) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text(
                  'End time cannot be less than start time. Please select a new end time.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          endTime = selectedTime;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Icon(Icons.access_time_sharp),
            Text(
              "Time",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        // const SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: [
        //       Text("9:00"),
        //       SizedBox(
        //         width: 30,
        //       ),
        //       Text("10:00"),
        //       SizedBox(
        //         width: 30,
        //       ),
        //       Text("11:00"),
        //       SizedBox(
        //         width: 30,
        //       ),
        //       Text("12:00"),
        //       SizedBox(
        //         width: 30,
        //       ),
        //       Text("13:00"),
        //       SizedBox(
        //         width: 30,
        //       ),
        //       Text("14:00"),
        //       SizedBox(
        //         width: 30,
        //       ),
        //     ],
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TimePickerButton(
              titleTime: "Start Time",
              isStartTime: true,
              onTimeSelected: (time) => handleTimeSelection(time, true),
            ),
        
            TimePickerButton(
              titleTime: "End Time",
              isStartTime: false,
              onTimeSelected: (time) => handleTimeSelection(time, false),
            )
          ],
        ),
       
      ],
    );
  }
}
