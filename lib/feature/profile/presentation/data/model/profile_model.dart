// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    String? contact;
    String? password;

    ProfileModel({
        this.contact,
        this.password,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        contact: json["contact"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "contact": contact,
        "password": password,
    };
}
