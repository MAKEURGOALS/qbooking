import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qbooking/feature/profile/presentation/data/data_source/profile_remote_data_source.dart';
import 'package:qbooking/widget/message_dialog.dart';
import 'package:qbooking/widget/show_dialog.dart';

import '../data_source/booking_remote_data_source.dart';

class BookingRoomState with ChangeNotifier {
  final List _addEquipment = [];
  String dateTime = "";
  String startTimeformat = "";
  String endTimeformat = "";

  
  void dateTimeToString(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    dateTime = formatter.format(date);
    print(dateTime);
  }

  void startTimeToString(TimeOfDay time) {
    final String formattedTime =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    startTimeformat = formattedTime;
  }
  void endtimeToString(TimeOfDay time) {
    final String formattedTime =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    endTimeformat = formattedTime;
  }

// Booking management Futures ..........
  Future<void> createBookingRoom({
  required BuildContext context,
  required String roomId,
  required String roomName,

}) async {
  final customerId = await ProfileRemoteDataSource().getUserId();
  
 
  final res = await BookingRemoteDataSource().getBooking(
    customerId: customerId,
    roomId: roomId,
    roomName: roomName,
    meetingDate: dateTime,
    startTime: startTimeformat,
    endTime: endTimeformat,
    
  );
  print(res);
   res.fold((l) {
    const LoadingDialog().hide(context);
    debugPrint(l);
  }, (r) {
    const LoadingDialog().hide(context);
    
    print("Booking Successfully $r");
  });
  



  
 
}

String selectedEquipment(){
  print(_addEquipment);
  if(_addEquipment.isEmpty){
    return '';
  }else{
    return _addEquipment[0];
  }
}


// equipment management Future .........👌
  // void addEquipment(
  //     {required String equipment, required BuildContext context}) {
  //       print(_addEquipment);
  //   final listSelectEquipment =
  //       _addEquipment.where((element) => element == equipment);

  //   if (listSelectEquipment.isNotEmpty) {
  //     removeEquipment(equipment);
  //   } else if (_addEquipment.isNotEmpty) {
  //     messageDialod(
  //         context: context, message: 'Please Select only 1 equipment');
  //   } else {
  //     _addEquipment.add(equipment);
  //   }

  //   // notifyListeners();
  // }

  // void removeEquipment(String equipment) {
  //   _addEquipment.removeWhere((item) => item == equipment);
  // }

  // bool isSelectEquipment(String equipment) {
  //   final listSelectEquipment =
  //       _addEquipment.where((element) => element == equipment);
  //   // notifyListeners();

  //   if (listSelectEquipment.isNotEmpty) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
