import 'package:flutter/material.dart';
import 'package:qbooking/profile/body_profile.dart';
import 'package:qbooking/profile/top_profile_detail.dart';

class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: const PreferredSize(
          preferredSize:  Size.fromHeight(220), child: TopProfileDetail()
          ),
          body: BodyProfile(),
    );
  }
}
