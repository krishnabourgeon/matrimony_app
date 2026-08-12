// To parse this JSON data, do
//
//     final familyStatusesModel = familyStatusesModelFromJson(jsonString);

import 'dart:convert';

FamilyStatusesModel familyStatusesModelFromJson(String str) => FamilyStatusesModel.fromJson(json.decode(str));

String familyStatusesModelToJson(FamilyStatusesModel data) => json.encode(data.toJson());

class FamilyStatusesModel {
    List<FamilyStatus> familyStatuses;

    FamilyStatusesModel({
        required this.familyStatuses,
    });

    factory FamilyStatusesModel.fromJson(Map<String, dynamic> json) => FamilyStatusesModel(
        familyStatuses: List<FamilyStatus>.from(json["familyStatuses"].map((x) => FamilyStatus.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "familyStatuses": List<dynamic>.from(familyStatuses.map((x) => x.toJson())),
    };
}

class FamilyStatus {
    int id;
    String name;

    FamilyStatus({
        required this.id,
        required this.name,
    });

    factory FamilyStatus.fromJson(Map<String, dynamic> json) => FamilyStatus(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
