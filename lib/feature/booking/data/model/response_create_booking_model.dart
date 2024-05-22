// To parse this JSON data, do
//
//     final responseCreateBookingModel = responseCreateBookingModelFromJson(jsonString);

import 'dart:convert';

List<ResponseCreateBookingModel> responseCreateBookingModelFromJson(String str) => List<ResponseCreateBookingModel>.from(json.decode(str).map((x) => ResponseCreateBookingModel.fromJson(x)));

String responseCreateBookingModelToJson(List<ResponseCreateBookingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponseCreateBookingModel {
    CustomerId? customerId;
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
        customerId: json["customerID"] == null ? null : CustomerId.fromJson(json["customerID"]),
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
        "customerID": customerId?.toJson(),
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

class CustomerId {
    String? id;
    String? profileId;
    String? contact;
    String? password;
    DateTime? createdAt;
    DateTime? updatedAt;

    CustomerId({
        this.id,
        this.profileId,
        this.contact,
        this.password,
        this.createdAt,
        this.updatedAt,
    });

    factory CustomerId.fromJson(Map<String, dynamic> json) => CustomerId(
        id: json["_id"],
        profileId: json["profileId"],
        contact: json["contact"],
        password: json["password"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "profileId": profileId,
        "contact": contact,
        "password": password,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
