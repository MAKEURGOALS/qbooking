import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:qbooking/data/room_data.dart';
import 'package:qbooking/feature/homepage/presentation/widget/box_room.dart';

import '../../data/model/room_model_one_model.dart';
import '../state/room_state.dart';

class AvailableRoomStatus extends StatelessWidget {
  const AvailableRoomStatus({super.key});
  @override
  Widget build(BuildContext context) {
    // final List<RoomModel> availableRoom = [];
   

    return FutureBuilder<List<RoomModel>>(
      future: context.read<RoomState>().getAllRoom(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData == true) {
            final List<RoomModel> availableRooms = snapshot.data
                    ?.where((room) => room.isActiveStatus == true)
                    .toList() ??
                [];

            return ListView.builder(
              shrinkWrap: true,
              itemCount: availableRooms.length,
              itemBuilder: (context, index) {
                return BoxRoomHomePage(roomData: availableRooms[index]);
              },
            );
          } else if (snapshot.hasError == true) {
            return const Center(
              child: Text("Something went wrong"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
