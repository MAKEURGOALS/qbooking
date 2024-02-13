// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

CustomerModel customerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
    String? id;
    String? profileId;
    String? contact;
    String? password;
    String? google;
    String? facebook;

    CustomerModel({
        this.id,
        this.profileId,
        this.contact,
        this.password,
        this.google,
        this.facebook,
    });

    factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["id"],
        profileId: json["profileID"],
        contact: json["contact"],
        password: json["password"],
        google: json["google"],
        facebook: json["facebook"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "profileID": profileId,
        "contact": contact,
        "password": password,
        "google": google,
        "facebook": facebook,
    };
}
