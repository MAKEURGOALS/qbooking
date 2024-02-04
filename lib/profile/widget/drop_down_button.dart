import 'package:flutter/material.dart';

class DropdownButtonApp extends StatefulWidget {
  const DropdownButtonApp({super.key});

  @override
  State<DropdownButtonApp> createState() => _DropdownButtonAppState();
}

class _DropdownButtonAppState extends State<DropdownButtonApp> {
  String? item = 'male';

  final List gender = ['male', 'female'];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 350,
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: DropdownButton(
        dropdownColor: Colors.grey,
        underline: const SizedBox(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          value: item,
          items: gender
              .map((item) => DropdownMenuItem(value: item, child: Text(item,style: const TextStyle(fontSize: 20),)))
              .toList(),
          onChanged: (value) => setState(() {
                item = value.toString();
              })),
    ));
  }
}
