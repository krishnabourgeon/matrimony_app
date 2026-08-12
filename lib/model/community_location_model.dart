// To parse this JSON data, do
//
//     final communityLocationModel = communityLocationModelFromJson(jsonString);

import 'dart:convert';

CommunityLocationModel communityLocationModelFromJson(String str) => CommunityLocationModel.fromJson(json.decode(str));

String communityLocationModelToJson(CommunityLocationModel data) => json.encode(data.toJson());

class CommunityLocationModel {
    String message;
    Data data;

    CommunityLocationModel({
        required this.message,
        required this.data,
    });

    factory CommunityLocationModel.fromJson(Map<String, dynamic> json) => CommunityLocationModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Location location;
    Religious religious;

    Data({
        required this.location,
        required this.religious,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        location: Location.fromJson(json["location"]),
        religious: Religious.fromJson(json["religious"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "religious": religious.toJson(),
    };
}

class Location {
    int customerId;
    int nativeCountryId;
    int nativeStateId;
    int nativeDistrictId;
    String nativeDescription;
    int permanentCountryId;
    int permanentStateId;
    int permanentDistrictId;
    String permanentAddress;
    String permanentPincode;
    int currentCountryId;
    int currentStateId;
    int currentDistrictId;
    String currentAddress;
    String currentPincode;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Location({
        required this.customerId,
        required this.nativeCountryId,
        required this.nativeStateId,
        required this.nativeDistrictId,
        required this.nativeDescription,
        required this.permanentCountryId,
        required this.permanentStateId,
        required this.permanentDistrictId,
        required this.permanentAddress,
        required this.permanentPincode,
        required this.currentCountryId,
        required this.currentStateId,
        required this.currentDistrictId,
        required this.currentAddress,
        required this.currentPincode,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        customerId: json["customer_id"],
        nativeCountryId: json["native_country_id"],
        nativeStateId: json["native_state_id"],
        nativeDistrictId: json["native_district_id"],
        nativeDescription: json["native_description"],
        permanentCountryId: json["permanent_country_id"],
        permanentStateId: json["permanent_state_id"],
        permanentDistrictId: json["permanent_district_id"],
        permanentAddress: json["permanent_address"],
        permanentPincode: json["permanent_pincode"],
        currentCountryId: json["current_country_id"],
        currentStateId: json["current_state_id"],
        currentDistrictId: json["current_district_id"],
        currentAddress: json["current_address"],
        currentPincode: json["current_pincode"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "native_country_id": nativeCountryId,
        "native_state_id": nativeStateId,
        "native_district_id": nativeDistrictId,
        "native_description": nativeDescription,
        "permanent_country_id": permanentCountryId,
        "permanent_state_id": permanentStateId,
        "permanent_district_id": permanentDistrictId,
        "permanent_address": permanentAddress,
        "permanent_pincode": permanentPincode,
        "current_country_id": currentCountryId,
        "current_state_id": currentStateId,
        "current_district_id": currentDistrictId,
        "current_address": currentAddress,
        "current_pincode": currentPincode,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}

class Religious {
    int id;
    int customerId;
    int motherTongueId;
    int religionId;
    String casteMatch;
    int casteId;
    int subCasteId;
    int gotraId;
    DateTime createdAt;
    DateTime updatedAt;

    Religious({
        required this.id,
        required this.customerId,
        required this.motherTongueId,
        required this.religionId,
        required this.casteMatch,
        required this.casteId,
        required this.subCasteId,
        required this.gotraId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Religious.fromJson(Map<String, dynamic> json) => Religious(
        id: json["id"],
        customerId: json["customer_id"],
        motherTongueId: json["mother_tongue_id"],
        religionId: json["religion_id"],
        casteMatch: json["caste_match"],
        casteId: json["caste_id"],
        subCasteId: json["sub_caste_id"],
        gotraId: json["gotra_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "mother_tongue_id": motherTongueId,
        "religion_id": religionId,
        "caste_match": casteMatch,
        "caste_id": casteId,
        "sub_caste_id": subCasteId,
        "gotra_id": gotraId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
