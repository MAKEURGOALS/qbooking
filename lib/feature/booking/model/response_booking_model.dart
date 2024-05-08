// To parse this JSON data, do
//
//     final responseBookingModel = responseBookingModelFromJson(jsonString);

import 'dart:convert';

List<ResponseBookingModel> responseBookingModelFromJson(String str) => List<ResponseBookingModel>.from(json.decode(str).map((x) => ResponseBookingModel.fromJson(x)));

String responseBookingModelToJson(List<ResponseBookingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponseBookingModel {
    String? id;
    dynamic customerId;
    RoomId? roomId;
    String? roomName;
    String? meetingDate;
    String? startTime;
    String? endTime;
    bool? statusBookingDone;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    ResponseBookingModel({
        this.id,
        this.customerId,
        this.roomId,
        this.roomName,
        this.meetingDate,
        this.startTime,
        this.endTime,
        this.statusBookingDone,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory ResponseBookingModel.fromJson(Map<String, dynamic> json) => ResponseBookingModel(
        id: json["_id"],
        customerId: json["customerID"],
        roomId: json["roomID"] == null ? null : RoomId.fromJson(json["roomID"]),
        roomName: json["roomName"],
        meetingDate: json["meetingDate"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        statusBookingDone: json["status_booking_done"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "customerID": customerId,
        "roomID": roomId?.toJson(),
        "roomName": roomName,
        "meetingDate": meetingDate,
        "startTime": startTime,
        "endTime": endTime,
        "status_booking_done": statusBookingDone,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
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
    int? v;

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
        this.v,
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
        v: json["__v"],
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
        "__v": v,
    };
}
