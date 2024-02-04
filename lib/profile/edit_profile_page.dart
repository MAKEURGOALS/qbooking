import 'package:flutter/material.dart';
import 'package:qbooking/profile/widget/custom_input_profile.dart';
import 'package:qbooking/profile/widget/drop_down_button.dart';
import 'package:qbooking/profile/widget/profile_edit_image.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:   SingleChildScrollView(
        child: Column(children: [
           const ProfileEditImage(),
           const SizedBox(height: 40,),
          CustomInputProfile(textfield: 'Name', onPressed: () {  },),
           const SizedBox(height: 40,),
          CustomInputProfile(textfield: 'Gmail Adress', onPressed: () {  },),
           const SizedBox(height: 40,),

          const DropdownButtonApp(),


           const SizedBox(height: 40,),
          CustomInputProfile(textfield: 'Phone number', onPressed: () {  },),
           const SizedBox(height: 40,),
          CustomInputProfile(textfield: 'Country', onPressed: () {  },),
        ]),
      ),
    );
  }
}
