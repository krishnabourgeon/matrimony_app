// To parse this JSON data, do
//
//     final motherTongueModel = motherTongueModelFromJson(jsonString);

import 'dart:convert';

MotherTongueModel motherTongueModelFromJson(String str) => MotherTongueModel.fromJson(json.decode(str));

String motherTongueModelToJson(MotherTongueModel data) => json.encode(data.toJson());

class MotherTongueModel {
    List<Language> languages;

    MotherTongueModel({
        required this.languages,
    });

    factory MotherTongueModel.fromJson(Map<String, dynamic> json) => MotherTongueModel(
        languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
    };
}

class Language {
    int id;
    String name;

    Language({
        required this.id,
        required this.name,
    });

    factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };

    @override
    bool operator ==(Object other) =>
        identical(this, other) || (other is Language && other.id == id);

    @override
    int get hashCode => id.hashCode;
}
