import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:qbooking/constant/image_constant.dart';
import 'package:qbooking/feature/homepage/presentation/state/room_state.dart';
import 'package:qbooking/feature/homepage/presentation/widget/box_room.dart';
import 'package:qbooking/feature/homepage/data/model/room_model_one_model.dart';

class AllRoomPage extends StatelessWidget {
 const AllRoomPage({super.key});

 @override
 Widget build(BuildContext context) {
    return FutureBuilder<List<RoomModel>>(
        future: context.read<RoomState>().getAllRoom(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                 shrinkWrap: true,
                 itemCount: snapshot.data?.length ?? 0,
                 itemBuilder: (context, index) {
                    return BoxRoomHomePage(
                      roomData: snapshot.data?[index] ?? RoomModel(),
                    );
                 }
                 );
            } else if (snapshot.hasError) {

              // Correctly handling the error state
              return Center(
                 child: Column(
                children: [
                  Text("Something went wrong $snapshot"),
                 Lottie.asset(LottieConstant.waiting)
                ],
              ));
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // Handling other states if necessary
          return const Center(
            child: Text('something went wrong'),
          );
        }
        );
 }
}
