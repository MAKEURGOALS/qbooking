import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qbooking/feature/profile/presentation/data/data_source/profile_remote_data_source.dart';
import 'package:qbooking/widget/message_dialog.dart';
import 'package:qbooking/widget/show_dialog.dart';

import '../data_source/booking_remote_data_source.dart';

class BookingRoomState with ChangeNotifier {
  final List _addEquipment = [];



// Booking management Futures ..........
  Future<void> getBookingRoom({
    required BuildContext context,
    required String roomId,
    required String roomName,
    required String meetingDate,
    required String startTime,
    required String endTime,
    required String equipment,
  }) async {
    final customerId = await ProfileRemoteDataSource().getUserId();
    final res = await BookingRemoteDataSource().getBooking(
        customerId: customerId,
        roomId: roomId,
        roomName: roomName,
        meetingDate: meetingDate,
        startTime: startTime,
        endTime: endTime,
        equipment: equipment);
    res.fold((l) {
      const LoadingDialog().hide(context);
      print(l);
    }, (r) {
      const LoadingDialog().hide(context);
      print("Booking Successfully $r");
    });
  }

// equipment management Future .........👌
  void addEquipment(
      {required String equipment, required BuildContext context}) {
    final listSelectEquipment =
        _addEquipment.where((element) => element == equipment);

    if (listSelectEquipment.isNotEmpty) {
      removeEquipment(equipment);
    } else if (_addEquipment.isNotEmpty) {
      messageDialod(
          context: context, message: 'Please Select only 1 equipment');
    } else {
      _addEquipment.add(equipment);
    }

    // notifyListeners();
  }

  void removeEquipment(String equipment) {
    _addEquipment.removeWhere((item) => item == equipment);
  }

  bool isSelectEquipment(String equipment) {
    final listSelectEquipment =
        _addEquipment.where((element) => element == equipment);
    // notifyListeners();

    if (listSelectEquipment.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
