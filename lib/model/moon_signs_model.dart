// To parse this JSON data, do
//
//     final moonSignsModel = moonSignsModelFromJson(jsonString);

import 'dart:convert';

MoonSignsModel moonSignsModelFromJson(String str) => MoonSignsModel.fromJson(json.decode(str));

String moonSignsModelToJson(MoonSignsModel data) => json.encode(data.toJson());

class MoonSignsModel {
    List<MoonSign> moonSigns;

    MoonSignsModel({
        required this.moonSigns,
    });

    factory MoonSignsModel.fromJson(Map<String, dynamic> json) => MoonSignsModel(
        moonSigns: List<MoonSign>.from(json["moonSigns"].map((x) => MoonSign.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "moonSigns": List<dynamic>.from(moonSigns.map((x) => x.toJson())),
    };
}

class MoonSign {
    int id;
    String name;

    MoonSign({
        required this.id,
        required this.name,
    });

    factory MoonSign.fromJson(Map<String, dynamic> json) => MoonSign(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
