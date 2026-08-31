// To parse this JSON data, do
//
//     final respondRequestModel = respondRequestModelFromJson(jsonString);

import 'dart:convert';

RespondRequestModel respondRequestModelFromJson(String str) => RespondRequestModel.fromJson(json.decode(str));

String respondRequestModelToJson(RespondRequestModel data) => json.encode(data.toJson());

class RespondRequestModel {
    String? message;
    int? status;

    RespondRequestModel({
        this.message,
        this.status,
    });

    factory RespondRequestModel.fromJson(Map<String, dynamic> json) => RespondRequestModel(
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
    };
}
