import 'package:flutter/material.dart';

class CustomLangeuage extends StatelessWidget {
  const CustomLangeuage({super.key, required this.nameLanguage, required this.subNameLanguage, required this.pathIconFlag});
  final String nameLanguage;
  final String subNameLanguage;
  final String pathIconFlag;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(
        pathIconFlag,
        height: 60,
        width: 60,
      ),
      const SizedBox(
        width: 20,
      ),
       Column(
          // text Language
          children: [
            Text(
              nameLanguage,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(subNameLanguage)
          ]
          ),

          // const SizedBox(width: 250,),
          const Spacer(),

          const Icon(Icons.check_box)
    ]
    );
  }
}
