import 'package:flutter/material.dart';

class TopProfileDetail extends StatelessWidget {
  const TopProfileDetail({super.key,  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color(0xFF282828),
      title: const Text('Edit Profile'),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Padding(
          padding: EdgeInsets.only(bottom: 50, left: 30),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/images/meeting.jpg'),
              ),
               SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sudo mkdir',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 7,),
                  Text(
                    'sudo@gmail.com',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
