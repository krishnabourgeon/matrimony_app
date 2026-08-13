// To parse this JSON data, do
//
//     final educationModel = educationModelFromJson(jsonString);

import 'dart:convert';

EducationModel educationModelFromJson(String str) => EducationModel.fromJson(json.decode(str));

String educationModelToJson(EducationModel data) => json.encode(data.toJson());

class EducationModel {
    List<Education> educations;

    EducationModel({
        required this.educations,
    });

    factory EducationModel.fromJson(Map<String, dynamic> json) => EducationModel(
        educations: List<Education>.from(json["educations"].map((x) => Education.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "educations": List<dynamic>.from(educations.map((x) => x.toJson())),
    };
}

class Education {
    int id;
    String name;

    Education({
        required this.id,
        required this.name,
    });

    factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };

    @override
    bool operator ==(Object other) =>
        identical(this, other) || (other is Education && other.id == id);

    @override
    int get hashCode => id.hashCode;
}
