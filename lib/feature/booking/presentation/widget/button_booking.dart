import 'package:flutter/material.dart';

class ButtonBooking extends StatelessWidget {
  const ButtonBooking({
    super.key,
    required this.titleButton,
    required this.backgroundColor,
    required this.onTap,
    required this.titleColor,
  });
  final String titleButton;
  final Color backgroundColor;
  final Function() onTap;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(7)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            titleButton,
            style: TextStyle(color: titleColor, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
