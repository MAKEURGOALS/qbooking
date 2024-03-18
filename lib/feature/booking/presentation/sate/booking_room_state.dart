import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingRoomState with ChangeNotifier {
  final List _addEquipment = [];

  void addEquipment(int index) {
    _addEquipment.add(index);
    notifyListeners();
  }
  void removeEquipment(int index) {
    _addEquipment.removeAt(index);
    notifyListeners();
  }
  

  bool isEquipment(int index) {
    if (index == 0) {
      addEquipment(index);
      return true;
    } else {
      removeEquipment(index);
      return false;
    }
  }
}
 