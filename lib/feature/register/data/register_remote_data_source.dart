
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qbooking/constant/api_path_constant.dart';
import 'package:qbooking/core/intercaptor/dio_client.dart';


class RegisterRemoteDataSource extends DioClient {
  Future<Either<String, String>> register(
      {required String contact, required String password}) async {
    try {
      final body = {"contact": contact, "password": password};
      await dio.post(ApiPathConstant.register,
          data: body, options: Options(contentType: "application/json"));
      
   
      return right("login success");
    } on DioException catch (e) {
      print(e.response?.data);
      print(e.response?.statusCode);
      return left("Something went wrong");
    } catch (e) {
      print(e);
      return left("Something went wrong");
    }
  }
}
