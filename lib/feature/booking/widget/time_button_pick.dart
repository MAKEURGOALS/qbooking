import 'package:flutter/material.dart';
import 'package:qbooking/feature/booking/widget/slide_am_pm.dart';

class TimePickerButton extends StatefulWidget {
  const TimePickerButton({
    super.key,
    required this.titleTime,
  });
  final String titleTime;

  @override
  State<TimePickerButton> createState() => _TimePickerButtonState();
}

class _TimePickerButtonState extends State<TimePickerButton> {
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isAMSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.titleTime,
          
        ),
        Row(
          children: [
            ElevatedButton(
            onPressed: () async {
              final TimeOfDay? timeOfDay = await showTimePicker(
                context: context,
                initialTime: selectedTime,
                initialEntryMode: TimePickerEntryMode.dial,
              );
              if (timeOfDay != null) {
                setState(() {
                  selectedTime = timeOfDay;
                });
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, foregroundColor: Colors.black),
            child: Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(
                  width: 20,
                ),
                Text("${selectedTime.hour}:${selectedTime.minute}")
              ],
            )
            ),
            const SizedBox(width: 10,),
            const SliderAmAndPm(),
            const SizedBox(width: 18,),

        // InkWell(
        //   onTap: () {
        //     setState(() {
        //       isAMSelected = !isAMSelected;
        //     });
        //   },
        //   child: Container(
        //     padding: const EdgeInsets.all(8),
        //     decoration: BoxDecoration(
        //         color: isAMSelected ? Colors.black : Colors.white,
        //         borderRadius: BorderRadius.circular(6)),
        //     child: Row(
        //       children: [
        //         Text(
        //           "Am",
        //           style: TextStyle(
        //               color: isAMSelected ? Colors.white : Colors.black),
        //         ),
        //         const SizedBox(width: 8),
        //         Text(
        //           "PM",
        //           style: TextStyle(
        //               color: isAMSelected ? Colors.white : Colors.black),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
          ],
        )
      ],
    );
  }
}
