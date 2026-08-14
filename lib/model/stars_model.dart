// To parse this JSON data, do
//
//     final starsModel = starsModelFromJson(jsonString);

import 'dart:convert';

StarsModel starsModelFromJson(String str) => StarsModel.fromJson(json.decode(str));

String starsModelToJson(StarsModel data) => json.encode(data.toJson());

class StarsModel {
    List<Star> stars;

    StarsModel({
        required this.stars,
    });

    factory StarsModel.fromJson(Map<String, dynamic> json) => StarsModel(
        stars: List<Star>.from(json["stars"].map((x) => Star.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "stars": List<dynamic>.from(stars.map((x) => x.toJson())),
    };
}

class Star {
    int id;
    String name;

    Star({
        required this.id,
        required this.name,
    });

    factory Star.fromJson(Map<String, dynamic> json) => Star(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };

    @override
    bool operator ==(Object other) =>
        identical(this, other) || (other is Star && other.id == id);

    @override
    int get hashCode => id.hashCode;
}
