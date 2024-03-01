import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qbooking/constant/api_path_constant.dart';
import 'package:qbooking/model/room_model_one_model.dart';

import '../../../core/intercaptor/dio_client.dart';

class RoomRemoteDataSource extends DioClient {
  Future<Either<String, List<RoomModel>>> getAllRoom() async {
    try {
      final response = await dio.get(
        ApiPathConstant.room,
        options: Options(contentType: "application/json"),
      );
      final data = roomModelFromJson(jsonEncode(response.data));
      return right(data);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return left("Something went wrong");
    } catch (e) {
      debugPrint(e.toString());
      return left("Something went wrong");
    }
  }
}
