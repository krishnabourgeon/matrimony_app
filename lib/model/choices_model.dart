// To parse this JSON data, do
//
//     final choicesModel = choicesModelFromJson(jsonString);

import 'dart:convert';

ChoicesModel choicesModelFromJson(String str) => ChoicesModel.fromJson(json.decode(str));

String choicesModelToJson(ChoicesModel data) => json.encode(data.toJson());

class ChoicesModel {
    List<Choice> choices;

    ChoicesModel({
        required this.choices,
    });

    factory ChoicesModel.fromJson(Map<String, dynamic> json) => ChoicesModel(
        choices: List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
    };
}

class Choice {
    int id;
    String name;

    Choice({
        required this.id,
        required this.name,
    });

    factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
