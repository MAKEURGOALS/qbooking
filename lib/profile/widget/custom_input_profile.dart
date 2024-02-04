import 'package:flutter/material.dart';

class CustomInputProfile extends StatelessWidget {
  const CustomInputProfile({super.key, this.controller, required this.textfield, required this.onPressed});
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String textfield;
  final Function() onPressed;

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              fillColor: Colors.grey.shade100,
              filled: true,
              label: Text(textfield, style: const TextStyle(fontSize: 16),),
              
            ),
          )
        ],
      ),
    );
  }
}
