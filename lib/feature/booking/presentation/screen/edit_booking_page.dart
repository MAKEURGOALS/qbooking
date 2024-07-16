import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbooking/feature/booking/data/data_source/booking_remote_data_source.dart';
import 'package:qbooking/feature/booking/data/model/response_find_many_booking_model.dart';
import 'package:qbooking/feature/booking/data/sate/booking_room_state.dart';
import 'package:qbooking/feature/booking/presentation/widget/booking_bio.dart';
import 'package:qbooking/feature/booking/presentation/widget/button_booking.dart';
import 'package:qbooking/feature/booking/presentation/widget/date_pick.dart';
import 'package:qbooking/feature/booking/presentation/widget/equipment.dart';
import 'package:qbooking/util/date_time_util.dart';
import 'package:qbooking/util/time_utll.dart';
import '../../../../constant/colors_constant.dart';
import '../widget/booking_picture.dart';
import '../widget/time_button_pick.dart';

class EditBookingPage extends StatefulWidget {
  final ResponseFindManyBookingModel bookingData;

  const EditBookingPage({
    super.key,
    required this.bookingData,
  });

  @override
  State<EditBookingPage> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<EditBookingPage> {
  DateTime dateTime = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  @override
  void initState() {
    setState(() {
      dateTime =
          DateTimeUtil.stringToDateTime(widget.bookingData.meetingDate ?? "");
      startTime =
          TimeUtil.stringToTimeOfDay(widget.bookingData.startTime ?? "");
      endTime = TimeUtil.stringToTimeOfDay(widget.bookingData.endTime ?? "");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookingState = context.watch<BookingRoomState>();
    return Provider<BookingRemoteDataSource>(
        create: (context) => BookingRemoteDataSource(),
        builder: (context, child) {
          return RefreshIndicator(
            onRefresh: () async =>
                await context.read<BookingRemoteDataSource>().fetchBooking(),
            child: Scaffold(
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
                          BookingBio(
                              roomData: widget.bookingData.roomId ?? RoomId()),
                          BookingPicture(
                            roomData: widget.bookingData.roomId ?? RoomId(),
                          ),
                          const SizedBox(height: 20),
                          DatePickUp(
                            onSelectedDate: (DateTime value) {
                              dateTime = value;
                            },
                            datePickUp: dateTime,
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
                          Text(
                              "Start Time:  ${TimeUtil.timeOfDayToString(startTime)}"),
                          Text(
                              "End Time: ${TimeUtil.timeOfDayToString(endTime)}"),
                          Text(
                              "Date Booking: ${DateTimeUtil.dateTimeToString(dateTime)}"),

                          //Selected Time button
                          Row(
                            children: [
                              TimePickerButton(
                                titleTime: "Start Time",
                                isStartTime: true,
                                onTimeSelected: (time) {
                                  setState(() {
                                    startTime = time;
                                  });
                                },
                                time: startTime,
                              ),
                              const SizedBox(width: 8),
                              TimePickerButton(
                                titleTime: "End Time",
                                isStartTime: false,
                                onTimeSelected: (time) {
                                  setState(() {
                                    endTime = time;
                                  });
                                },
                                time: endTime,
                              )
                            ],
                          ),

                          const SizedBox(height: 15),
                          const Text(
                            "EQUIPMENT",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ButtonBooking(
                                titleButton: 'Edit Booking',
                                backgroundColor: Colors.white,
                                titleColor: Colors.black,
                                onTap: () async {
                                  await bookingState.updateBookingRooms(
                                      context: context,
                                      id: widget.bookingData.id ?? "",
                                      datePickUp: dateTime,
                                      startTime: startTime,
                                      endTime: endTime);
                                },
                              ),
                              ButtonBooking(
                                titleButton: 'Cancel Booking',
                                backgroundColor: Colors.black,
                                onTap: () async {
                                  await bookingState.deleteBookingRoom(
                                      id: widget.bookingData.id ?? "",
                                      context: context);
                                },
                                titleColor: Colors.white,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          );
        });
  }
}
