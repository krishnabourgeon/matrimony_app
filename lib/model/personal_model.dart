// To parse this JSON data, do
//
//     final personalModel = personalModelFromJson(jsonString);

import 'dart:convert';

PersonalModel personalModelFromJson(String str) => PersonalModel.fromJson(json.decode(str));

String personalModelToJson(PersonalModel data) => json.encode(data.toJson());

class PersonalModel {
    String message;
    Data data;

    PersonalModel({
        required this.message,
        required this.data,
    });

    factory PersonalModel.fromJson(Map<String, dynamic> json) => PersonalModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    int customerId;
    dynamic about;
    DateTime dob;
    int genderId;
    String languages;
    int maritalStatusId;
    int childCount;
    int disabilityStatus;
    dynamic disabilityDesc;
    int majorSurgery;
    int height;
    int weight;
    int skinTypeId;
    dynamic foodTypeId;
    int bodyTypeId;
    int bloodGroupId;
    int dietId;
    List<dynamic> hobbies;
    dynamic otherHobbies;
    int drinkingHabitId;
    int smokingHabitId;
    int havePet;
    int showImage;
    int basicStatus;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.customerId,
        required this.about,
        required this.dob,
        required this.genderId,
        required this.languages,
        required this.maritalStatusId,
        required this.childCount,
        required this.disabilityStatus,
        required this.disabilityDesc,
        required this.majorSurgery,
        required this.height,
        required this.weight,
        required this.skinTypeId,
        required this.foodTypeId,
        required this.bodyTypeId,
        required this.bloodGroupId,
        required this.dietId,
        required this.hobbies,
        required this.otherHobbies,
        required this.drinkingHabitId,
        required this.smokingHabitId,
        required this.havePet,
        required this.showImage,
        required this.basicStatus,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        customerId: json["customer_id"],
        about: json["about"],
        dob: DateTime.parse(json["dob"]),
        genderId: json["gender_id"],
        languages: json["languages"],
        maritalStatusId: json["marital_status_id"],
        childCount: json["child_count"],
        disabilityStatus: json["disability_status"],
        disabilityDesc: json["disability_desc"],
        majorSurgery: json["major_surgery"],
        height: json["height"],
        weight: json["weight"],
        skinTypeId: json["skin_type_id"],
        foodTypeId: json["food_type_id"],
        bodyTypeId: json["body_type_id"],
        bloodGroupId: json["blood_group_id"],
        dietId: json["diet_id"],
        hobbies: List<dynamic>.from(json["hobbies"].map((x) => x)),
        otherHobbies: json["other_hobbies"],
        drinkingHabitId: json["drinking_habit_id"],
        smokingHabitId: json["smoking_habit_id"],
        havePet: json["have_pet"],
        showImage: json["show_image"],
        basicStatus: json["basic_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "about": about,
        "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "gender_id": genderId,
        "languages": languages,
        "marital_status_id": maritalStatusId,
        "child_count": childCount,
        "disability_status": disabilityStatus,
        "disability_desc": disabilityDesc,
        "major_surgery": majorSurgery,
        "height": height,
        "weight": weight,
        "skin_type_id": skinTypeId,
        "food_type_id": foodTypeId,
        "body_type_id": bodyTypeId,
        "blood_group_id": bloodGroupId,
        "diet_id": dietId,
        "hobbies": List<dynamic>.from(hobbies.map((x) => x)),
        "other_hobbies": otherHobbies,
        "drinking_habit_id": drinkingHabitId,
        "smoking_habit_id": smokingHabitId,
        "have_pet": havePet,
        "show_image": showImage,
        "basic_status": basicStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
