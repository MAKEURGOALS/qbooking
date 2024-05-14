
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qbooking/feature/homepage/data/model/room_model_one_model.dart';
import 'package:qbooking/feature/profile/presentation/data/data_source/profile_remote_data_source.dart';
import 'package:qbooking/widget/show_dialog.dart';

import '../../../qr_code_page/qr_user_page.dart';
import '../../data_source/booking_remote_data_source.dart';
// import '../../model/response_create_booking_model.dart';
import '../../model/response_find_many_booking_model.dart';

class BookingRoomState with ChangeNotifier {
  String dateTime = "";
  String startTimeformat = "";
  String endTimeformat = "";
  String roomName = "";
  String roomId = "";

  late final RoomModel roomData ;

  String bookingId = "";
  List<ResponseFindManyBookingModel> bookedRoom = [];

 

  void dateTimeToString(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    dateTime = formatter.format(date);
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
    required roomID,
    required roomName
    
  }) async {
    final customerId = await ProfileRemoteDataSource().getUserId();
    
    final res = await BookingRemoteDataSource().createBooking(
      customerId: customerId,
      roomId: roomID,
      roomName: roomName,
      meetingDate: dateTime,
      startTime: startTimeformat,
      endTime: endTimeformat,
    );

    res.fold((l) {
       const LoadingDialog().hide(context);
      debugPrint(l);
    }, (r) {
       const LoadingDialog().hide(context);
      debugPrint("Booking Successfully :$r");
      
      // Add the booked room to the bookedRoom list
      // bookedRoom.add(r);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>   QrUserPage(bookingData: r ,)));
    });
  }

  // void checkDataBooking(BuildContext context){
  //   if(startTimeformat.isNotEmpty && endTimeformat.isNotEmpty){
  //     createBookingRoom(context: context, roomId: roomId, roomName: roomName);
      
  //   }else{
  //     const snackBar = SnackBar(content: Text("Please Enter all required data"));
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   }
  // }

  //add room when is successful
  // Future<List<ResponseBookingModel>>showBookingRoom() async{
  //   return bookedRoom;
  // }

  
}
