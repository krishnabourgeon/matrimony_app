// To parse this JSON data, do
//
//     final familyModel = familyModelFromJson(jsonString);

import 'dart:convert';

FamilyModel familyModelFromJson(String str) => FamilyModel.fromJson(json.decode(str));

String familyModelToJson(FamilyModel data) => json.encode(data.toJson());

class FamilyModel {
    String? message;
    Data? data;

    FamilyModel({
        this.message,
        this.data,
    });

    factory FamilyModel.fromJson(Map<String, dynamic> json) => FamilyModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    Family? family;
    String? mobile2;
    int? mobile2Whatsapp;

    Data({
        this.family,
        this.mobile2,
        this.mobile2Whatsapp,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        family: json["family"] == null ? null : Family.fromJson(json["family"]),
        mobile2: json["mobile_2"],
        mobile2Whatsapp: json["mobile_2_whatsapp"],
    );

    Map<String, dynamic> toJson() => {
        "family": family?.toJson(),
        "mobile_2": mobile2,
        "mobile_2_whatsapp": mobile2Whatsapp,
    };
}

class Family {
    int? customerId;
    int? familyTypeId;
    int? familyStatusId;
    int? familyValueId;
    int? membersCount;
    int? brotherCount;
    int? sisterCount;
    int? brotherMarriedCount;
    int? sisterMarriedCount;
    int? fatherJobId;
    int? motherJobId;
    int? familyPropertyValueId;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    Family({
        this.customerId,
        this.familyTypeId,
        this.familyStatusId,
        this.familyValueId,
        this.membersCount,
        this.brotherCount,
        this.sisterCount,
        this.brotherMarriedCount,
        this.sisterMarriedCount,
        this.fatherJobId,
        this.motherJobId,
        this.familyPropertyValueId,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Family.fromJson(Map<String, dynamic> json) => Family(
        customerId: json["customer_id"],
        familyTypeId: json["family_type_id"],
        familyStatusId: json["family_status_id"],
        familyValueId: json["family_value_id"],
        membersCount: json["members_count"],
        brotherCount: json["brother_count"],
        sisterCount: json["sister_count"],
        brotherMarriedCount: json["brother_married_count"],
        sisterMarriedCount: json["sister_married_count"],
        fatherJobId: json["father_job_id"],
        motherJobId: json["mother_job_id"],
        familyPropertyValueId: json["family_property_value_id"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "family_type_id": familyTypeId,
        "family_status_id": familyStatusId,
        "family_value_id": familyValueId,
        "members_count": membersCount,
        "brother_count": brotherCount,
        "sister_count": sisterCount,
        "brother_married_count": brotherMarriedCount,
        "sister_married_count": sisterMarriedCount,
        "father_job_id": fatherJobId,
        "mother_job_id": motherJobId,
        "family_property_value_id": familyPropertyValueId,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
