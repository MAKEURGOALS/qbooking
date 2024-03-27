import 'package:flutter/material.dart';
import 'package:qbooking/feature/notification/widget/switch_button.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: const Text("Setting")),
          body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Common",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),  
                ),
                SizedBox(height: 15,),

                SwitchButton(textSetting: 'General Notification',),
                SwitchButton(textSetting: 'Sound',),
                SwitchButton(textSetting: 'Vibrate',),
                
                Divider(color: Colors.grey,),
                SizedBox(height: 15,),

                Text(
                  "Common",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
               
                SizedBox(height: 15,),

                SwitchButton(textSetting: 'App updates',),
                SwitchButton(textSetting: 'Bill Reminder',),
                SwitchButton(textSetting: 'Promotion',),
                SwitchButton(textSetting: 'Discount Available',),
                SwitchButton(textSetting: 'Payment Request',),
                Divider(color: Colors.grey,),
                SizedBox(height: 15,),

                Text(
                  "Common",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 15,),

                SwitchButton(textSetting: 'New Service Available',),
                SwitchButton(textSetting: 'New Room Available',),
              ],
            ),
          ),
    );
  }
}
