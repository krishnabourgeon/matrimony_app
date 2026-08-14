// To parse this JSON data, do
//
//     final hobbyModel = hobbyModelFromJson(jsonString);

import 'dart:convert';

HobbyInfoModel hobbyInfoModelFromJson(String str) => HobbyInfoModel.fromJson(json.decode(str));

String hobbyInfoModelToJson(HobbyInfoModel data) => json.encode(data.toJson());

class HobbyInfoModel {
    String? message;
    Data? data;

    HobbyInfoModel({
        this.message,
        this.data,
    });

    factory HobbyInfoModel.fromJson(Map<String, dynamic> json) => HobbyInfoModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    List<String>? hobbies;
    String? otherHobbies;

    Data({
        this.hobbies,
        this.otherHobbies,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        hobbies: json["hobbies"] == null ? null : List<String>.from(json["hobbies"].map((x) => x)),
        otherHobbies: json["other_hobbies"],
    );

    Map<String, dynamic> toJson() => {
        "hobbies": hobbies == null ? null : List<dynamic>.from(hobbies!.map((x) => x)),
        "other_hobbies": otherHobbies,
    };
}
