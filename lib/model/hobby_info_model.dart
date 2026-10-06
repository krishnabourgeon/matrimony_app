// // To parse this JSON data, do
// //
// //     final hobbyModel = hobbyModelFromJson(jsonString);

// import 'dart:convert';

// HobbyInfoModel hobbyInfoModelFromJson(String str) => HobbyInfoModel.fromJson(json.decode(str));

// String hobbyInfoModelToJson(HobbyInfoModel data) => json.encode(data.toJson());

// class HobbyInfoModel {
//     String? message;
//     Data? data;

//     HobbyInfoModel({
//         this.message,
//         this.data,
//     });

//     factory HobbyInfoModel.fromJson(Map<String, dynamic> json) => HobbyInfoModel(
//         message: json["message"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "message": message,
//         "data": data?.toJson(),
//     };
// }

// class Data {
//     List<String>? hobbies;
//     String? otherHobbies;

//     Data({
//         this.hobbies,
//         this.otherHobbies,
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         hobbies: json["hobbies"] == null ? null : List<String>.from(json["hobbies"].map((x) => x)),
//         otherHobbies: json["other_hobbies"],
//     );

//     Map<String, dynamic> toJson() => {
//         "hobbies": hobbies == null ? null : List<dynamic>.from(hobbies!.map((x) => x)),
//         "other_hobbies": otherHobbies,
//     };
// }



// To parse this JSON data, do
//
//     final hobbyInfoModel = hobbyInfoModelFromJson(jsonString);

import 'dart:convert';

HobbyInfoModel hobbyInfoModelFromJson(String str) => HobbyInfoModel.fromJson(json.decode(str));

String hobbyInfoModelToJson(HobbyInfoModel data) => json.encode(data.toJson());

class HobbyInfoModel {
    String? message;
    Data? data;

    HobbyInfoModel({
        this.message,
        this.data,
    });

    factory HobbyInfoModel.fromJson(Map<String, dynamic> json) => HobbyInfoModel(
        message: json["message"]?.toString(),
        data: json["data"] is Map<String, dynamic> ? Data.fromJson(json["data"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

// dob / other_hobbies can be null (e.g. {"other_hobbies": null}).
class Data {
    DateTime? dob;
    List<String> hobbies;
    String? otherHobbies;

    Data({
        this.dob,
        this.hobbies = const [],
        this.otherHobbies,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        dob: DateTime.tryParse(json["dob"]?.toString() ?? ''),
        hobbies: json["hobbies"] is List
            ? List<String>.from((json["hobbies"] as List).map((x) => x.toString()))
            : const [],
        otherHobbies: json["other_hobbies"]?.toString(),
    );

    Map<String, dynamic> toJson() => {
        "dob": dob == null ? null : "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "hobbies": List<dynamic>.from(hobbies.map((x) => x)),
        "other_hobbies": otherHobbies,
    };
}
