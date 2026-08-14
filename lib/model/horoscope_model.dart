// To parse this JSON data, do
//
//     final horoscopeModel = horoscopeModelFromJson(jsonString);

import 'dart:convert';

HoroscopeModel horoscopeModelFromJson(String str) => HoroscopeModel.fromJson(json.decode(str));

String horoscopeModelToJson(HoroscopeModel data) => json.encode(data.toJson());

class HoroscopeModel {
    String? message;
    Data? data;

    HoroscopeModel({
        this.message,
        this.data,
    });

    factory HoroscopeModel.fromJson(Map<String, dynamic> json) => HoroscopeModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    int? customerId;
    DateTime? dobHoroscope;
    String? birthTime;
    String? birthPlace;
    int? starId;
    int? isSudhaJathakam;
    int? isDoshaJathakam;
    int? show;
    // The request sends star_match as a string, but the response may echo it
    // back as a different type — keep this loosely typed to avoid a parse
    // crash if the shapes don't match.
    dynamic starMatch;
    int? matchTypeId;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    Data({
        this.customerId,
        this.dobHoroscope,
        this.birthTime,
        this.birthPlace,
        this.starId,
        this.isSudhaJathakam,
        this.isDoshaJathakam,
        this.show,
        this.starMatch,
        this.matchTypeId,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        customerId: json["customer_id"],
        dobHoroscope: json["dob_horoscope"] == null ? null : DateTime.tryParse(json["dob_horoscope"]),
        birthTime: json["birth_time"],
        birthPlace: json["birth_place"],
        starId: json["star_id"],
        isSudhaJathakam: json["is_sudha_jathakam"],
        isDoshaJathakam: json["is_dosha_jathakam"],
        show: json["show"],
        starMatch: json["star_match"],
        matchTypeId: json["match_type_id"],
        updatedAt: json["updated_at"] == null ? null : DateTime.tryParse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.tryParse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "dob_horoscope": dobHoroscope == null
            ? null
            : "${dobHoroscope!.year.toString().padLeft(4, '0')}-${dobHoroscope!.month.toString().padLeft(2, '0')}-${dobHoroscope!.day.toString().padLeft(2, '0')}",
        "birth_time": birthTime,
        "birth_place": birthPlace,
        "star_id": starId,
        "is_sudha_jathakam": isSudhaJathakam,
        "is_dosha_jathakam": isDoshaJathakam,
        "show": show,
        "star_match": starMatch,
        "match_type_id": matchTypeId,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
