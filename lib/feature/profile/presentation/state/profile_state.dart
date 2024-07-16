import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qbooking/constant/key_storage_constant.dart';
import 'package:qbooking/feature/login/presentation/screens/login_page.dart';
import 'package:qbooking/feature/profile/presentation/data/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/data_source/profile_remote_data_source.dart';

class ProfileState with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String selectedGender = "Other";
  String selectedCountry = '';
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void onSelectGender(String gender) {
    selectedGender = gender;
  }

  void onselectedContry(String country) {
    selectedCountry = country;
    // notifyListeners();
  }

  Future<ProfileModel> getProfile() async {
    final data = await ProfileRemoteDataSource().getProfile();
    return data.fold((l) {
      //tha hark mun br ni data ja hai mun sg ProfileModel pao ork ma
      return ProfileModel();
    }, (r) {
      // tha hark mun mi data ja hai mun show detaila profile
      debugPrint(r.toString());
      nameController.text = r.name ?? "";
      emailController.text = r.gmail ?? "";
      phoneController.text = r.phone ?? "";
      selectedGender = r.gender ?? "";
      selectedCountry = r.country ?? "";
      _saveProfileToLocalStorage(r);
      debugPrint(r.toString());
      return r;
    });
  }

  Future<void> _saveProfileToLocalStorage(ProfileModel profile) async {
    final pref = await SharedPreferences.getInstance();

    final profileJson = profile.toJson();
    //hai pref save long keyStrongeContant.profile
    await pref.setString(KeyStorageConstant.profile, profileJson.toString());
  }

  Future<String> getProfileToLocalStorage() async {
    final pref = await SharedPreferences.getInstance();
    // karn deubg ao profile tha hark mun br me ja hai mun return String pao ork ma
    String profile = pref.getString(KeyStorageConstant.profile) ?? "";
    return profile;
  }

  Future<void> logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.signOut();
      clearUserData();
      notifyListeners();
    } catch (e) {
      debugPrint("Sign out error: $e");
      // Handle error here
    }
  }

  void navigateToLoginPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  // Clear Data when logOut
  Future<void> clearUserData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(KeyStorageConstant.token);
    await pref.remove(KeyStorageConstant.refreshToken);
    await pref.remove(KeyStorageConstant.room);
    await pref.remove(KeyStorageConstant.favoriteRooms);
  }

  //Update profiel
  Future<void> updateUserProfile(BuildContext context) async {
    final res = await ProfileRemoteDataSource().updateProfile(
      name: nameController.text,
      gmail: emailController.text,
      gender: selectedGender,
      phone: phoneController.text,
      country: selectedCountry,
    );

    res.fold((l) {
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile: $l')),
      );
      debugPrint(l);
    }, (r) {
      _saveProfileToLocalStorage(r);
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    });
  }

  //Log out statement
  Future<void> showAlertDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out !!!'),
          content: const Text('Are you sure you want to Log Out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () async {
                await logoutUser();
                navigateToLoginPage(context);
              },
              child: const Text(
                'Log Out!',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
