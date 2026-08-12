// To parse this JSON data, do
//
//     final familyTypeModel = familyTypeModelFromJson(jsonString);

import 'dart:convert';

FamilyTypeModel familyTypeModelFromJson(String str) => FamilyTypeModel.fromJson(json.decode(str));

String familyTypeModelToJson(FamilyTypeModel data) => json.encode(data.toJson());

class FamilyTypeModel {
    List<FamilyType> familyTypes;

    FamilyTypeModel({
        required this.familyTypes,
    });

    factory FamilyTypeModel.fromJson(Map<String, dynamic> json) => FamilyTypeModel(
        familyTypes: List<FamilyType>.from(json["familyTypes"].map((x) => FamilyType.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "familyTypes": List<dynamic>.from(familyTypes.map((x) => x.toJson())),
    };
}

class FamilyType {
    int id;
    String name;

    FamilyType({
        required this.id,
        required this.name,
    });

    factory FamilyType.fromJson(Map<String, dynamic> json) => FamilyType(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
