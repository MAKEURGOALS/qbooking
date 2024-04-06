import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbooking/feature/booking/presentation/widget/button_booking.dart';
import 'package:qbooking/feature/homepage/data/model/room_model_one_model.dart';

import '../../profile/presentation/state/profile_state.dart';
import 'widget/barcode_user.dart';
import 'widget/circle_pic_user.dart';
import 'widget/text_container_user_qr.dart';

class QrUserPage extends StatelessWidget {
  const QrUserPage({super.key, required this.roomData});
  final RoomModel roomData;
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
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
                                    roomData.roomName ?? "",
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
                              const TextContainerUser(
                                titleCon: 'Schedule',
                                iconContainer: Icons.calendar_month_outlined,
                                endtitleCon: 'Now',
                              ),
                              const TextContainerUser(
                                titleCon: 'Hours',
                                iconContainer: Icons.access_time,
                                endtitleCon: 'Now',
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
                              const BarCodeUser()
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
                color: const Color.fromARGB(255, 35, 32, 32),
                titleColor: Colors.white,
                onTap: () {},
              )
            ],
          ),
        ));
  }
}
