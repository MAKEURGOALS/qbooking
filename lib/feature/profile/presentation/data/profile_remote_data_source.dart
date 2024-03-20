import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qbooking/constant/api_path_constant.dart';
import 'package:qbooking/model/profile_model.dart';



class ProfileRemoteDataSource with ChangeNotifier{
  Future<Either<String, String>> profile() async{
    try{
      Dio dio = Dio();
      final res =await dio.get(ApiPathConstant.profile, 
        options: Options(contentType:  "application/json"));
      final data = profileModelFromJson(jsonEncode(res.data));
      return right("success");
     
    }catch (e){
      print(e);
      return left("Something went wrong");

    }
  }
}