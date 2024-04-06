import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    


    this.widht,
    this.height,
    required this.controller,
  });

  
  
  final double? widht;
  final double? height;
  final TextEditingController controller;


  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
   bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        width: widget.widht,
        height: widget.height,
        child: TextFormField(
          validator: RequiredValidator(errorText: "Please enter Password"),
          controller: widget.controller,
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
            label: const Text('Password'),
            suffixIcon: IconButton(
              icon: Icon(
                isObscured ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: (){
                setState(() {
                  isObscured = !isObscured;
                });
              },
            ),
          ),
          obscureText: isObscured,
        ),
      ),
    );
  }
}
