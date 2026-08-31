// To parse this JSON data, do
//
//     final searchBody = searchBodyFromJson(jsonString);

import 'dart:convert';

SearchBody searchBodyFromJson(String str) => SearchBody.fromJson(json.decode(str));

String searchBodyToJson(SearchBody data) => json.encode(data.toJson());

// All fields are nullable and optional — the backend appears to treat an
// explicitly-present field (even 0/false/"") as an active filter, not as
// "no filter". So toJson() only includes the fields that were actually set,
// matching what a hand-built Postman request with just a couple of fields
// would send, instead of always sending the full ~38-field shape with 0s.
class SearchBody {
    int? ageFrom;
    int? ageTo;
    int? heightFrom;
    int? heightTo;
    int? weightFrom;
    int? weightTo;
    int? maritalStatusId;
    int? disabilityStatus;
    int? motherTongueId;
    int? majorSurgery;
    int? educationId;
    int? religionId;
    int? casteId;
    int? subCasteId;
    int? gotraId;
    int? familyTypeId;
    int? familyStatusId;
    int? bodyTypeId;
    int? skinTypeId;
    int? foodTypeId;
    int? drinkingHabitId;
    int? smokingHabitId;
    int? countryId;
    int? stateId;
    int? districtId;
    int? jobIndustryId;
    int? occupationId;
    int? salaryId;
    int? familyPropertyId;
    bool? withOpenPhoto;
    String? languageId;
    bool? withHoroscope;
    bool? withStar;
    bool? withSudhaJathakam;
    bool? withDoshaJathakam;
    String? profileCreated;
    bool? withPhoto;
    int? createdFor;
    String? sortBy;
    bool? saveSearch;

    SearchBody({
        this.ageFrom,
        this.ageTo,
        this.heightFrom,
        this.heightTo,
        this.weightFrom,
        this.weightTo,
        this.maritalStatusId,
        this.disabilityStatus,
        this.motherTongueId,
        this.majorSurgery,
        this.educationId,
        this.religionId,
        this.casteId,
        this.subCasteId,
        this.gotraId,
        this.familyTypeId,
        this.familyStatusId,
        this.bodyTypeId,
        this.skinTypeId,
        this.foodTypeId,
        this.drinkingHabitId,
        this.smokingHabitId,
        this.countryId,
        this.stateId,
        this.districtId,
        this.jobIndustryId,
        this.occupationId,
        this.salaryId,
        this.familyPropertyId,
        this.withOpenPhoto,
        this.languageId,
        this.withHoroscope,
        this.withStar,
        this.withSudhaJathakam,
        this.withDoshaJathakam,
        this.profileCreated,
        this.withPhoto,
        this.createdFor,
        this.sortBy,
        this.saveSearch,
    });

    factory SearchBody.fromJson(Map<String, dynamic> json) => SearchBody(
        ageFrom: json["age_from"],
        ageTo: json["age_to"],
        heightFrom: json["height_from"],
        heightTo: json["height_to"],
        weightFrom: json["weight_from"],
        weightTo: json["weight_to"],
        maritalStatusId: json["marital_status_id"],
        disabilityStatus: json["disability_status"],
        motherTongueId: json["mother_tongue_id"],
        majorSurgery: json["major_surgery"],
        educationId: json["education_id"],
        religionId: json["religion_id"],
        casteId: json["caste_id"],
        subCasteId: json["sub_caste_id"],
        gotraId: json["gotra_id"],
        familyTypeId: json["family_type_id"],
        familyStatusId: json["family_status_id"],
        bodyTypeId: json["body_type_id"],
        skinTypeId: json["skin_type_id"],
        foodTypeId: json["food_type_id"],
        drinkingHabitId: json["drinking_habit_id"],
        smokingHabitId: json["smoking_habit_id"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        districtId: json["district_id"],
        jobIndustryId: json["job_industry_id"],
        occupationId: json["occupation_id"],
        salaryId: json["salary_id"],
        familyPropertyId: json["family_property_id"],
        withOpenPhoto: json["with_open_photo"],
        languageId: json["language_id"],
        withHoroscope: json["with_horoscope"],
        withStar: json["with_star"],
        withSudhaJathakam: json["with_sudha_jathakam"],
        withDoshaJathakam: json["with_dosha_jathakam"],
        profileCreated: json["profile_created"],
        withPhoto: json["with_photo"],
        createdFor: json["created_for"],
        sortBy: json["sort_by"],
        saveSearch: json["save_search"],
    );

    Map<String, dynamic> toJson() {
        final map = <String, dynamic>{
            "age_from": ageFrom,
            "age_to": ageTo,
            "height_from": heightFrom,
            "height_to": heightTo,
            "weight_from": weightFrom,
            "weight_to": weightTo,
            "marital_status_id": maritalStatusId,
            "disability_status": disabilityStatus,
            "mother_tongue_id": motherTongueId,
            "major_surgery": majorSurgery,
            "education_id": educationId,
            "religion_id": religionId,
            "caste_id": casteId,
            "sub_caste_id": subCasteId,
            "gotra_id": gotraId,
            "family_type_id": familyTypeId,
            "family_status_id": familyStatusId,
            "body_type_id": bodyTypeId,
            "skin_type_id": skinTypeId,
            "food_type_id": foodTypeId,
            "drinking_habit_id": drinkingHabitId,
            "smoking_habit_id": smokingHabitId,
            "country_id": countryId,
            "state_id": stateId,
            "district_id": districtId,
            "job_industry_id": jobIndustryId,
            "occupation_id": occupationId,
            "salary_id": salaryId,
            "family_property_id": familyPropertyId,
            "with_open_photo": withOpenPhoto,
            "language_id": languageId,
            "with_horoscope": withHoroscope,
            "with_star": withStar,
            "with_sudha_jathakam": withSudhaJathakam,
            "with_dosha_jathakam": withDoshaJathakam,
            "profile_created": profileCreated,
            "with_photo": withPhoto,
            "created_for": createdFor,
            "sort_by": sortBy,
            "save_search": saveSearch,
        };
        map.removeWhere((key, value) => value == null);
        return map;
    }
}
