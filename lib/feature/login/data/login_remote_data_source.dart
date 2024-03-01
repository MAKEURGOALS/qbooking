import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qbooking/constant/api_path_constant.dart';
import 'package:qbooking/constant/key_storage_constant.dart';
import 'package:qbooking/core/intercaptor/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/response_login_model.dart';

// connect to api
class LoginRemoteDataSource extends DioClient {
  Future<Either<String, String>> login(
      {required String contact, required String password}) async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final body = {"contact": contact, "password": password};
      final res = await dio.post(ApiPathConstant.login,
          data: body, options: Options(contentType: "application/json"));
      final data = responseLogInModelFromJson(jsonEncode(res.data));
      pref.setString(KeyStorageConstant.token, data.accessToken ?? "");
      pref.setString(KeyStorageConstant.refreshToken, data.refreshToken ?? "");
      return right("login success");
    } on DioException catch (e) {
      print(e.response?.data);
      // print(e.response?.statusCode);
      return left("Something went wrong");
    } catch (e) {
      print(e);
      return left("Something went wrong");
    }
  }
}
