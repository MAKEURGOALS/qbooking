import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qbooking/constant/api_path_constant.dart';

import 'package:qbooking/core/intercaptor/dio_client.dart';
import 'package:qbooking/feature/booking/data/model/response_create_booking_model.dart';

import '../model/response_find_many_booking_model.dart';

class BookingRemoteDataSource extends DioClient {
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
  //     final data = responseFindManyBookingModelFromJson(jsonEncode(res.data));
  //     debugPrint(res.data);
  //     return data;
  //   } on DioException catch (e) {
  //     debugPrint(e.toString());
  //     return [];
  //   } catch (e) {
  //     debugPrint(e.toString());

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
      return data;
    } on DioException catch (e) {
      debugPrint(e.toString());
      return [];
    } catch (e) {
      return [];
    }
  }

//  delete booking Room
  // Future<Either<String, String>> deleteBooking({required String id}) async {
  //   try {
  //     final data = {"id": id};

  //     final res = await dio.delete(ApiPathConstant.deleteBooking,
  //         options: Options(
  //           headers: {
  //             "Content-Type": "application/json",
  //           },
  //         ),
  //         data: data);
  //     debugPrint(res.toString());
  //     final resultDelete = jsonEncode(res.data);
  //     return Right(resultDelete);
  //   } on DioException catch (e) {
  //     debugPrint(e.toString());
  //     return left(e.toString());
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return left(e.toString());
  //   }
  // }
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
}
