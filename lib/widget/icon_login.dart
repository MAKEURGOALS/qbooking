import 'package:flutter/material.dart';

class Iconlogin extends StatelessWidget {
  const Iconlogin({super.key, required this.imagepaht});

  final String imagepaht;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(50),
      
      ),
      child: Image.asset(imagepaht, height: 30,width: 30,),
    );
  }
}