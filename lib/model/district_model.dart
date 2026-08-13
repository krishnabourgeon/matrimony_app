// To parse this JSON data, do
//
//     final districtModel = districtModelFromJson(jsonString);

import 'dart:convert';

DistrictModel districtModelFromJson(String str) => DistrictModel.fromJson(json.decode(str));

String districtModelToJson(DistrictModel data) => json.encode(data.toJson());

class DistrictModel {
    List<District> districts;

    DistrictModel({
        required this.districts,
    });

    factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        districts: List<District>.from(json["districts"].map((x) => District.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "districts": List<dynamic>.from(districts.map((x) => x.toJson())),
    };
}

class District {
    int id;
    String name;

    District({
        required this.id,
        required this.name,
    });

    factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };

    @override
    bool operator ==(Object other) =>
        identical(this, other) || (other is District && other.id == id);

    @override
    int get hashCode => id.hashCode;
}
