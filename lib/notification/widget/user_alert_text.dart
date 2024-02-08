import 'package:flutter/material.dart';

class UserAlertText extends StatelessWidget {
  const UserAlertText({super.key, required this.imageUser});
  final String imageUser;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(imageUser),
          ),
          const SizedBox(width: 10,),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Have a great day with my amazing.."
              ),
              Text(
                "Hi There",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              
            ],
          ),
          const SizedBox(width: 15,),
    
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "9:56 AM",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.circle, size:10,color: Colors.red,)
            ],
          )
        ],
      ),
    );
  }
}