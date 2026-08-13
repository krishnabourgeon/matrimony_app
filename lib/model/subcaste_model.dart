// To parse this JSON data, do
//
//     final subcastesModel = subcastesModelFromJson(jsonString);

import 'dart:convert';

SubcastesModel subcastesModelFromJson(String str) => SubcastesModel.fromJson(json.decode(str));

String subcastesModelToJson(SubcastesModel data) => json.encode(data.toJson());

class SubcastesModel {
    List<SubCaste> subCastes;

    SubcastesModel({
        required this.subCastes,
    });

    factory SubcastesModel.fromJson(Map<String, dynamic> json) => SubcastesModel(
        subCastes: List<SubCaste>.from(json["subCastes"].map((x) => SubCaste.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "subCastes": List<dynamic>.from(subCastes.map((x) => x.toJson())),
    };
}

class SubCaste {
    int id;
    String name;

    SubCaste({
        required this.id,
        required this.name,
    });

    factory SubCaste.fromJson(Map<String, dynamic> json) => SubCaste(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };

    @override
    bool operator ==(Object other) =>
        identical(this, other) || (other is SubCaste && other.id == id);

    @override
    int get hashCode => id.hashCode;
}
