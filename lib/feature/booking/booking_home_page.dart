import 'package:flutter/material.dart';
import 'package:qbooking/feature/booking/qr_user_page.dart';
import 'package:qbooking/feature/booking/widget/button_booking.dart';
import 'package:qbooking/feature/booking/widget/date_pick.dart';
import 'package:qbooking/feature/booking/widget/equipment.dart';
import 'package:qbooking/feature/booking/widget/slider_picture.dart';
import 'package:qbooking/feature/booking/widget/text_picture_status.dart';
import 'package:qbooking/feature/booking/widget/time_picker.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextPictureStatus(),
                const SliderPicture(),
                const SizedBox(
                  height: 20,
                ),
                const DatePickUp(),
                const SizedBox(
                  height: 20,
                ),
                const TimePicker(),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "EQUIPMENT",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Column(
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
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "DETAILS:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    "This room is equipped with all the necessary equipment for lectures, meetings and negotiations."),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonBooking(
                      titleButton: 'Booking now',
                      color: Colors.black,
                      titleColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QrUserPage()));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
