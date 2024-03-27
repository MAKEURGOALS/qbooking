// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);


import 'dart:convert';

BookingModel bookingModelFromJson(String str) => BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
    final String message;

    BookingModel({
        required this.message,
    });

    factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
