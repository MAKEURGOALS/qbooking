import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qbooking/constant/api_path_constant.dart';
import 'package:qbooking/core/intercaptor/dio_client.dart';

import '../model/profile_model.dart';

class ProfileRemoteDataSource extends DioClient {
  Future<Either<String,ProfileModel>> getProfile() async {
    try {
     
      final res = await dio.get(ApiPathConstant.profile,
          options: Options(contentType: "application/json"));
      final data = profileModelFromJson(jsonEncode(res.data));
      return right(data);
    } catch (e) {
      debugPrint(e.toString());
      return left("Something went wrong");
    }
  }
}
