import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qbooking/constant/colors_constant.dart';
import 'package:qbooking/feature/homepage/presentation/widget/all_room_page.dart';
import 'package:qbooking/feature/homepage/presentation/widget/availiable_room.dart';
import 'package:qbooking/feature/homepage/presentation/widget/change_page_all_availablr_room.dart';
import 'package:qbooking/feature/homepage/presentation/widget/search_bar.dart';



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


 

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(232, 232, 232, 0.2),
      statusBarIconBrightness: Brightness.dark,
    ));
    return  Scaffold(
      backgroundColor:const Color.fromRGBO(232, 232, 232, 0.2),
      body: Column(
        children: [
          const CustomSerachBar(),
          ChangePageAllAndAvailableRoom(
            onSelectedIndex: (int value) => setState(() => currentIndex = value),
          ),
        Expanded(child: screens[currentIndex]),
        // const DashboardScreen()
        ],
      ),
    );
  }
}
