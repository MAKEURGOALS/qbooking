import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:qbooking/constant/image_constant.dart';
import '../../homepage/data/model/room_model_one_model.dart';
import '../../homepage/presentation/widget/box_room.dart';
import 'state/favorite_room_state.dart';

class FavoriteHomePage extends StatelessWidget {
  const FavoriteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Favorite',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder<List<RoomModel>>(
          future: context.read<FavoriteRoomState>().getFavoriteRoom(),
          builder:
              (BuildContext context, AsyncSnapshot<List<RoomModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                // Check if the list of favorite rooms is empty
                if (snapshot.data?.isEmpty ?? true) {
                  // Display a message if there are no favorite rooms
                  return  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(LottieConstant.waiting),
                        const Text(
                          'You have no favorite rooms.',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                } else {
                  // If there are favorite rooms, display them
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) => BoxRoomHomePage(
                      roomData: snapshot.data![index],
                    ),
                  );
                }
              } else {
                return const Text('Empty data');
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          },
        ));
  }
}
