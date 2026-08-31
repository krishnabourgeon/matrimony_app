// To parse this JSON data, do
//
//     final shortlistedYouModel = shortlistedYouModelFromJson(jsonString);

import 'dart:convert';

ShortlistedYouModel shortlistedYouModelFromJson(String str) => ShortlistedYouModel.fromJson(json.decode(str));

String shortlistedYouModelToJson(ShortlistedYouModel data) => json.encode(data.toJson());

class ShortlistedYouModel {
    List<Match>? matches;
    int? offset;
    int? limit;
    int? count;

    ShortlistedYouModel({
        this.matches,
        this.offset,
        this.limit,
        this.count,
    });

    factory ShortlistedYouModel.fromJson(Map<String, dynamic> json) => ShortlistedYouModel(
        matches: json["matches"] == null ? null : List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
        offset: json["offset"],
        limit: json["limit"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "matches": matches == null ? null : List<dynamic>.from(matches!.map((x) => x.toJson())),
        "offset": offset,
        "limit": limit,
        "count": count,
    };
}

class Match {
    int? id;
    String? name;
    int? age;
    String? height;
    String? motherTongue;
    String? community;
    String? location;
    dynamic imageUrl;
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
