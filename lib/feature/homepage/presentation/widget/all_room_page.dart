import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbooking/feature/homepage/presentation/state/room_state.dart';
import 'package:qbooking/feature/homepage/presentation/widget/box_room.dart';
import 'package:qbooking/feature/homepage/data/model/room_model_one_model.dart';

class AllRoomPage extends StatelessWidget {
  const AllRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final allRoomPage = RoomData.allRoom;
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
