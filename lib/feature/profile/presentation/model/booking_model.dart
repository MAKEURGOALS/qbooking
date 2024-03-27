// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

BookingModel bookingModelFromJson(String str) => BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
    String? customerId;
    String? roomId;
    String? roomName;
    String? meetingDate;
    String? startTime;
    String? endTime;
    String? equipment;

    BookingModel({
        this.customerId,
        this.roomId,
        this.roomName,
        this.meetingDate,
        this.startTime,
        this.endTime,
        this.equipment,
    });

    factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        customerId: json["customerID"],
        roomId: json["roomID"],
        roomName: json["roomName"],
        meetingDate: json["meetingDate"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        equipment: json["equipment"],
    );

    Map<String, dynamic> toJson() => {
        "customerID": customerId,
        "roomID": roomId,
        "roomName": roomName,
        "meetingDate": meetingDate,
        "startTime": startTime,
        "endTime": endTime,
        "equipment": equipment,
    };
}
