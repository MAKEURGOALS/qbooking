import 'package:flutter/material.dart';

class ButtonTermAndProvacy extends StatelessWidget {
  const ButtonTermAndProvacy({super.key, required this.titlebtn});
  final String titlebtn;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF323247),
          minimumSize: const Size.fromHeight(40),
          padding: const EdgeInsets.all(20)
          
        ),
        child: Text(titlebtn),
      ),
    );
  }
}
