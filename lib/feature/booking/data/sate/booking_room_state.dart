import 'package:flutter/material.dart';
import 'package:qbooking/feature/homepage/data/model/room_model_one_model.dart';
import 'package:qbooking/util/time_utll.dart';
import 'package:qbooking/widget/show_dialog.dart';

import '../../../../widget/show_confirm_dialog.dart';
import '../../../dashboard/dashboard_screen.dart';
import '../../../qr_code_page/qr_user_page.dart';
import '../data_source/booking_remote_data_source.dart';
// import '../../model/response_create_booking_model.dart';
import '../model/response_find_many_booking_model.dart';

class BookingRoomState with ChangeNotifier {
  DateTime dateTime = DateTime.now();
  TimeOfDay startTimeformat = TimeOfDay.now();
  TimeOfDay endTimeformat = TimeOfDay.now();
  String roomName = "";
  String roomId = "";

  final RoomModel roomData;

  String bookingId = "";
  List<ResponseFindManyBookingModel> bookedRoom = [];

  BookingRoomState(this.roomData);

  void dateTimeToString(DateTime date) {
    dateTime = date;
  }

  void startTimeToString(
      {required TimeOfDay time, required BuildContext context}) {
    startTimeformat = time;
  }

  void endtimeToString(TimeOfDay time) {
    endTimeformat = time;
  }

// Booking management Futures ..........
  Future<void> createBookingRoom(
      {required BuildContext context,
      required roomID,
      required roomName}) async {
    // final customerId = await ProfileRemoteDataSource().getUserId();

    final String meetingDate = dateTime.toIso8601String();
    final String startTime = TimeUtil.timeOfDayToString(startTimeformat);
    final String endTime = TimeUtil.timeOfDayToString(endTimeformat);

    // Debug print statements
    debugPrint("Meeting Date: $meetingDate");
    debugPrint("Start Time: $startTime");
    debugPrint("End Time: $endTime");

    final res = await BookingRemoteDataSource().createBooking(
      roomId: roomID,
      roomName: roomName,
      meetingDate: meetingDate,
      startTime: startTime,
      endTime: endTime,
    );

    res.fold((l) {
      const LoadingDialog().hide(context);
      debugPrint("Booking Failed : $l");
    }, (r) {
      const LoadingDialog().hide(context);
      debugPrint("Booking Successfully :$r");

      // Add the booked room to the bookedRoom list
      // bookedRoom.add(r);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => QrUserPage(
                    bookingData: r,
                  )));
    });
  }

  //delete Booking Room
  Future<void> deleteBookingRoom({
    required String id,
    required BuildContext context,
  }) async {
    // Show confirmation dialog
    bool? confirmDeletion = await showConfirmationDialog(
      context: context,
      title: 'Confirm Deletion',
      content: 'Are you sure you want to delete this booking?',
    );

    // If the user cancels the deletion, return early
    if (confirmDeletion != true) {
      return; // Exit the function without proceeding further
    }

    // Proceed with the deletion if confirmed
    final res = await BookingRemoteDataSource().deleteBooking(id: id);

    res.fold(
      (l) {
        debugPrint("Delete failed: $l");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete booking: $l')),
        );
      },
      (r) {
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Deleted Successfully: $r")),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
          (Route<dynamic> route) => false,
        );
      },
    );
  }

// Update Booking Rooms
  Future<void> updateBookingRooms({
    required BuildContext context,
    required String id,
    required DateTime datePickUp,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
  }) async {
    final res = await BookingRemoteDataSource().updateBookingRooms(
      id: id,
      meetingDate: datePickUp.toString(),
      startTime: TimeUtil.timeOfDayToString(startTime),
      endTime: TimeUtil.timeOfDayToString(endTime),
    );
    res.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to Update Booking: $l')),
      );
    }, (r) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Update Success: $r')),
      );
    });
  }
}
