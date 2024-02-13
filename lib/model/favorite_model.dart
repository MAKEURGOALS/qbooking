// To parse this JSON data, do
//
//     final favoriteModel = favoriteModelFromJson(jsonString);

import 'dart:convert';

FavoriteModel favoriteModelFromJson(String str) => FavoriteModel.fromJson(json.decode(str));

String favoriteModelToJson(FavoriteModel data) => json.encode(data.toJson());

class FavoriteModel {
    String? id;
    String? roomId;
    String? customerId;

    FavoriteModel({
        this.id,
        this.roomId,
        this.customerId,
    });

    factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        id: json["id"],
        roomId: json["roomID"],
        customerId: json["customerID"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "roomID": roomId,
        "customerID": customerId,
    };
}
