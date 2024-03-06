import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.textfield,
      this.icon,
      required this.obscureText,
      required this.onPressed,
      this.widht,
      this.height,
      required this.controller,
      });

  final String textfield;
  final IconData? icon;
  final bool obscureText;
  final double? widht;
  final double? height;
  final TextEditingController controller;
  final Function() onPressed;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        width: widht,
        height: height,
        child: TextFormField(
          validator: RequiredValidator(errorText: "Please enter Password"),
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
            label: Text(textfield),
            suffixIcon: IconButton(
              icon: Icon(icon),
              onPressed: onPressed,
            ),
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }
}
