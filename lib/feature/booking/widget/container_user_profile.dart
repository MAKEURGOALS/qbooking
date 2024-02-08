import 'package:flutter/material.dart';

import '../../../booking/widget/button_booking.dart';



class ContainerUserProfile extends StatelessWidget {
  const ContainerUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 35, 32, 32),
                borderRadius: BorderRadius.circular(7)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBox(height: 50,),
          
                  Text(
                    "Sudo mkdir ",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Icon(
                        Icons.sensor_door_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 15,),
                      Text(
                        "IQURI Room ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white54,
                    thickness: 2,
                    // indent: 30,
                    // endIndent: 30,
                  ),
                  TextContainerUser(
                    titleCon: 'Schedule',
                    iconContainer: Icons.calendar_month_outlined,
                    endtitleCon: 'Now',
                  ),
                  TextContainerUser(
                    titleCon: 'Hours',
                    iconContainer: Icons.access_time,
                    endtitleCon: 'Now',
                  ),
                  Divider(
                    color: Colors.white54,
                    thickness: 2,
                  ),
                  TextContainerUser(
                    titleCon: 'Note',
                    iconContainer: Icons.library_books_outlined,
                    endtitleCon: 'Thanks for your Booking',
                  ),
                  SizedBox(height: 50,),
                  Qrcodedetail()
                ],
              ),
            ),
          ),
          const SizedBox(height: 40,),
          ButtonBooking(titleButton: 'Done', color: const Color.fromARGB(255, 35, 32, 32), titleColor: Colors.white, onTap: () {  },)
        ],
      ),
      
    );
  }
}
