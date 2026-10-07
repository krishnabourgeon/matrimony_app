// To parse this JSON data, do
//
//     final verifyOtpModel = verifyOtpModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpModel verifyOtpModelFromJson(String str) => VerifyOtpModel.fromJson(json.decode(str));

String verifyOtpModelToJson(VerifyOtpModel data) => json.encode(data.toJson());

class VerifyOtpModel {
    String message;
    String token;
    Customer customer;

    VerifyOtpModel({
        required this.message,
        required this.token,
        required this.customer,
    });

    factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
        message: json["message"],
        token: json["token"],
        customer: Customer.fromJson(json["customer"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "customer": customer.toJson(),
    };
}

class Customer {
    int id;
    String name;
    String mobileNumber;
    // Not always sent by the API; used to pick the default avatar.
    dynamic gender;

    Customer({
        required this.id,
        required this.name,
        required this.mobileNumber,
        this.gender,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        mobileNumber: json["mobile_number"],
        gender: json["gender"] ?? json["gender_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile_number": mobileNumber,
        if (gender != null) "gender": gender,
    };
}
