// To parse this JSON data, do
//
//     final shortlistedByYouModel = shortlistedByYouModelFromJson(jsonString);

import 'dart:convert';

ShortlistedByYouModel shortlistedByYouModelFromJson(String str) => ShortlistedByYouModel.fromJson(json.decode(str));

String shortlistedByYouModelToJson(ShortlistedByYouModel data) => json.encode(data.toJson());

class ShortlistedByYouModel {
    List<Match>? matches;
    int? offset;
    int? limit;
    int? count;

    ShortlistedByYouModel({
        this.matches,
        this.offset,
        this.limit,
        this.count,
    });

    factory ShortlistedByYouModel.fromJson(Map<String, dynamic> json) => ShortlistedByYouModel(
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
