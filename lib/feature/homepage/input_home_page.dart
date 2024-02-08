import 'package:flutter/material.dart';

class InputHomePage extends StatelessWidget {
  const InputHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Row(
        children: [TextFormField(
          decoration: const InputDecoration(

          ),
        )],
      )),
    );
  }
}
