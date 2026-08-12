// To parse this JSON data, do
//
//     final jobIndustriesModel = jobIndustriesModelFromJson(jsonString);

import 'dart:convert';

JobIndustriesModel jobIndustriesModelFromJson(String str) => JobIndustriesModel.fromJson(json.decode(str));

String jobIndustriesModelToJson(JobIndustriesModel data) => json.encode(data.toJson());

class JobIndustriesModel {
    List<JobIndustry> jobIndustries;

    JobIndustriesModel({
        required this.jobIndustries,
    });

    factory JobIndustriesModel.fromJson(Map<String, dynamic> json) => JobIndustriesModel(
        jobIndustries: List<JobIndustry>.from(json["jobIndustries"].map((x) => JobIndustry.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "jobIndustries": List<dynamic>.from(jobIndustries.map((x) => x.toJson())),
    };
}

class JobIndustry {
    int id;
    String name;

    JobIndustry({
        required this.id,
        required this.name,
    });

    factory JobIndustry.fromJson(Map<String, dynamic> json) => JobIndustry(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
