import 'package:flutter/material.dart';
import 'package:qbooking/constant/key_storage_constant.dart';
import 'package:qbooking/feature/profile/presentation/data/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../enum/gendet_enum.dart';
import '../data/data_source/profile_remote_data_source.dart';

class ProfileState with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final EnumGender selectedGender = EnumGender.other;
  final String selectedCountry = ''; 
  
  Future<ProfileModel> getProfile() async {
    final data = await ProfileRemoteDataSource().getProfile();
    return data.fold((l) {
      //tha hark mun br ni data ja hai mun sg ProfileModel pao ork ma
      return ProfileModel();
    }, (r) {
      // tha hark mun mi data ja hai mun show detaila profile 
      nameController.text = r.name ?? "";
      print(r);
      emailController.text = r.gmail ?? "";
      phoneController.text = r.phone ?? "";
      _saveProfileToLocalStorage(r);
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
    // karn deubg ao profile tha hark mun br mi ja hai mun return String pao ork ma 
    String profile = pref.getString(KeyStorageConstant.profile) ?? "";
    return profile;
  }

  
}
