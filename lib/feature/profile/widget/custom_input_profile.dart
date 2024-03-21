import 'package:flutter/material.dart';

class CustomInputProfile extends StatelessWidget {
  const CustomInputProfile({super.key, required this.textfield, required this.onPressed, required this.controller});
  // ignore: prefer_typing_uninitialized_variables
  final TextEditingController controller;
  final String textfield;
  final Function() onPressed;

  
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
