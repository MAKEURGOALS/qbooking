import 'package:flutter/material.dart';

class NotificationHomePage extends StatelessWidget {
  const NotificationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification Home"
        ),
      ),
      body: Center(
        child: Text(
          'Notification Home'
        ),
      ),
    );
  }
}