import 'package:flutter/material.dart';

class BookingHomePage extends StatelessWidget {
  const BookingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "booking home page"
        ),
      ),
      body: Center(
        child: Text(
          'booking home page'
        ),
      ),
    );
  }
}