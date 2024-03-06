import 'package:flutter/material.dart';
import 'package:qbooking/feature/homepage/data/model/room_model_one_model.dart';

class GetFavoriteProvider extends ChangeNotifier{
  List<String> _getRoom =[];

  // GetFavoriteProvider(this._favoriteLocalDataSource);
  // List<String> get getRoom => _getRoom;
  // final AddFavoriteLocalDataSource _favoriteLocalDataSource;

  List<RoomModel> _favoriteItems = [];

  List<RoomModel> get getRoom => _favoriteItems;


  void addFavoriteRoom(RoomModel roomData){
    _favoriteItems.add(roomData);
    notifyListeners();
  }

  void toggleFavorite (String getRoom) {
    final isExit = _getRoom.contains(getRoom);
    if (isExit){
      _getRoom.remove(getRoom);
    }else {
      _getRoom.add(getRoom);
    }
    notifyListeners();
  }

  bool isExit (String getRoom) {
    final isExit = _getRoom.contains(getRoom);
    return isExit;
  }
  void ClearFavorite () {
    _getRoom = [];
    notifyListeners();
  }

  // // Add Favorite Room
  // Future<void> addFavoriteRoom(String id) async{

  // }

}