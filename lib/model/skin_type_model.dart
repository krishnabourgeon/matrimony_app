// To parse this JSON data, do
//
//     final skinTypeModel = skinTypeModelFromJson(jsonString);

import 'dart:convert';

SkinTypeModel skinTypeModelFromJson(String str) => SkinTypeModel.fromJson(json.decode(str));

String skinTypeModelToJson(SkinTypeModel data) => json.encode(data.toJson());

class SkinTypeModel {
    List<SkinType> skinTypes;

    SkinTypeModel({
        required this.skinTypes,
    });

    factory SkinTypeModel.fromJson(Map<String, dynamic> json) => SkinTypeModel(
        skinTypes: List<SkinType>.from(json["skinTypes"].map((x) => SkinType.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "skinTypes": List<dynamic>.from(skinTypes.map((x) => x.toJson())),
    };
}

class SkinType {
    int id;
    String name;

    SkinType({
        required this.id,
        required this.name,
    });

    factory SkinType.fromJson(Map<String, dynamic> json) => SkinType(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
