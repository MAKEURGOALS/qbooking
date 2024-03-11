import 'package:flutter/material.dart';

class GetFavoriteProvider extends ChangeNotifier{
  List<String> _getRoom =[];
   List<String> get getRoom => _getRoom;

 



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

 

}