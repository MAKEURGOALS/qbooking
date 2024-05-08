// To parse this JSON data, do
//
//     final qrCodeModel = qrCodeModelFromJson(jsonString);

import 'dart:convert';

QrCodeModel qrCodeModelFromJson(String str) => QrCodeModel.fromJson(json.decode(str));

String qrCodeModelToJson(QrCodeModel data) => json.encode(data.toJson());

class QrCodeModel {
    String? id;

    QrCodeModel({
        this.id,
    });

    factory QrCodeModel.fromJson(Map<String, dynamic> json) => QrCodeModel(
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
    };
}
