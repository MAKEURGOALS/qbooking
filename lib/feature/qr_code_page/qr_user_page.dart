import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbooking/feature/booking/data/model/response_create_booking_model.dart';
import 'package:qbooking/feature/booking/presentation/widget/button_booking.dart';

import '../booking/presentation/widget/barcode_user.dart';
import '../booking/presentation/widget/circle_pic_user.dart';
import '../dashboard/dashboard_screen.dart';
import 'widget/text_container_user_qr.dart';
import '../profile/presentation/state/profile_state.dart';

class QrUserPage extends StatelessWidget {
  const QrUserPage({
    super.key,
    required this.bookingData,
  });

  final ResponseCreateBookingModel bookingData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            foregroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text("Booking")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                      ),
                      Container(
                        height: 500,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 35, 32, 32),
                            borderRadius: BorderRadius.circular(7)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),

                              Text(
                                context
                                    .read<ProfileState>()
                                    .nameController
                                    .text,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.sensor_door_outlined,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    bookingData.roomName ?? "",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.white54,
                                thickness: 2,
                                // indent: 30,
                                // endIndent: 30,
                              ),
                              TextContainerUser(
                                titleCon: 'Schedule',
                                iconContainer: Icons.calendar_month_outlined,
                                endtitleCon: bookingData.meetingDate ?? "",
                              ),
                              TextContainerUser(
                                titleCon: 'Hours',
                                iconContainer: Icons.access_time,
                                endtitleCon:
                                    "${bookingData.startTime}  - ${bookingData.endTime}",
                              ),
                              const Divider(
                                color: Colors.white54,
                                thickness: 2,
                              ),
                              const TextContainerUser(
                                titleCon: 'Note',
                                iconContainer: Icons.library_books_outlined,
                                endtitleCon: 'Thanks for your Booking',
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              // Qrcodedetail()
                              BarCodeUser(
                                qrData: bookingData.id ?? "",
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CirclePicUser(),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ButtonBooking(
                titleButton: 'Done',
                backgroundColor: const Color.fromARGB(255, 35, 32, 32),
                titleColor: Colors.white,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardScreen()));
                },
              )
            ],
          ),
        ));
  }
}
