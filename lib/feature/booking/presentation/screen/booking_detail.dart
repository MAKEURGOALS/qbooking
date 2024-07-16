import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbooking/feature/booking/data/sate/booking_room_state.dart';
import 'package:qbooking/feature/booking/presentation/widget/button_booking.dart';
import 'package:qbooking/feature/booking/presentation/widget/date_pick.dart';
import 'package:qbooking/feature/booking/presentation/widget/equipment.dart';
import 'package:qbooking/feature/booking/presentation/widget/slider_picture.dart';
import 'package:qbooking/feature/booking/presentation/widget/text_picture_status.dart';
import 'package:qbooking/feature/homepage/data/model/room_model_one_model.dart';

import '../../../../constant/colors_constant.dart';
import '../widget/selected_time';
import '../widget/time_button_pick.dart';

class BookingDetail extends StatefulWidget {
  const BookingDetail({
    super.key,
    required this.roomData,
  });
  final RoomModel roomData;

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
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
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(3),
              child: Container(
                color: ColorsConstants.borderAppbarColor,
                height: 1,
              )),
        ),
        body: Container(
          decoration: const BoxDecoration(
              color: ColorsConstants.primaryBackgroundColor),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextPictureStatus(
                    roomData: widget.roomData,
                  ),
                  SliderPicture(
                    roomData: widget.roomData,
                  ),
                  const SizedBox(height: 20),
                  DatePickUp(
                    onSelectedDate: (DateTime value) {
                      context.read<BookingRoomState>().dateTimeToString(value);
                    },
                    datePickUp: DateTime.now(),
                  ),
                  const SizedBox(height: 20),

                  const Row(
                    children: [
                      Icon(Icons.access_time_sharp),
                      Text(
                        "Time",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  //Selected Time button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TimePickerButton(
                        titleTime: "Start Time",
                        isStartTime: true,
                        onTimeSelected: (time) {
                          setState(() {
                            context.read<BookingRoomState>().startTimeToString(
                                time: time, context: context);
                            print(time);
                          });
                        },
                        time: TimeOfDay.now(),
                      ),
                      const SizedBox(width: 8),
                      TimePickerButton(
                        titleTime: "End Time",
                        isStartTime: false,
                        onTimeSelected: (time) {
                          context
                              .read<BookingRoomState>()
                              .endtimeToString(time);
                        },
                        time: TimeOfDay.now(),
                      )
                    ],
                  ),

                  const SizedBox(height: 15),
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
                        backgroundColor: Colors.black,
                        titleColor: Colors.white,
                        onTap: () {
                          context.read<BookingRoomState>().createBookingRoom(
                                context: context,
                                roomID: widget.roomData.id,
                                roomName: widget.roomData.roomName,
                              );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
