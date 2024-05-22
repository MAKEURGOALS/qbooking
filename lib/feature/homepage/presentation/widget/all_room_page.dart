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
              },
            );
          } else if (snapshot.hasError) {
            // Handle the error state and display the error message
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Error ${snapshot.error}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Lottie.asset(LottieConstant.error),
                ],
              ),
            );
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // Handling other states if necessary
        return const SnackBar(content: Text('Error'));
      },
    );
  }
}
