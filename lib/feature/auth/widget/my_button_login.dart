import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({super.key,  required this.onTap, required this.text});
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 27, 26, 26), borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child:  Center(
            child: Text(
              text,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
