import 'package:flutter/material.dart';
import 'package:qbooking/homepage/widget/box_room.dart';

class AvailableRoomStatus extends StatelessWidget {
  const AvailableRoomStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
        
          BoxRoomHomePage(
            roomstate: '5.00',
            changeimage: 'assets/images/meeting.jpg',
            statusRoom: true,
          ),
          BoxRoomHomePage(
            roomstate: '4.00',
            changeimage: 'assets/images/meeting2.jpg',
            statusRoom: true,
          ),
        ],
      ),
    );
  }
}