import 'package:flutter/material.dart';
import 'package:qbooking/notification/setting_page.dart';
import 'package:qbooking/notification/widget/user_alert_text.dart';

class NotificationHomePage extends StatelessWidget {
  const NotificationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingPage()),
                  );
                },
                child: const Icon(Icons.settings_outlined),
              ),
            )
          ],
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            "Notifications",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              UserAlertText(
                imageUser: 'assets/images/meeting.jpg',
              ),
              SizedBox(
                height: 10,
              ),
              UserAlertText(
                imageUser: 'assets/images/meeting2.jpg',
              ),
              SizedBox(
                height: 10,
              ),
              UserAlertText(
                imageUser: 'assets/images/meeting3.jpg',
              ),
            ],
          ),
        ));
  }
}
