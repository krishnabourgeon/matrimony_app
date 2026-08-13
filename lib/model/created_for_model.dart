// To parse this JSON data, do
//
//     final createdForModel = createdForModelFromJson(jsonString);

import 'dart:convert';

CreatedForModel createdForModelFromJson(String str) => CreatedForModel.fromJson(json.decode(str));

String createdForModelToJson(CreatedForModel data) => json.encode(data.toJson());

class CreatedForModel {
    List<CreatedFor> createdFors;

    CreatedForModel({
        required this.createdFors,
    });

    factory CreatedForModel.fromJson(Map<String, dynamic> json) => CreatedForModel(
        createdFors: List<CreatedFor>.from(json["createdFors"].map((x) => CreatedFor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "createdFors": List<dynamic>.from(createdFors.map((x) => x.toJson())),
    };
}

class CreatedFor {
    int id;
    String name;

    CreatedFor({
        required this.id,
        required this.name,
    });

    factory CreatedFor.fromJson(Map<String, dynamic> json) => CreatedFor(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };

    @override
    bool operator ==(Object other) =>
        identical(this, other) || (other is CreatedFor && other.id == id);

    @override
    int get hashCode => id.hashCode;
}
