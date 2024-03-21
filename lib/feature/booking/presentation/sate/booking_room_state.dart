import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qbooking/widget/message_dialog.dart';

class BookingRoomState with ChangeNotifier {
  final List _addEquipment = [];

  void addEquipment(
      {required String equipment, required BuildContext context}) {
    final listSelectEquipment =
        _addEquipment.where((element) => element == equipment);

    if (listSelectEquipment.isNotEmpty) {
      removeEquipment(equipment);
    } else if (_addEquipment.isNotEmpty) {
      messageDialod(
          context: context, message: 'Please Select only 1 equipment');
    } else {
      _addEquipment.add(equipment);
    }

    // notifyListeners();
  }

  void removeEquipment(String equipment) {
    _addEquipment.removeWhere((item) => item == equipment);
    
  }

  bool isSelectEquipment(String equipment) {
    final listSelectEquipment =
        _addEquipment.where((element) => element == equipment);
    // notifyListeners();


    if (listSelectEquipment.isNotEmpty) {
      return true;
    } else {
      return false;
    }
   

  }
}
