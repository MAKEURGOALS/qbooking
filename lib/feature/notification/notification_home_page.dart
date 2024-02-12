import 'package:flutter/material.dart';
import 'package:qbooking/data/notification_data.dart';
import 'package:qbooking/feature/notification/setting_page.dart';
import 'package:qbooking/feature/notification/widget/user_alert_text.dart';
// import 'package:qbooking/feature/notification/widget/user_alert_text.dart';

class NotificationHomePage extends StatelessWidget {
  const NotificationHomePage({super.key});
 

  @override
  Widget build(BuildContext context) { final allNotification = NotificationData.notiPage;
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
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: allNotification.length,
            itemBuilder: (context, index) => UserAlertText(
                notificationData: allNotification[index])));
  }
}
