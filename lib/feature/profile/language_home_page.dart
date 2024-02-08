import 'package:flutter/material.dart';
import 'package:qbooking/feature/profile/widget/customa_language.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Language',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            CustomLangeuage(
              nameLanguage: 'English',
              subNameLanguage: 'English',
              pathIconFlag: 'assets/iconslogo/united-states.png',
            ),
            Divider(color: Colors.grey,),
            CustomLangeuage(
              nameLanguage: 'Laos',
              subNameLanguage: 'Laos',
              pathIconFlag: 'assets/iconslogo/Laos.png',
            )
          ],
        ),
      ),
    );
  }
}
