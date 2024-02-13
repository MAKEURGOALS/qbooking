// ignore_for_file: unnecessary_overrides

import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:qbooking/constant/api_path_constant.dart';
import 'package:qbooking/constant/key_storage_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiInterceptors extends Interceptor  {
  ApiInterceptors();
  final Dio dio = Dio();
  final String pathRefreshToken = ApiPathConstant.refreshToken;
 

  bool isTokenExpired(String? token) {
    if (token == null || token == '') return false;
    return JwtDecoder.isExpired(token);
  }

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
    // final String refreshToken = await preferences.getString(KeyStorageConstant.refreshToken) ?? '';
    final String token =  preferences.getString( KeyStorageConstant.token) ?? '';
    const baseUrl ="https://357c-115-84-115-69.ngrok-free.app";
    // if (isTokenExpired(token)) {
    //   try {
    //     dio.options.baseUrl = AppApiConstant.baseUrl;
    //     dio.options.headers.addAll({
    //       'Authorization': "Bearer ${refreshToken.trim()}",
    
    //     });
    //     final response = await dio.post(pathRefreshToken);
    //     final data = ResponseRefreshTokenModel.fromJson(response.data);
    //     final String newToken = data.token;
    //     final String newRefreshToken = data.refreshToken;
    //     await preferences.write(key: KeyConstants.token, value: newToken);
    //     await preferences.write(key: KeyConstants.refreshToken, value: newRefreshToken);
    //   } on DioException catch (error) {
    //     await preferences.delete(key: KeyConstants.token);
    //     handler.reject(error);
    //   }
    // }
    options.connectTimeout = const Duration(seconds: 120);
    options.receiveTimeout = const Duration(seconds: 120);
    options.sendTimeout = const Duration(seconds: 120);
    options.baseUrl = baseUrl;
    options.headers.addAll({

      'Authorization': token,
    });
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);}
}