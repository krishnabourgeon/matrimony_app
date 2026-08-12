// To parse this JSON data, do
//
//     final residentialModel = residentialModelFromJson(jsonString);

import 'dart:convert';

ResidentialModel residentialModelFromJson(String str) => ResidentialModel.fromJson(json.decode(str));

String residentialModelToJson(ResidentialModel data) => json.encode(data.toJson());

class ResidentialModel {
    List<ResidentialStatus> residentialStatuses;

    ResidentialModel({
        required this.residentialStatuses,
    });

    factory ResidentialModel.fromJson(Map<String, dynamic> json) => ResidentialModel(
        residentialStatuses: List<ResidentialStatus>.from(json["residentialStatuses"].map((x) => ResidentialStatus.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "residentialStatuses": List<dynamic>.from(residentialStatuses.map((x) => x.toJson())),
    };
}

class ResidentialStatus {
    int id;
    String name;

    ResidentialStatus({
        required this.id,
        required this.name,
    });

    factory ResidentialStatus.fromJson(Map<String, dynamic> json) => ResidentialStatus(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
