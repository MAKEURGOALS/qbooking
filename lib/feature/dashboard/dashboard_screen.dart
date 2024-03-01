import 'package:flutter/material.dart';
import 'package:qbooking/feature/favorite/favorite_home_page.dart';
import 'package:qbooking/feature/homepage/home_page.dart';
import 'package:qbooking/feature/homepage/widget/bottom_navigation_bar.dart';
import 'package:qbooking/feature/notification/notification_home_page.dart';
import 'package:qbooking/feature/profile/profile_home_page.dart';

import '../booking/booking_home_page.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
   int selectedIndex = 0; // create parameter khuen ma phuea hai mun hu va hao lueak index to dh
  final List <Widget> screens = [
    const HomePage(), 
    const FavoriteHomePage(),
    const BookingHomePage(),
     const NotificationHomePage(),
    const ProfileHomePage()
  ];
  @override

  Widget build(BuildContext context) {
    return  MaterialApp(
      
      home: SafeArea(
        
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 220, 215, 215),
          body: screens[selectedIndex],
         bottomNavigationBar: CustomBottomNavigationBar(onSelected: (int value) => setState(() {
           selectedIndex = value;
         }),),

        ),
        
      ),
      
    );
  }
}