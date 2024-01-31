import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qbooking/homepage/widget/bottom_navigation_bar.dart';
import 'package:qbooking/homepage/widget/box_room.dart';
import 'package:qbooking/homepage/widget/change_page_all_availablr_room.dart';
import 'package:qbooking/homepage/widget/search_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  
  int _selectedIndex =0;


  final user = FirebaseAuth.instance.currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
    FacebookAuth.instance.logOut();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 220, 215, 215),
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomSerachBar(),
                ChangePageAllAndAvailableRoom(),
                BoxRoomHomePage(
                  roomstate: '5.00',
                  changeimage: 'assets/images/meeting.jpg',
                ),
                BoxRoomHomePage(
                  roomstate: '4.00',
                  changeimage: 'assets/images/meeting2.jpg',
                ),
                
              ],
            ),
          ),
         bottomNavigationBar: CustomBottomNavigationBar(),

        ),
      ),
    );
  }
}
