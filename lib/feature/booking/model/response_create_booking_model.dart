// To parse this JSON data, do
//
//     final responseCreateBookingModel = responseCreateBookingModelFromJson(jsonString);

import 'dart:convert';

ResponseCreateBookingModel responseCreateBookingModelFromJson(String str) => ResponseCreateBookingModel.fromJson(json.decode(str));

String responseCreateBookingModelToJson(ResponseCreateBookingModel data) => json.encode(data.toJson());

class ResponseCreateBookingModel {
    String? customerId;
    String? roomId;
    String? roomName;
    String? meetingDate;
    String? startTime;
    String? endTime;
    bool? statusBookingDone;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;

    ResponseCreateBookingModel({
        this.customerId,
        this.roomId,
        this.roomName,
        this.meetingDate,
        this.startTime,
        this.endTime,
        this.statusBookingDone,
        this.id,
        this.createdAt,
        this.updatedAt,
    });

    factory ResponseCreateBookingModel.fromJson(Map<String, dynamic> json) => ResponseCreateBookingModel(
        customerId: json["customerID"],
        roomId: json["roomID"],
        roomName: json["roomName"],
        meetingDate: json["meetingDate"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        statusBookingDone: json["status_booking_done"],
        id: json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "customerID": customerId,
        "roomID": roomId,
        "roomName": roomName,
        "meetingDate": meetingDate,
        "startTime": startTime,
        "endTime": endTime,
        "status_booking_done": statusBookingDone,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
