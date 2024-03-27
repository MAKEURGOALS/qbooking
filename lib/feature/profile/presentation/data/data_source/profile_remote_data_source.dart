import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qbooking/constant/api_path_constant.dart';
import 'package:qbooking/constant/key_storage_constant.dart';
import 'package:qbooking/core/intercaptor/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/profile_model.dart';
// to connect kup api profile doi me DioClient pen base url
class ProfileRemoteDataSource extends DioClient {
  Future<Either<String,ProfileModel>> getProfile() async {
    try {
     
      final res = await dio.get(ApiPathConstant.profile,
          options: Options(contentType: "application/json"));
      final data = profileModelFromJson(jsonEncode(res.data));
      _saveUserId(data.id ?? "");
      return right(data);
    } catch (e) {
      debugPrint(e.toString());
      return left("Something went wrong");
    }
  }

    Future<void> _saveUserId(String userId) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(KeyStorageConstant.userId, userId);
  }

  Future<String> getUserId() async {
    final pref = await SharedPreferences.getInstance();
    String userId = pref.getString(KeyStorageConstant.userId) ?? "";
    return userId;
  }

}
