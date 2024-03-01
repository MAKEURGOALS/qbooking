import 'package:flutter/material.dart';


class FavoriteHomePage extends StatelessWidget {
  const FavoriteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Future<List<RoomModel>> getFavoriteRoom() async {
    //   try {
    //     SharedPreferences preferences = await SharedPreferences.getInstance();
    //     final favoriteRoomsJson =
    //         preferences.getString(KeyStorageConstant.favoriteRooms);
    //     final List<RoomModel> favoriteRooms = favoriteRoomsJson != null
    //         ? roomsModelFromJson(favoriteRoomsJson)
    //         : [];
    //     return favoriteRooms;
    //   } catch (e) {
    //     return [];
    //   }
    // }
   
    // Future<void> unfavorites(RoomModel roomData) async {
    //   SharedPreferences preferences = await SharedPreferences.getInstance();
    //   final favoriteRoomsJson =
    //       preferences.getString(KeyStorageConstant.favoriteRooms);
    //   final List<RoomModel> favoriteRooms = favoriteRoomsJson != null
    //       ? roomsModelFromJson(favoriteRoomsJson)
    //       : [];
    //   favoriteRooms.where((element) => element.id != roomData.id); 
    // }

    return Scaffold(
        appBar: AppBar(  
          centerTitle: true,
          title: const Text(
            'Favorite',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        // body: FutureBuilder<List<RoomModel>>(
        //   future: getFavoriteRoom(),
        //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const CircularProgressIndicator();
        //     } else if (snapshot.connectionState == ConnectionState.done) {
        //       if (snapshot.hasError) {
        //         return const Text('Error');
        //       } else if (snapshot.hasData) {
        //         return ListView.builder(
        //             shrinkWrap: true,
        //             itemCount: snapshot.data.length,
        //             itemBuilder: (context, index) => BoxFavorites(
        //                   roomData: snapshot.data[index],
        //                 ));
        //       } else {
        //         return const Text('Empty data');
        //       }
        //     } else {
        //       return Text('State: ${snapshot.connectionState}');
        //     }
        //   },
        // )
        );
  }
}
