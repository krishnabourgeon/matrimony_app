// To parse this JSON data, do
//
//     final maritalStatusesModel = maritalStatusesModelFromJson(jsonString);

import 'dart:convert';

MaritalStatusesModel maritalStatusesModelFromJson(String str) => MaritalStatusesModel.fromJson(json.decode(str));

String maritalStatusesModelToJson(MaritalStatusesModel data) => json.encode(data.toJson());

class MaritalStatusesModel {
    List<MaritalStatus> maritalStatuses;

    MaritalStatusesModel({
        required this.maritalStatuses,
    });

    factory MaritalStatusesModel.fromJson(Map<String, dynamic> json) => MaritalStatusesModel(
        maritalStatuses: List<MaritalStatus>.from(json["maritalStatuses"].map((x) => MaritalStatus.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "maritalStatuses": List<dynamic>.from(maritalStatuses.map((x) => x.toJson())),
    };
}

class MaritalStatus {
    int id;
    String name;

    MaritalStatus({
        required this.id,
        required this.name,
    });

    factory MaritalStatus.fromJson(Map<String, dynamic> json) => MaritalStatus(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
