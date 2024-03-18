import 'package:flutter/material.dart';

import '../sate/booking_room_state.dart';

class Equipment extends StatelessWidget {
  const Equipment({super.key, required this.titleEq, this.onTap});
  final String titleEq;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: InkWell(
          onTap: () => BookingRoomState(),
          child: Container(
            decoration: BoxDecoration(
                color: BookingRoomState().isEquipment(0)
                    ? Colors.white
                    : Colors.blueAccent,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                titleEq,
                style: TextStyle(
                    color: BookingRoomState().isEquipment(0)
                        ? Colors.black
                        : Colors.red),
              ),
            ),
          )),
    );
  }
}
