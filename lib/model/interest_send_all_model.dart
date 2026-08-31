// To parse this JSON data, do
//
//     final interestSentAllModel = interestSentAllModelFromJson(jsonString);

import 'dart:convert';

InterestSentAllModel interestSentAllModelFromJson(String str) => InterestSentAllModel.fromJson(json.decode(str));

String interestSentAllModelToJson(InterestSentAllModel data) => json.encode(data.toJson());

class InterestSentAllModel {
    int currentPage;
    List<Datum> data;
    String firstPageUrl;
    int from;
    int lastPage;
    String lastPageUrl;
    List<Link> links;
    dynamic nextPageUrl;
    String path;
    int perPage;
    dynamic prevPageUrl;
    int to;
    int total;

    InterestSentAllModel({
        required this.currentPage,
        required this.data,
        required this.firstPageUrl,
        required this.from,
        required this.lastPage,
        required this.lastPageUrl,
        required this.links,
        required this.nextPageUrl,
        required this.path,
        required this.perPage,
        required this.prevPageUrl,
        required this.to,
        required this.total,
    });

    factory InterestSentAllModel.fromJson(Map<String, dynamic> json) => InterestSentAllModel(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Datum {
    int id;
    String name;
    int age;
    String height;
    String occupation;
    String motherTongue;
    dynamic community;
    String location;
    String imageUrl;
    bool verified;
    int interestId;
    int interestStatus;

    Datum({
        required this.id,
        required this.name,
        required this.age,
        required this.height,
        required this.occupation,
        required this.motherTongue,
        required this.community,
        required this.location,
        required this.imageUrl,
        required this.verified,
        required this.interestId,
        required this.interestStatus,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        height: json["height"],
        occupation: json["occupation"],
        motherTongue: json["mother_tongue"],
        community: json["community"],
        location: json["location"],
        imageUrl: json["image_url"],
        verified: json["verified"],
        interestId: json["interest_id"],
        interestStatus: json["interest_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "height": height,
        "occupation": occupation,
        "mother_tongue": motherTongue,
        "community": community,
        "location": location,
        "image_url": imageUrl,
        "verified": verified,
        "interest_id": interestId,
        "interest_status": interestStatus,
    };
}

class Link {
    String? url;
    String label;
    bool active;

    Link({
        required this.url,
        required this.label,
        required this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
