// To parse this JSON data, do
//
//     final bodyTypesModel = bodyTypesModelFromJson(jsonString);

import 'dart:convert';

BodyTypesModel bodyTypesModelFromJson(String str) => BodyTypesModel.fromJson(json.decode(str));

String bodyTypesModelToJson(BodyTypesModel data) => json.encode(data.toJson());

class BodyTypesModel {
    List<BodyType> bodyTypes;

    BodyTypesModel({
        required this.bodyTypes,
    });

    factory BodyTypesModel.fromJson(Map<String, dynamic> json) => BodyTypesModel(
        bodyTypes: List<BodyType>.from(json["bodyTypes"].map((x) => BodyType.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "bodyTypes": List<dynamic>.from(bodyTypes.map((x) => x.toJson())),
    };
}

class BodyType {
    int id;
    String name;

    BodyType({
        required this.id,
        required this.name,
    });

    factory BodyType.fromJson(Map<String, dynamic> json) => BodyType(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
