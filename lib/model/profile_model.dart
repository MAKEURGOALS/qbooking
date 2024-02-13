// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    String? id;
    String? name;
    String? gmail;
    String? gender;
    String? phone;
    String? country;

    ProfileModel({
        this.id,
        this.name,
        this.gmail,
        this.gender,
        this.phone,
        this.country,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        name: json["Name"],
        gmail: json["gmail"],
        gender: json["gender"],
        phone: json["phone"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "gmail": gmail,
        "gender": gender,
        "phone": phone,
        "country": country,
    };
}
