// To parse this JSON data, do
//
//     final religionsModel = religionsModelFromJson(jsonString);

import 'dart:convert';

ReligionsModel religionsModelFromJson(String str) => ReligionsModel.fromJson(json.decode(str));

String religionsModelToJson(ReligionsModel data) => json.encode(data.toJson());

class ReligionsModel {
    List<Religion> religions;

    ReligionsModel({
        required this.religions,
    });

    factory ReligionsModel.fromJson(Map<String, dynamic> json) => ReligionsModel(
        religions: List<Religion>.from(json["religions"].map((x) => Religion.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "religions": List<dynamic>.from(religions.map((x) => x.toJson())),
    };
}

class Religion {
    int id;
    String name;

    Religion({
        required this.id,
        required this.name,
    });

    factory Religion.fromJson(Map<String, dynamic> json) => Religion(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };

    @override
    bool operator ==(Object other) =>
        identical(this, other) || (other is Religion && other.id == id);

    @override
    int get hashCode => id.hashCode;
}
