

import 'package:qbooking/constant/key_storage_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../homepage/data/model/room_model_one_model.dart';

 Future<void> saveFavorite(RoomModel roomData) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final favoriteRoomsJson =
          preferences.getString(KeyStorageConstant.favoriteRooms);
      final List<RoomModel> favoriteRooms = favoriteRoomsJson != null
          ? roomModelFromJson(favoriteRoomsJson)
          : [];
      final listSameRoom =
          favoriteRooms.where((element) => element.id == roomData.id).toList();
      if (listSameRoom.isNotEmpty) {
          
      } else {
        favoriteRooms.addAll([...favoriteRooms,roomData]);
      }

      preferences.setString(
          KeyStorageConstant.favoriteRooms, roomModelToJson(favoriteRooms));
      print(preferences.getString(KeyStorageConstant.favoriteRooms));
    } catch (e) {
      print(e.toString());
    }
  }