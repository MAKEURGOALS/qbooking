// To parse this JSON data, do
//
//     final policyModel = policyModelFromJson(jsonString);

import 'dart:convert';

PolicyModel policyModelFromJson(String str) => PolicyModel.fromJson(json.decode(str));

String policyModelToJson(PolicyModel data) => json.encode(data.toJson());

class PolicyModel {
    String? id;
    String? context;

    PolicyModel({
        this.id,
        this.context,
    });

    factory PolicyModel.fromJson(Map<String, dynamic> json) => PolicyModel(
        id: json["id"],
        context: json["context"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "context": context,
    };
}
