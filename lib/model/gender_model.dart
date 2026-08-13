// To parse this JSON data, do
//
//     final genderModel = genderModelFromJson(jsonString);

import 'dart:convert';

GenderModel genderModelFromJson(String str) => GenderModel.fromJson(json.decode(str));

String genderModelToJson(GenderModel data) => json.encode(data.toJson());

class GenderModel {
    List<Gender> genders;

    GenderModel({
        required this.genders,
    });

    factory GenderModel.fromJson(Map<String, dynamic> json) => GenderModel(
        genders: List<Gender>.from(json["genders"].map((x) => Gender.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "genders": List<dynamic>.from(genders.map((x) => x.toJson())),
    };
}

class Gender {
    int id;
    String name;

    Gender({
        required this.id,
        required this.name,
    });

    factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };

    @override
    bool operator ==(Object other) =>
        identical(this, other) || (other is Gender && other.id == id);

    @override
    int get hashCode => id.hashCode;
}
