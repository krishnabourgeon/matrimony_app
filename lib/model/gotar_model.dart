// To parse this JSON data, do
//
//     final gotrasModel = gotrasModelFromJson(jsonString);

import 'dart:convert';

GotrasModel gotrasModelFromJson(String str) => GotrasModel.fromJson(json.decode(str));

String gotrasModelToJson(GotrasModel data) => json.encode(data.toJson());

class GotrasModel {
    List<Gotra> gotras;

    GotrasModel({
        required this.gotras,
    });

    factory GotrasModel.fromJson(Map<String, dynamic> json) => GotrasModel(
        gotras: List<Gotra>.from(json["gotras"].map((x) => Gotra.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "gotras": List<dynamic>.from(gotras.map((x) => x.toJson())),
    };
}

class Gotra {
    int id;
    String name;
    int status;
    DateTime createdAt;
    DateTime updatedAt;

    Gotra({
        required this.id,
        required this.name,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Gotra.fromJson(Map<String, dynamic> json) => Gotra(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };

    @override
    bool operator ==(Object other) =>
        identical(this, other) || (other is Gotra && other.id == id);

    @override
    int get hashCode => id.hashCode;
}
