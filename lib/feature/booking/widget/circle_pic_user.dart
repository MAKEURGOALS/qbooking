import 'package:flutter/material.dart';

class CirclePicUser extends StatelessWidget {
  const CirclePicUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 10, color: Colors.white),
        borderRadius: BorderRadius.circular(50)
      ),
      child: const CircleAvatar(
        backgroundImage: AssetImage("assets/images/meeting.jpg"),
        radius: 35,
      ),
    );
  }
}