import 'package:flutter/material.dart';
import 'package:qbooking/feature/booking/widget/container_user_profile.dart';

class QrUserPage extends StatelessWidget {
  const QrUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text("Booking")
          ),
          body: const ContainerUserProfile(),
    );
  }
}
