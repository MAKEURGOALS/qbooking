import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constant/key_storage_constant.dart';
import '../../../homepage/data/model/room_model_one_model.dart';

class FavoriteRoomState with ChangeNotifier {

  List<RoomModel> favoriteRooms = [];

  Future<List<RoomModel>> getFavoriteRoom() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final favoriteRoomsJson =
          preferences.getString(KeyStorageConstant.favoriteRooms);

      debugPrint(favoriteRoomsJson);
      final List<RoomModel> data =
          favoriteRoomsJson != null ? roomModelFromJson(favoriteRoomsJson) : [];
      favoriteRooms = data;
      return data;
    } catch (e) {
      return [];
    }
  }

  Future<void> unFavorites(RoomModel roomData) async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // final favoriteRoomsJson =
    //     preferences.getString(KeyStorageConstant.favoriteRooms);
    // List<RoomModel> data =
    //     favoriteRoomsJson != null ? roomModelFromJson(favoriteRoomsJson) : [];

    // favoriteRooms =
    //     data.where((element) => element.id != roomData.id).toList();

    // final updatedFavoriteRoomsJson = roomModelToJson(favoriteRooms);
    // await preferences.setString(
    //     KeyStorageConstant.favoriteRooms, updatedFavoriteRoomsJson);
  }
  

  // check id room

 bool isRoomFavorited(String roomID)  {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    // final favoriteRoomsJson = pref.getString(KeyStorageConstant.favoriteRooms);

    // final List<RoomModel> dataFavoriteRooms =
    //       favoriteRoomsJson != null ? roomModelFromJson(favoriteRoomsJson) : [];
    final data = favoriteRooms.where((element) => element.id == roomID);
    if(data.isNotEmpty){
      return true;
    }else{
      return false;
    }      

   
  }

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
          favoriteRooms.removeWhere((element) => element.id == roomData.id);
      } else {
        favoriteRooms.add(roomData);
      }

      this.favoriteRooms = favoriteRooms;
      
      preferences.setString(
          KeyStorageConstant.favoriteRooms, roomModelToJson(favoriteRooms));
      debugPrint(preferences.getString(KeyStorageConstant.favoriteRooms));
      
      notifyListeners(); 
    } catch (e) {
      debugPrint(e.toString());
      
    }
  }

}
