// To parse this JSON data, do
//
//     final castModel = castModelFromJson(jsonString);

import 'dart:convert';

CastModel castModelFromJson(String str) => CastModel.fromJson(json.decode(str));

String castModelToJson(CastModel data) => json.encode(data.toJson());

class CastModel {
    List<Caste> castes;

    CastModel({
        required this.castes,
    });

    factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        castes: List<Caste>.from(json["castes"].map((x) => Caste.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "castes": List<dynamic>.from(castes.map((x) => x.toJson())),
    };
}

class Caste {
    int id;
    String name;

    Caste({
        required this.id,
        required this.name,
    });

    factory Caste.fromJson(Map<String, dynamic> json) => Caste(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
