// To parse this JSON data, do
//
//     final chooseSubscriptionModel = chooseSubscriptionModelFromJson(jsonString);

import 'dart:convert';

ChooseSubscriptionModel chooseSubscriptionModelFromJson(String str) => ChooseSubscriptionModel.fromJson(json.decode(str));

String chooseSubscriptionModelToJson(ChooseSubscriptionModel data) => json.encode(data.toJson());

class ChooseSubscriptionModel {
    bool? status;
    String? message;

    ChooseSubscriptionModel({
        this.status,
        this.message,
    });

    factory ChooseSubscriptionModel.fromJson(Map<String, dynamic> json) => ChooseSubscriptionModel(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
