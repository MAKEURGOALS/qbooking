import 'package:flutter/material.dart';

class Equipment extends StatefulWidget {
  const Equipment({super.key, required this.titleEq});
  final String titleEq;

  @override
  State<Equipment> createState() => _EquipmentState();
}

class _EquipmentState extends State<Equipment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.titleEq,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
