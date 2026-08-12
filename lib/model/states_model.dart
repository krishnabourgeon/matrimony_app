// To parse this JSON data, do
//
//     final statesModel = statesModelFromJson(jsonString);

import 'dart:convert';

StatesModel statesModelFromJson(String str) => StatesModel.fromJson(json.decode(str));

String statesModelToJson(StatesModel data) => json.encode(data.toJson());

class StatesModel {
    List<State> states;

    StatesModel({
        required this.states,
    });

    factory StatesModel.fromJson(Map<String, dynamic> json) => StatesModel(
        states: List<State>.from(json["states"].map((x) => State.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "states": List<dynamic>.from(states.map((x) => x.toJson())),
    };
}

class State {
    int id;
    String name;

    State({
        required this.id,
        required this.name,
    });

    factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
