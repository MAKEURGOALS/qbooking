import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qbooking/constant/api_path_constant.dart';

import 'package:qbooking/core/intercaptor/dio_client.dart';
import 'package:qbooking/feature/booking/data/model/response_create_booking_model.dart';

import '../model/response_find_many_booking_model.dart';

class BookingRemoteDataSource extends DioClient {
  String oldStartTime = "";
  String oldEndTime = "";
  String oldDate = "";
  Future<Either<String, ResponseCreateBookingModel>> createBooking({
    // required String customerId,
    required String roomId,
    required String roomName,
    required String meetingDate,
    required String startTime,
    required String endTime,
  }) async {
    try {
      final data = {
        // "customerID": customerId,
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

      final responseCreateBookingModel =
          ResponseCreateBookingModel.fromJson(res.data);
      return Right(responseCreateBookingModel);
    } on DioException catch (e) {
      return Left(e.response?.data["message"]);
    }
  }

  ///connect api booking to get booking

  // Future<List<ResponseFindManyBookingModel>> fetchBooking() async {
  //   try {
  //     final res = await dio.get(
  //       ApiPathConstant.allBooking,
  //       options: Options(contentType: "application/json"),
  //     );
  //     final data = responseFindManyBookingModelFromJson(json.encode(res.data));

  //     return data;
  //   } on DioException catch (e) {
  //     debugPrint(e.toString());
  //     return [];
  //   } catch (e) {
  //     return [];
  //   }
  // }
  Future<List<ResponseFindManyBookingModel>> fetchBooking() async {
    try {
      final res = await dio.get(
        ApiPathConstant.allBooking,
        options: Options(contentType: "application/json"),
      );
      final data = responseFindManyBookingModelFromJson(json.encode(res.data));
      debugPrint("Fetching booking ${res.data}");
      return data;
    } on DioException catch (e) {
      debugPrint(e.toString());
      return [];
    } catch (e) {
      return [];
    }
  }

//  delete booking Room
  Future<Either<String, String>> deleteBooking({required String id}) async {
    try {
      final url = '${ApiPathConstant.deleteBooking}/$id';

      final res = await dio.delete(url,
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ));

      final resultDelete = jsonEncode(res.data);
      return Right(resultDelete);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return Left(e.toString());
    } catch (e) {
      debugPrint(e.toString());
      return Left(e.toString());
    }
  }

  // Update Booking
  Future<Either<String, ResponseFindManyBookingModel>> updateBookingRooms(
      {required String id,
      required String meetingDate,
      required String startTime,
      required String endTime}) async {
    try {
      final data = {
        "id": id,
        "meetingDate": meetingDate == "" ? oldDate : meetingDate,
        "startTime": startTime == "" ? oldStartTime : startTime,
        "endTime": endTime == "" ? oldEndTime : endTime
      };

      final res = await dio.put(ApiPathConstant.updateBooking + id,
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
          data: data);
      final responseUpdateBooking =
          ResponseFindManyBookingModel.fromJson(res.data);
      oldStartTime = responseUpdateBooking.startTime ?? startTime;
      oldEndTime = responseUpdateBooking.endTime ?? endTime;
      oldDate = responseUpdateBooking.meetingDate ?? meetingDate;
      return Right(responseUpdateBooking);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return Left(e.toString());
    } catch (e) {
      debugPrint(e.toString());
      return Left(e.toString());
    }
  }
}
