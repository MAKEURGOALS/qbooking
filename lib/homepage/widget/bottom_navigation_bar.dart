
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int value ) onSelected; 
   const CustomBottomNavigationBar({super.key, required this.onSelected});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;
  

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      backgroundColor: Colors.black,
      onTap: (index) => setState(() {
        currentIndex = index;
        widget.onSelected(index);
      }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Bookings',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_sharp),
            label: 'Notifications',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
            )
            ]
            );
            
  }
}
