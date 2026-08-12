// To parse this JSON data, do
//
//     final professionalModel = professionalModelFromJson(jsonString);

import 'dart:convert';

ProfessionalModel professionalModelFromJson(String str) => ProfessionalModel.fromJson(json.decode(str));

String professionalModelToJson(ProfessionalModel data) => json.encode(data.toJson());

class ProfessionalModel {
    String message;
    Data data;

    ProfessionalModel({
        required this.message,
        required this.data,
    });

    factory ProfessionalModel.fromJson(Map<String, dynamic> json) => ProfessionalModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Professional professional;
    List<int> languages;

    Data({
        required this.professional,
        required this.languages,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        professional: Professional.fromJson(json["professional"]),
        languages: List<int>.from(json["languages"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "professional": professional.toJson(),
        "languages": List<dynamic>.from(languages.map((x) => x)),
    };
}

class Professional {
    int customerId;
    int highestEducationId;
    String educationDesc;
    int jobIndustryId;
    int occupationId;
    int workingCountryId;
    int workingStateId;
    int workingDistrictId;
    int residentialStatusId;
    int currencyId;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Professional({
        required this.customerId,
        required this.highestEducationId,
        required this.educationDesc,
        required this.jobIndustryId,
        required this.occupationId,
        required this.workingCountryId,
        required this.workingStateId,
        required this.workingDistrictId,
        required this.residentialStatusId,
        required this.currencyId,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Professional.fromJson(Map<String, dynamic> json) => Professional(
        customerId: json["customer_id"],
        highestEducationId: json["highest_education_id"],
        educationDesc: json["education_desc"],
        jobIndustryId: json["job_industry_id"],
        occupationId: json["occupation_id"],
        workingCountryId: json["working_country_id"],
        workingStateId: json["working_state_id"],
        workingDistrictId: json["working_district_id"],
        residentialStatusId: json["residential_status_id"],
        currencyId: json["currency_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "highest_education_id": highestEducationId,
        "education_desc": educationDesc,
        "job_industry_id": jobIndustryId,
        "occupation_id": occupationId,
        "working_country_id": workingCountryId,
        "working_state_id": workingStateId,
        "working_district_id": workingDistrictId,
        "residential_status_id": residentialStatusId,
        "currency_id": currencyId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
