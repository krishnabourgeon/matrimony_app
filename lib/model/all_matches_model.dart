// To parse this JSON data, do
//
// final allMatchesModel = allMatchesModelFromJson(jsonString);

import 'dart:convert';

AllMatchesModel allMatchesModelFromJson(String str) =>
    AllMatchesModel.fromJson(json.decode(str));

String allMatchesModelToJson(AllMatchesModel data) =>
    json.encode(data.toJson());

class AllMatchesModel {
  List<Match>? matches;
  int? total;
  int? offset;
  int? limit;

  AllMatchesModel({
    this.matches,
    this.total,
    this.offset,
    this.limit,
  });

  factory AllMatchesModel.fromJson(Map<String, dynamic> json) =>
      AllMatchesModel(
        matches: json["matches"] == null
            ? null
            : List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
        total: json["total"],
        offset: json["offset"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "matches": matches == null
            ? null
            : List<dynamic>.from(matches!.map((x) => x.toJson())),
        "total": total,
        "offset": offset,
        "limit": limit,
      };
}

class Match {
  int? id;
  String? name;
  int? age;
  String? height;
  String? motherTongue;
  dynamic community;
  String? location;
  String? imageUrl;
  dynamic interestStatus;
  bool? alreadyConnected;

  Match({
    this.id,
    this.name,
    this.age,
    this.height,
    this.motherTongue,
    this.community,
    this.location,
    this.imageUrl,
    this.interestStatus,
    this.alreadyConnected,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        height: json["height"],
        motherTongue: json["mother_tongue"],
        community: json["community"],
        location: json["location"],
        imageUrl: json["image_url"],
        interestStatus: json["interest_status"],
        alreadyConnected: json["already_connected"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "height": height,
        "mother_tongue": motherTongue,
        "community": community,
        "location": location,
        "image_url": imageUrl,
        "interest_status": interestStatus,
        "already_connected": alreadyConnected,
      };
}
