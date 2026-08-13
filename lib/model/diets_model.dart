// To parse this JSON data, do
//
//     final dietsModel = dietsModelFromJson(jsonString);

import 'dart:convert';

DietsModel dietsModelFromJson(String str) => DietsModel.fromJson(json.decode(str));

String dietsModelToJson(DietsModel data) => json.encode(data.toJson());

class DietsModel {
    List<Diet> diets;

    DietsModel({
        required this.diets,
    });

    factory DietsModel.fromJson(Map<String, dynamic> json) => DietsModel(
        diets: List<Diet>.from(json["diets"].map((x) => Diet.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "diets": List<dynamic>.from(diets.map((x) => x.toJson())),
    };
}

class Diet {
    int id;
    String name;

    Diet({
        required this.id,
        required this.name,
    });

    factory Diet.fromJson(Map<String, dynamic> json) => Diet(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };

    @override
    bool operator ==(Object other) =>
        identical(this, other) || (other is Diet && other.id == id);

    @override
    int get hashCode => id.hashCode;
}
