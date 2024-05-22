import 'package:flutter/foundation.dart';
import 'package:qbooking/feature/homepage/data/data_source/room_remote_data_source.dart';

import '../../data/model/room_model_one_model.dart';

class RoomState  with ChangeNotifier {
  Future<List<RoomModel>> getAllRoom () async{
    final data = await RoomRemoteDataSource().getAllRoom();
    return data.fold((l){
       // Log the error
        debugPrint('Error fetching rooms: $l');
        // Throw an exception to propagate the error to the FutureBuilder
        throw Exception('Failed to load rooms');
    }, (r) => r);
  }
  
} 


  // Future<void> saveFavorite(RoomModel roomData) async {
  //   try {
  //     SharedPreferences preferences = await SharedPreferences.getInstance();
  //     final favoriteRoomsJson =
  //         preferences.getString(KeyStorageConstant.favoriteRooms);
  //     final List<RoomModel> favoriteRooms = favoriteRoomsJson != null
  //         ? roomsModelFromJson(favoriteRoomsJson)
  //         : [];
  //     final listSameRoom =
  //         favoriteRooms.where((element) => element.id == roomData.id).toList();
  //     if (listSameRoom.isNotEmpty) {
  //     } else {
  //       favoriteRooms.addAll([roomData]);
  //     }

  //     preferences.setString(
  //         KeyStorageConstant.favoriteRooms, roomsModelToJson(favoriteRooms));
  //     print(preferences.getString(KeyStorageConstant.favoriteRooms));
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }