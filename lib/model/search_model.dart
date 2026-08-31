// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
    String? message;
    List<Search>? data;

    SearchModel({
        this.message,
        this.data,
    });

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        message: json["message"],
        data: json["data"] == null ? null : List<Search>.from(json["data"].map((x) => Search.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Search {
    int? id;
    String? name;
    int? age;
    String? height;
    String? profession;
    bool? verified;
    String? motherTongue;
    String? community;
    String? location;
    String? imageUrl;
    dynamic interestStatus;
    bool? alreadyConnected;
    bool? isShortlisted;

    Search({
        this.id,
        this.name,
        this.age,
        this.height,
        this.profession,
        this.verified,
        this.motherTongue,
        this.community,
        this.location,
        this.imageUrl,
        this.interestStatus,
        this.alreadyConnected,
        this.isShortlisted,
    });

    factory Search.fromJson(Map<String, dynamic> json) => Search(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        height: json["height"],
        profession: json["profession"],
        verified: json["verified"],
        motherTongue: json["mother_tongue"],
        community: json["community"],
        location: json["location"],
        imageUrl: json["image_url"],
        interestStatus: json["interest_status"],
        alreadyConnected: json["already_connected"],
        isShortlisted: json["is_shortlisted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "height": height,
        "profession": profession,
        "verified": verified,
        "mother_tongue": motherTongue,
        "community": community,
        "location": location,
        "image_url": imageUrl,
        "interest_status": interestStatus,
        "already_connected": alreadyConnected,
        "is_shortlisted": isShortlisted,
    };
}
