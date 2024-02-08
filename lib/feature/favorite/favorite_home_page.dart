import 'package:flutter/material.dart';

class FavoriteHomePage extends StatelessWidget {
  const FavoriteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Favorite',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body:  Container(
          color:const Color.fromARGB(255, 241, 235, 235),
          child: const Column(
            
            children: [
              
              
            ],
          ),
        ));
  }
}
