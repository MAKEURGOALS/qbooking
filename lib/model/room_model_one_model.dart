// To parse this JSON data, do
//
//     final roomModel = roomModelFromJson(jsonString);

import 'dart:convert';

RoomModel roomModelFromJson(String str) => RoomModel.fromJson(json.decode(str));

String roomModelToJson(RoomModel data) => json.encode(data.toJson());

class RoomModel {
    String? id;
    String? images;
    String? roomName;
    bool? isActiveStatus;
    String? floor;
    String? typeRoom;
    String? description;
    bool? isActiveBooked;

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
        images: json["images"],
        roomName: json["roomName"],
        isActiveStatus: json["isActiveStatus"],
        floor: json["floor"],
        typeRoom: json["typeRoom"],
        description: json["description"],
        isActiveBooked: json["isActiveBooked"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "images": images,
        "roomName": roomName,
        "isActiveStatus": isActiveStatus,
        "floor": floor,
        "typeRoom": typeRoom,
        "description": description,
        "isActiveBooked": isActiveBooked,
    };
}
