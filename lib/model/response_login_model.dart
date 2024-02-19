// To parse this JSON data, do
//
//     final responseLogInModel = responseLogInModelFromJson(jsonString);

import 'dart:convert';

ResponseLogInModel responseLogInModelFromJson(String str) => ResponseLogInModel.fromJson(json.decode(str));

String responseLogInModelToJson(ResponseLogInModel data) => json.encode(data.toJson());

class ResponseLogInModel {
    String? accessToken;
    String? refreshToken;

    ResponseLogInModel({
        this.accessToken,
        this.refreshToken,
    });

    factory ResponseLogInModel.fromJson(Map<String, dynamic> json) => ResponseLogInModel(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
    };
}
