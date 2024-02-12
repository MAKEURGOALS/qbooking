import 'package:flutter/material.dart';
import 'package:qbooking/model/notification_model.dart';

import '../../../constant/image_constant.dart';

class UserAlertText extends StatelessWidget {
  const UserAlertText({super.key, required this.notificationData});
  final NotificationModel notificationData;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
          Row(
            children: [
              CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(notificationData.images ?? ImageConstant.room1),
          ),
          const SizedBox(width: 10,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notificationData.description ??""
              ),
              Text(
                notificationData.subDescription ?? "",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
              
            ],
          ),
          // const SizedBox(width: 60,),
    
           Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                notificationData.time ?? "",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.circle, size:10,color: Colors.red,)
            ],
          )
        ],
      ),
    );
  }
}