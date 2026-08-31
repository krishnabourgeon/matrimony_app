// To parse this JSON data, do
//
//     final respondInterestModel = respondInterestModelFromJson(jsonString);

import 'dart:convert';

RespondInterestModel respondInterestModelFromJson(String str) => RespondInterestModel.fromJson(json.decode(str));

String respondInterestModelToJson(RespondInterestModel data) => json.encode(data.toJson());

class RespondInterestModel {
    String? message;
    int? status;

    RespondInterestModel({
        this.message,
        this.status,
    });

    factory RespondInterestModel.fromJson(Map<String, dynamic> json) => RespondInterestModel(
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
    };
}
