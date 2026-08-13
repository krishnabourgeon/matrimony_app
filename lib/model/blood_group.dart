// To parse this JSON data, do
//
//     final bloodGroupModel = bloodGroupModelFromJson(jsonString);

import 'dart:convert';

BloodGroupModel bloodGroupModelFromJson(String str) => BloodGroupModel.fromJson(json.decode(str));

String bloodGroupModelToJson(BloodGroupModel data) => json.encode(data.toJson());

class BloodGroupModel {
    List<BloodGroup> bloodGroups;

    BloodGroupModel({
        required this.bloodGroups,
    });

    factory BloodGroupModel.fromJson(Map<String, dynamic> json) => BloodGroupModel(
        bloodGroups: List<BloodGroup>.from(json["bloodGroups"].map((x) => BloodGroup.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "bloodGroups": List<dynamic>.from(bloodGroups.map((x) => x.toJson())),
    };
}

class BloodGroup {
    int id;
    String name;

    BloodGroup({
        required this.id,
        required this.name,
    });

    factory BloodGroup.fromJson(Map<String, dynamic> json) => BloodGroup(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };

    @override
    bool operator ==(Object other) =>
        identical(this, other) || (other is BloodGroup && other.id == id);

    @override
    int get hashCode => id.hashCode;
}
