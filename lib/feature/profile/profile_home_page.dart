import 'package:flutter/material.dart';
import 'package:qbooking/feature/profile/body_profile.dart';
import 'package:qbooking/feature/profile/widget/top_profile_detail.dart';


class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar:  PreferredSize(
          preferredSize:  const Size.fromHeight(220), child: TopProfileDetail()
          ),
          body: BodyProfile(),
    );
  }
}
