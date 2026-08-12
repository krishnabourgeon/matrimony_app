// To parse this JSON data, do
//
//     final basicInfoModel = basicInfoModelFromJson(jsonString);

import 'dart:convert';

BasicInfoModel basicInfoModelFromJson(String str) => BasicInfoModel.fromJson(json.decode(str));

String basicInfoModelToJson(BasicInfoModel data) => json.encode(data.toJson());

class BasicInfoModel {
    String message;
    Data data;

    BasicInfoModel({
        required this.message,
        required this.data,
    });

    factory BasicInfoModel.fromJson(Map<String, dynamic> json) => BasicInfoModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int customerId;
    String email;
    String uniqueCode;
    DateTime dob;
    int genderId;

    Data({
        required this.customerId,
        required this.email,
        required this.uniqueCode,
        required this.dob,
        required this.genderId,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        customerId: json["customer_id"],
        email: json["email"],
        uniqueCode: json["unique_code"],
        dob: DateTime.parse(json["dob"]),
        genderId: json["gender_id"],
    );

    Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "email": email,
        "unique_code": uniqueCode,
        "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "gender_id": genderId,
    };
}
