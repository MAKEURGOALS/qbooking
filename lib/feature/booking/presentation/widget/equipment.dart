import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../sate/booking_room_state.dart';

class Equipment extends StatefulWidget {
  const Equipment({super.key, required this.titleEq, this.onTap});
  final String titleEq;
  final void Function()? onTap;

  @override
  State<Equipment> createState() => _EquipmentState();
}

class _EquipmentState extends State<Equipment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: InkWell(
          onTap: () {
            setState(() {
              context
                  .read<BookingRoomState>()
                  .addEquipment(equipment: widget.titleEq, context: context);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: context
                            .read<BookingRoomState>()
                            .isSelectEquipment(widget.titleEq) != true
                    ? Colors.white
                    : Colors.blueAccent,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.titleEq,
                style: TextStyle(
                    color: context
                                .read<BookingRoomState>()
                                .isSelectEquipment(widget.titleEq) !=
                            true
                        ? Colors.black
                        : Colors.red),
              ),
            ),
          )),
    );
  }
}
