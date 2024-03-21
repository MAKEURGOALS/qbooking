import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbooking/feature/profile/widget/country_picker.dart';
import 'package:qbooking/feature/profile/widget/custom_input_profile.dart';
import 'package:qbooking/feature/profile/widget/profile_edit_image.dart';

import '../../../../widget/my_button_login.dart';
import '../../widget/select_gender.dart';
import '../state/profile_state.dart';

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
      body: FutureBuilder(
        future: context.read<ProfileState>().getProfile(),
        builder: (context, data) {
          if (data.hasData) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  const ProfileEditImage(),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomInputProfile(
                    textfield: 'Name',
                    onPressed: () {},
                    controller: context.read<ProfileState>().nameController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomInputProfile(
                    textfield: 'Gmail Adress',
                    onPressed: () {},
                    controller: context.read<ProfileState>().emailController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const SelectGender(),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomInputProfile(
                    textfield: 'Phone number',
                    onPressed: () {},
                    controller: context.read<ProfileState>().phoneController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const CountryPicker(),
                  Mybutton(
                    onTap: () {},
                    text: 'Submit',
                  )
                ]),
              ),
            );
          } else if (data.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Text("Something is wrong");
          }
        },
      ),
    );
  }
}
