// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    String? id;
    String? gender;
    String? country;
    String? gmail;
    String? name;
    String? phone;

    ProfileModel({
        this.id,
        this.gender,
        this.country,
        this.gmail,
        this.name,
        this.phone,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["_id"],
        gender: json["gender"],
        country: json["country"],
        gmail: json["gmail"],
        name: json["name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "gender": gender,
        "country": country,
        "gmail": gmail,
        "name": name,
        "phone": phone,
    };
}
