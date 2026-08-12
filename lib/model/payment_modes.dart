// To parse this JSON data, do
//
//     final paymentModesModel = paymentModesModelFromJson(jsonString);

import 'dart:convert';

PaymentModesModel paymentModesModelFromJson(String str) => PaymentModesModel.fromJson(json.decode(str));

String paymentModesModelToJson(PaymentModesModel data) => json.encode(data.toJson());

class PaymentModesModel {
    List<PaymentMode> paymentModes;

    PaymentModesModel({
        required this.paymentModes,
    });

    factory PaymentModesModel.fromJson(Map<String, dynamic> json) => PaymentModesModel(
        paymentModes: List<PaymentMode>.from(json["paymentModes"].map((x) => PaymentMode.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "paymentModes": List<dynamic>.from(paymentModes.map((x) => x.toJson())),
    };
}

class PaymentMode {
    int id;
    String name;

    PaymentMode({
        required this.id,
        required this.name,
    });

    factory PaymentMode.fromJson(Map<String, dynamic> json) => PaymentMode(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
