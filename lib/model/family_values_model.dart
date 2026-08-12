// To parse this JSON data, do
//
//     final familyValuesModel = familyValuesModelFromJson(jsonString);

import 'dart:convert';

FamilyValuesModel familyValuesModelFromJson(String str) => FamilyValuesModel.fromJson(json.decode(str));

String familyValuesModelToJson(FamilyValuesModel data) => json.encode(data.toJson());

class FamilyValuesModel {
    List<FamilyValue> familyValues;

    FamilyValuesModel({
        required this.familyValues,
    });

    factory FamilyValuesModel.fromJson(Map<String, dynamic> json) => FamilyValuesModel(
        familyValues: List<FamilyValue>.from(json["familyValues"].map((x) => FamilyValue.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "familyValues": List<dynamic>.from(familyValues.map((x) => x.toJson())),
    };
}

class FamilyValue {
    int id;
    String name;

    FamilyValue({
        required this.id,
        required this.name,
    });

    factory FamilyValue.fromJson(Map<String, dynamic> json) => FamilyValue(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
