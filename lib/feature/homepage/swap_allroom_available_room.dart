import 'package:flutter/material.dart';
import 'package:qbooking/feature/homepage/all_room_page.dart';
import 'package:qbooking/feature/homepage/availiable_room.dart';


class SwapAllRoomAvailableRoom extends StatefulWidget {
   const SwapAllRoomAvailableRoom({super.key});

  @override
  State<SwapAllRoomAvailableRoom> createState() => _SwapAllRoomAvailableRoomState();
}

class _SwapAllRoomAvailableRoomState extends State<SwapAllRoomAvailableRoom> {
   int selectedIndex =0;

  final changeScreen = [
    const AllRoomPage(),
    const AvailableRoomStatus()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: changeScreen[selectedIndex],

    );
  }
}