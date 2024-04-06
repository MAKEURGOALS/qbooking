import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qbooking/constant/api_path_constant.dart';

import 'package:qbooking/core/intercaptor/dio_client.dart';

class BookingRemoteDataSource extends DioClient {
  Future<Either<String, String>> getBooking({
    required String customerId,
    required String roomId,
    required String roomName,
    required String meetingDate,
    required String startTime,
    required String endTime,
    
  }) async {
    try {
      final data = {
        "customerID": customerId,
        "roomID": roomId,
        "roomName": roomName,
        "meetingDate": meetingDate,
        "startTime": startTime,
        "endTime": endTime,
        
      };
      print(data);
      final res = await dio.post(ApiPathConstant.booking,
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),

          data: data);
          print(res);
      return  Right("success");
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }
}
