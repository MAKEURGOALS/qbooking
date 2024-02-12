// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    String? id;
    String? subDescription;
    String? description;
    String? time;
    String? images;

    NotificationModel({
        this.id,
        this.subDescription,
        this.description,
        this.time,
        this.images,
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json["id"],
        subDescription: json["subDescription"],
        description: json["description"],
        time: json["time"],
        images: json["images"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subDescription": subDescription,
        "description": description,
        "time": time,
        "images": images,
    };
}
