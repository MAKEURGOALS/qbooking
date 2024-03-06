
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
      
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.black,
      // showUnselectedLabels: true,
      currentIndex: currentIndex,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      onTap: (index) => setState(() {
        currentIndex = index;
        widget.onSelected(index);
      }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookings',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Profile',
            )
            ]
            );
            
  }
}
