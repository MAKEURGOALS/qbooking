// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

BookingModel bookingModelFromJson(String str) => BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
    String? id;
    String? customerId;
    String? roomId;
    String ?roomName;
    String? meetingDate;
    String? meetingTime;
    String? startTime;
    String? endTime;
    String ?equipments;
    bool? statusBookingdone;

    BookingModel({
        this.id,
        this.customerId,
        this.roomId,
        this.roomName,
        this.meetingDate,
        this.meetingTime,
        this.startTime,
        this.endTime,
        this.equipments,
        this.statusBookingdone,
    });

    factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        id: json["id"],
        customerId: json["customerID"],
        roomId: json["roomID"],
        roomName: json["roomName"],
        meetingDate: json["meetingDate"],
        meetingTime: json["meetingTime"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        equipments: json["equipments"],
        statusBookingdone: json["statusBookingdone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customerID": customerId,
        "roomID": roomId,
        "roomName": roomName,
        "meetingDate": meetingDate,
        "meetingTime": meetingTime,
        "startTime": startTime,
        "endTime": endTime,
        "equipments": equipments,
        "statusBookingdone": statusBookingdone,
    };
}
