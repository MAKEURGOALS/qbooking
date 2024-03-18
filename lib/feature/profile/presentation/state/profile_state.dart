import 'package:flutter/material.dart';
import 'package:qbooking/feature/profile/presentation/data/profile_remote_data_source.dart';


class ProfileState with ChangeNotifier{
  Future<void> getProfile() async{
    final data = await ProfileRemoteDataSource().profile();
    return data.fold((l) {}, (r) {});

  }
}