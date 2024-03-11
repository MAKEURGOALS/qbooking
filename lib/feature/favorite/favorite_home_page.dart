import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../homepage/data/model/room_model_one_model.dart';
import '../homepage/presentation/widget/box_room.dart';
import 'presentation/state/favorite_room_state.dart';

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
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) => BoxRoomHomePage(
                          roomData: snapshot.data[index],
                        ));
              } else {
                return const Text('Empty data');
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          },
        )
        );
  }
}
