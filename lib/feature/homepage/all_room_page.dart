import 'package:flutter/material.dart';
import 'package:qbooking/data/room_data.dart';
import 'package:qbooking/feature/homepage/widget/box_room.dart';

class AllRoomPage extends StatelessWidget {
  const AllRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final allRoomPage = RoomData.allRoom;
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: allRoomPage.length,
          itemBuilder: (context, index) => BoxRoomHomePage(
                roomData: allRoomPage[index],
              )),
    );

    // const SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       BoxRoomHomePage(
    //         roomstate: '5.00',
    //         changeimage: 'assets/images/meeting.jpg',
    //         statusRoom: false,
    //       ),
    //       BoxRoomHomePage(
    //         roomstate: '4.00',
    //         changeimage: 'assets/images/meeting2.jpg',
    //         statusRoom: false,
    //       ),
    //       BoxRoomHomePage(
    //         roomstate: '4.00',
    //         changeimage: 'assets/images/meeting2.jpg',
    //         statusRoom: false,
    //       ),
    //     ],
    //   ),
    // );
  }
}
