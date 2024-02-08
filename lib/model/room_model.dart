// To parse this JSON data, do
//
//     final roomModel = roomModelFromJson(jsonString);

import 'dart:convert';

RoomModel roomModelFromJson(String str) => RoomModel.fromJson(json.decode(str));

String roomModelToJson(RoomModel data) => json.encode(data.toJson());

class RoomModel {
  String? id;
  String? name;
  String? subDescription;
  String? description;
  double? rate;
  String? floor;
  bool? isAvailable;
  List<String>? images;

  RoomModel({
    this.id,
    this.name,
    this.subDescription,
    this.description,
    this.rate,
    this.floor,
    this.isAvailable,
    this.images,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        id: json["id"],
        name: json["name"],
        subDescription: json["subDescription"],
        description: json["description"],
        rate: json["rate"].toDouble(),
        floor: json["floor"],
        isAvailable: json["isAvailable"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "subDescription": subDescription,
        "description": description,
        "rate": rate,
        "floor": floor,
        "isAvailable": isAvailable,
        "images":
            images != null ? List<dynamic>.from(images!.map((x) => x)) : [],
      };
}
