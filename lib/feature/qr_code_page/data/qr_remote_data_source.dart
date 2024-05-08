// import 'dart:convert';

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:qbooking/constant/api_path_constant.dart';
// import 'package:qbooking/core/intercaptor/dio_client.dart';
// import 'package:qbooking/feature/qr_code_page/data/qr_model.dart';

// class QrRemotedataSource extends DioClient {
//   Future<Either<String, List<QrCodeModel>>> getData() async {
//     try {
//       final res = await dio.get(ApiPathConstant.booking,
//           options: Options(contentType: "application/json"));
//       final data = qrCodeModelFromJson(jsonEncode(res));
//       // return right(data);
//     } on DioException catch (e) {
//       debugPrint(e.toString());
//       return Left(e.toString());
//     }
//   }
// }
