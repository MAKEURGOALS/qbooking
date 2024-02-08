import 'package:flutter/material.dart';
import 'package:qbooking/data/room_data.dart';
import 'package:qbooking/feature/homepage/widget/box_room.dart';
import 'package:qbooking/model/room_model.dart';

class AvailableRoomStatus extends StatelessWidget {
  const AvailableRoomStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final List<RoomModel> availableRoom = RoomData().getAvailableRoom();

    return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: availableRoom.length,
            itemBuilder: ((context, index) => BoxRoomHomePage(
                 roomData:availableRoom[index] ,
                ))));

    // return const SingleChildScrollView(
    //   child: Column(
    //     children: [

    //       BoxRoomHomePage(
    //         roomstate: '5.00',
    //         changeimage: 'assets/images/meeting.jpg',
    //         statusRoom: true,
    //       ),
    //       BoxRoomHomePage(
    //         roomstate: '4.00',
    //         changeimage: 'assets/images/meeting2.jpg',
    //         statusRoom: true,
    //       ),
    //     ],
    //   ),
    // );
  }
}
