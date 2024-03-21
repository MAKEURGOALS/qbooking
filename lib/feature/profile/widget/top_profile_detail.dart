import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../presentation/state/profile_state.dart';

class TopProfileDetail extends StatelessWidget {
  TopProfileDetail({
    super.key,
  });
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF282828),
      statusBarIconBrightness: Brightness.light,
    ));
    return AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF282828),
        title: const Text('Profile'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50, left: 30),
            child: FutureBuilder(
              future: context.read<ProfileState>().getProfile(),
              builder: (context, data) {
                return Row(
                  children: [
                    const CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/images/meeting.jpg'),
                    ),
                    const SizedBox(width: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.read<ProfileState>().nameController.text,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          context.read<ProfileState>().emailController.text,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
