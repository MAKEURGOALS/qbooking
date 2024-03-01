import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:qbooking/data/room_data.dart';
import 'package:qbooking/feature/homepage/widget/box_room.dart';

import '../../model/room_model_one_model.dart';
import 'state/room_state.dart';

class AvailableRoomStatus extends StatelessWidget {
  const AvailableRoomStatus({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<RoomModel> availableRoom = [];

  return FutureBuilder<List<RoomModel>>(
        // context.read<LoginState>().login(context);
        future: context.read<RoomState>().getAllRoom(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData == true) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return BoxRoomHomePage(
                      roomData: snapshot.data?[index] ?? RoomModel(),
                    );
                  });
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
        })
        );



    // return Expanded(
    //     child: ListView.builder(
    //         shrinkWrap: true,
    //         itemCount: availableRoom.length,
    //         itemBuilder: ((context, index) => BoxRoomHomePage(
    //               roomData: availableRoom[index],
    //             ))));
  }
}
