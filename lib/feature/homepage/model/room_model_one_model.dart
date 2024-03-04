// To parse this JSON data, do
//
//     final roomModel = roomModelFromJson(jsonString);

import 'dart:convert';

List<RoomModel> roomModelFromJson(String str) => List<RoomModel>.from(json.decode(str).map((x) => RoomModel.fromJson(x)));

String roomModelToJson(List<RoomModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


// RoomModel roomModelFromJson(String str) => RoomModel.fromJson(json.decode(str));

// String roomModelToJson(RoomModel data) => json.encode(data.toJson());

class RoomModel {
    String? id;
    // String? images;
    String? roomName;
    bool? isActiveStatus;
    String? floor;
    String? typeRoom;
    String? description;
    bool? isActiveBooked;
    List<String>? images;

    RoomModel({
        this.id,
        this.images,
        this.roomName,
        this.isActiveStatus,
        this.floor,
        this.typeRoom,
        this.description,
        this.isActiveBooked,
    });

    factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        id: json["id"],
        roomName: json["roomName"],
        isActiveStatus: json["is_active_status"],
        floor: json["floor"],
        typeRoom: json["typeRoom"],
        description: json["description"],
        isActiveBooked: json["is_active_booked"],
        // images: List<String>.from(json["images"].map((x) => x)),
        images: List<String>.from(json["images"].map((x) => x ?? '')), // Replace null with an empty string

    );

    Map<String, dynamic> toJson() => {
        "id": id,
        // "images": images,
        "roomName": roomName,
        "isActiveStatus": isActiveStatus,
        "floor": floor,
        "typeRoom": typeRoom,
        "description": description,
        "isActiveBooked": isActiveBooked,
        "images":
           images != null ? List<dynamic>.from(images!.map((x) => x)) : [],
    };
}
