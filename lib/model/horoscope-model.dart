// To parse this JSON data, do
//
//     final horoscopeModel = horoscopeModelFromJson(jsonString);

import 'dart:convert';

HoroscopeModel horoscopeModelFromJson(String str) => HoroscopeModel.fromJson(json.decode(str));

String horoscopeModelToJson(HoroscopeModel data) => json.encode(data.toJson());

class HoroscopeModel {
    String message;
    Data data;

    HoroscopeModel({
        required this.message,
        required this.data,
    });

    factory HoroscopeModel.fromJson(Map<String, dynamic> json) => HoroscopeModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int customerId;
    DateTime dobHoroscope;
    String birthTime;
    String birthPlace;
    int starId;
    int isSudhaJathakam;
    int isDoshaJathakam;
    int show;
    int starMatch;
    int matchTypeId;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Data({
        required this.customerId,
        required this.dobHoroscope,
        required this.birthTime,
        required this.birthPlace,
        required this.starId,
        required this.isSudhaJathakam,
        required this.isDoshaJathakam,
        required this.show,
        required this.starMatch,
        required this.matchTypeId,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        customerId: json["customer_id"],
        dobHoroscope: DateTime.parse(json["dob_horoscope"]),
        birthTime: json["birth_time"],
        birthPlace: json["birth_place"],
        starId: json["star_id"],
        isSudhaJathakam: json["is_sudha_jathakam"],
        isDoshaJathakam: json["is_dosha_jathakam"],
        show: json["show"],
        starMatch: json["star_match"],
        matchTypeId: json["match_type_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "dob_horoscope": "${dobHoroscope.year.toString().padLeft(4, '0')}-${dobHoroscope.month.toString().padLeft(2, '0')}-${dobHoroscope.day.toString().padLeft(2, '0')}",
        "birth_time": birthTime,
        "birth_place": birthPlace,
        "star_id": starId,
        "is_sudha_jathakam": isSudhaJathakam,
        "is_dosha_jathakam": isDoshaJathakam,
        "show": show,
        "star_match": starMatch,
        "match_type_id": matchTypeId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
