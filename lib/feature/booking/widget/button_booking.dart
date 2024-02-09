import 'package:flutter/material.dart';

class ButtonBooking extends StatelessWidget {
  const ButtonBooking({super.key, required this.titleButton, required Color color, required Color titleColor, required Null Function() onTap});
  final String titleButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 150,
        decoration: BoxDecoration(
            color: const Color(0xFF282828),
            borderRadius: BorderRadius.circular(7)),
        child:  Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            titleButton,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
