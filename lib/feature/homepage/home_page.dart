import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qbooking/feature/homepage/all_room_page.dart';
import 'package:qbooking/feature/homepage/availiable_room.dart';
import 'package:qbooking/feature/homepage/widget/change_page_all_availablr_room.dart';
import 'package:qbooking/feature/homepage/widget/search_bar.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  final List<Widget> screens = [
    const AllRoomPage(),
    const AvailableRoomStatus()
  ];
  int currentIndex = 0;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
    FacebookAuth.instance.logOut();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const CustomSerachBar(),
        ChangePageAllAndAvailableRoom(
          onSelectedIndex: (int value) => setState(() => currentIndex = value),
        ),
      screens[currentIndex]
      ],
    );
  }
}
