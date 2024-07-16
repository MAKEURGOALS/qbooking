import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbooking/feature/profile/presentation/data/model/profile_model.dart';
import 'package:qbooking/feature/profile/widget/country_picker.dart';
import 'package:qbooking/feature/profile/widget/custom_input_profile.dart';
import 'package:qbooking/feature/profile/widget/profile_edit_image.dart';

import '../../../../constant/colors_constant.dart';
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
    final profileState = context.watch<ProfileState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(3),
            child: Container(
              color: ColorsConstants.borderAppbarColor,
              height: 1,
            )),
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
                  // const ProfileEditImage(imageProfile: ProfileModel().image,),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomInputProfile(
                    textfield: 'Name',
                    onPressed: () {},
                    controller: profileState.nameController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomInputProfile(
                    textfield: 'Gmail Adress',
                    onPressed: () {},
                    controller: profileState.emailController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SelectGender(
                    selectedGender: profileState.selectedGender,
                    onSelectGender: (String value) =>
                        profileState.onSelectGender(value),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomInputProfile(
                    textfield: 'Phone number',
                    onPressed: () {},
                    controller: profileState.phoneController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CountryPicker(
                    selectedContry: profileState.selectedCountry,
                    onSelectedContry: (String value) =>
                        profileState.onselectedContry(value),
                  ),
                  Mybutton(
                    onTap: () async {
                      await profileState.updateUserProfile(context);
                    },
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
