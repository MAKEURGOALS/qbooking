import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qbooking/constant/api_path_constant.dart';

import 'package:qbooking/core/intercaptor/dio_client.dart';
import 'package:qbooking/model/booking_model.dart';

class BookingRemoteDataSource extends DioClient {
  Future<Either<String, BookingModel>> getBooking({
    required String customerId,
    required String roomId,
    required String roomName,
    required String meetingDate,
    required String startTime,
    required String endTime,
    required String equipment,
  }) async {
    try {
      final data = {
        "customerId": customerId,
        "roomId": roomId,
        "roomName": roomName,
        "meetingDate": meetingDate,
        "startTime": startTime,
        "endTime": endTime,
        "equipment": equipment
      };
      final res = await dio.post(ApiPathConstant.booking,
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
          data: data);
      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }
}
