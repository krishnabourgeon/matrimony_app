// To parse this JSON data, do
//
//     final occupationsModel = occupationsModelFromJson(jsonString);

import 'dart:convert';

OccupationsModel occupationsModelFromJson(String str) => OccupationsModel.fromJson(json.decode(str));

String occupationsModelToJson(OccupationsModel data) => json.encode(data.toJson());

class OccupationsModel {
    List<Occupation> occupations;

    OccupationsModel({
        required this.occupations,
    });

    factory OccupationsModel.fromJson(Map<String, dynamic> json) => OccupationsModel(
        occupations: List<Occupation>.from(json["occupations"].map((x) => Occupation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "occupations": List<dynamic>.from(occupations.map((x) => x.toJson())),
    };
}

class Occupation {
    int id;
    String name;

    Occupation({
        required this.id,
        required this.name,
    });

    factory Occupation.fromJson(Map<String, dynamic> json) => Occupation(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
