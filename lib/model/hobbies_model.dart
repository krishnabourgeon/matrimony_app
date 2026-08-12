// To parse this JSON data, do
//
//     final hobbiesModel = hobbiesModelFromJson(jsonString);

import 'dart:convert';

HobbiesModel hobbiesModelFromJson(String str) => HobbiesModel.fromJson(json.decode(str));

String hobbiesModelToJson(HobbiesModel data) => json.encode(data.toJson());

class HobbiesModel {
    List<Hobby> hobbies;

    HobbiesModel({
        required this.hobbies,
    });

    factory HobbiesModel.fromJson(Map<String, dynamic> json) => HobbiesModel(
        hobbies: List<Hobby>.from(json["hobbies"].map((x) => Hobby.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "hobbies": List<dynamic>.from(hobbies.map((x) => x.toJson())),
    };
}

class Hobby {
    int id;
    String name;

    Hobby({
        required this.id,
        required this.name,
    });

    factory Hobby.fromJson(Map<String, dynamic> json) => Hobby(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
