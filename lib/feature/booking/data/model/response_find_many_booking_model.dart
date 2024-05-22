// To parse this JSON data, do
//
//     final responseFindManyBookingModel = responseFindManyBookingModelFromJson(jsonString);

import 'dart:convert';

List<ResponseFindManyBookingModel> responseFindManyBookingModelFromJson(String str) => List<ResponseFindManyBookingModel>.from(json.decode(str).map((x) => ResponseFindManyBookingModel.fromJson(x)));

String responseFindManyBookingModelToJson(List<ResponseFindManyBookingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponseFindManyBookingModel {
    String? id;
    CustomerId? customerId;
    RoomId? roomId;
    String? roomName;
    String? meetingDate;
    String? meetingTime;
    String? startTime;
    String? endTime;
    bool? statusBookingDone;
    DateTime? createdAt;
    DateTime? updatedAt;

    ResponseFindManyBookingModel({
        this.id,
        this.customerId,
        this.roomId,
        this.roomName,
        this.meetingDate,
        this.meetingTime,
        this.startTime,
        this.endTime,
        this.statusBookingDone,
        this.createdAt,
        this.updatedAt,
    });

    factory ResponseFindManyBookingModel.fromJson(Map<String, dynamic> json) => ResponseFindManyBookingModel(
        id: json["_id"],
        customerId: json["customerID"] == null ? null : CustomerId.fromJson(json["customerID"]),
        roomId: json["roomID"] == null ? null : RoomId.fromJson(json["roomID"]),
        roomName: json["roomName"],
        meetingDate: json["meetingDate"],
        meetingTime: json["meetingTime"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        statusBookingDone: json["status_booking_done"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "customerID": customerId?.toJson(),
        "roomID": roomId?.toJson(),
        "roomName": roomName,
        "meetingDate": meetingDate,
        "meetingTime": meetingTime,
        "startTime": startTime,
        "endTime": endTime,
        "status_booking_done": statusBookingDone,
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

class RoomId {
    String? id;
    List<String>? images; 
    String? roomName;
    bool? isActiveStatus;
    String? floor;
    String? typeRoom;
    String? description;
    bool? isActiveBooked;
    DateTime? createdAt;
    DateTime? updatedAt;

    RoomId({
        this.id,
        this.images,
        this.roomName,
        this.isActiveStatus,
        this.floor,
        this.typeRoom,
        this.description,
        this.isActiveBooked,
        this.createdAt,
        this.updatedAt,
    });

    factory RoomId.fromJson(Map<String, dynamic> json) => RoomId(
        id: json["_id"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        roomName: json["roomName"],
        isActiveStatus: json["is_active_status"],
        floor: json["floor"],
        typeRoom: json["type_room"],
        description: json["description"],
        isActiveBooked: json["is_active_booked"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "roomName": roomName,
        "is_active_status": isActiveStatus,
        "floor": floor,
        "type_room": typeRoom,
        "description": description,
        "is_active_booked": isActiveBooked,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
