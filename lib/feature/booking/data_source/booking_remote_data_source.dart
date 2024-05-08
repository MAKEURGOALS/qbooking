import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qbooking/constant/api_path_constant.dart';

import 'package:qbooking/core/intercaptor/dio_client.dart';
import 'package:qbooking/feature/booking/model/response_booking_model.dart';

class BookingRemoteDataSource extends DioClient {
  Future<Either<String, ResponseBookingModel>> getBooking({
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

      final res = await dio.post(ApiPathConstant.booking,
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
          data: data);

      debugPrint(res.toString());
      final responseBookingModel = ResponseBookingModel.fromJson(res.data);
      return Right(responseBookingModel);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }

  ///connect api booking

  Future< List<ResponseBookingModel>> fetchBooking() async {
  try {
    final res = await dio.get(
      ApiPathConstant.allBooking,
      options: Options(contentType: "application/json"),
    );
    final data = responseBookingModelFromJson(jsonEncode(res.data));
    return data;
  } catch (e) {
    return [];
  }
}
}
