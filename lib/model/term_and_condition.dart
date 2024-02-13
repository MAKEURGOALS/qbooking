// To parse this JSON data, do
//
//     final termAndConditionModel = termAndConditionModelFromJson(jsonString);

import 'dart:convert';

TermAndConditionModel termAndConditionModelFromJson(String str) => TermAndConditionModel.fromJson(json.decode(str));

String termAndConditionModelToJson(TermAndConditionModel data) => json.encode(data.toJson());

class TermAndConditionModel {
    String? id;
    String? context;

    TermAndConditionModel({
        this.id,
        this.context,
    });

    factory TermAndConditionModel.fromJson(Map<String, dynamic> json) => TermAndConditionModel(
        id: json["id"],
        context: json["context"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "context": context,
    };
}
