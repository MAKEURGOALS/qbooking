import 'package:flutter/material.dart';
import 'package:qbooking/booking/widget/button_booking.dart';
import 'package:qbooking/booking/widget/date_pick.dart';
import 'package:qbooking/booking/widget/equipment.dart';
import 'package:qbooking/booking/widget/slider_picture.dart';
import 'package:qbooking/booking/widget/text_picture_status.dart';
import 'package:qbooking/booking/widget/time_picker.dart';

class BookingHomePage extends StatelessWidget {
  const BookingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 231, 231),
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            "Booking",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body:  const Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextPictureStatus(),
                SliderPicture(),
                SizedBox(
                  height: 20,
                ),
                DatePickUp(),
                SizedBox(
                  height: 20,
                ),
                TimePicker(),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "EQUIPMENT",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Equipment(
                            titleEq: 'Microphone',
                          ),
                          Equipment(
                            titleEq: 'TV',
                          ),
                          Equipment(
                            titleEq: 'Board',
                          ),
                          Equipment(
                            titleEq: 'plasma display',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Equipment(
                          titleEq: 'Wifi',
                        ),
                        Equipment(
                          titleEq: 'Capacity 15',
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "DETAILS:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "This room is equipped with all the necessary equipment for lectures, meetings and negotiations."
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                ButtonBooking(titleButton: 'Booking now',)

                  ],
                )
  

              ],
            ),
          ),
        ));
  }
}
