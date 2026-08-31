// To parse this JSON data, do
//
//     final requestSendModel = requestSendModelFromJson(jsonString);

import 'dart:convert';

RequestSendModel requestSendModelFromJson(String str) => RequestSendModel.fromJson(json.decode(str));

String requestSendModelToJson(RequestSendModel data) => json.encode(data.toJson());

class RequestSendModel {
    int? currentPage;
    List<Datum>? data;
    String? firstPageUrl;
    int? from;
    int? lastPage;
    String? lastPageUrl;
    List<Link>? links;
    dynamic nextPageUrl;
    String? path;
    int? perPage;
    dynamic prevPageUrl;
    int? to;
    int? total;

    RequestSendModel({
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    factory RequestSendModel.fromJson(Map<String, dynamic> json) => RequestSendModel(
        currentPage: json["current_page"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null ? null : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null ? null : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Datum {
    int? id;
    String? name;
    int? age;
    String? height;
    String? occupation;
    dynamic motherTongue;
    dynamic community;
    String? location;
    String? imageUrl;
    bool? verified;
    int? requestId;
    int? requestStatus;
    String? requestType;

    Datum({
        this.id,
        this.name,
        this.age,
        this.height,
        this.occupation,
        this.motherTongue,
        this.community,
        this.location,
        this.imageUrl,
        this.verified,
        this.requestId,
        this.requestStatus,
        this.requestType,
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
        requestId: json["request_id"],
        requestStatus: json["request_status"],
        requestType: json["request_type"],
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
        "request_id": requestId,
        "request_status": requestStatus,
        "request_type": requestType,
    };
}

class Link {
    String? url;
    String? label;
    bool? active;

    Link({
        this.url,
        this.label,
        this.active,
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
