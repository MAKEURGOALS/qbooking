import 'package:dio/dio.dart';
import 'package:qbooking/core/intercaptor/intercaptor.dart';

class DioClient {
  final Dio dio = Dio();

  DioClient() {
    addInterceptor(ApiInterceptors());
  }

  void addInterceptor(Interceptor interceptor) => dio.interceptors.add(interceptor);
}