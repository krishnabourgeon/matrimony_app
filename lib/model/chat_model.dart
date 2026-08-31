// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
    List<RecentContact>? recentContacts;
    Threads? threads;

    ChatModel({
        this.recentContacts,
        this.threads,
    });

    factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        recentContacts: json["recent_contacts"] == null
            ? null
            : List<RecentContact>.from(json["recent_contacts"].map((x) => RecentContact.fromJson(x))),
        threads: json["threads"] == null ? null : Threads.fromJson(json["threads"]),
    );

    Map<String, dynamic> toJson() => {
        "recent_contacts": recentContacts == null ? null : List<dynamic>.from(recentContacts!.map((x) => x.toJson())),
        "threads": threads?.toJson(),
    };
}

class RecentContact {
    int? id;
    String? name;
    String? imageUrl;

    RecentContact({
        this.id,
        this.name,
        this.imageUrl,
    });

    factory RecentContact.fromJson(Map<String, dynamic> json) => RecentContact(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
    };
}

class Threads {
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

    Threads({
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

    factory Threads.fromJson(Map<String, dynamic> json) => Threads(
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
    bool? verified;
    String? imageUrl;
    String? lastMessage;
    DateTime? lastMessageAt;
    int? unreadCount;

    Datum({
        this.id,
        this.name,
        this.verified,
        this.imageUrl,
        this.lastMessage,
        this.lastMessageAt,
        this.unreadCount,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        verified: json["verified"],
        imageUrl: json["image_url"],
        lastMessage: json["last_message"],
        lastMessageAt: json["last_message_at"] == null ? null : DateTime.tryParse(json["last_message_at"]),
        unreadCount: json["unread_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "verified": verified,
        "image_url": imageUrl,
        "last_message": lastMessage,
        "last_message_at": lastMessageAt?.toIso8601String(),
        "unread_count": unreadCount,
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
