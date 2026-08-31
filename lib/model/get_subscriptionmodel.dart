// To parse this JSON data, do
//
//     final getSubscriptionModel = getSubscriptionModelFromJson(jsonString);

import 'dart:convert';

GetSubscriptionModel getSubscriptionModelFromJson(String str) => GetSubscriptionModel.fromJson(json.decode(str));

String getSubscriptionModelToJson(GetSubscriptionModel data) => json.encode(data.toJson());

class GetSubscriptionModel {
    bool? success;
    String? message;
    List<Subscription>? subscriptions;

    GetSubscriptionModel({
        this.success,
        this.message,
        this.subscriptions,
    });

    factory GetSubscriptionModel.fromJson(Map<String, dynamic> json) => GetSubscriptionModel(
        success: json["success"],
        message: json["message"],
        subscriptions: json["subscriptions"] == null
            ? null
            : List<Subscription>.from(json["subscriptions"].map((x) => Subscription.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "subscriptions": subscriptions == null ? null : List<dynamic>.from(subscriptions!.map((x) => x.toJson())),
    };
}

class Subscription {
    int? id;
    String? name;
    String? description;
    String? rate;
    int? contact;
    int? chat;
    int? interest;
    int? profileView;
    int? validity;
    int? level;
    int? status;
    dynamic contactViewLimit;
    dynamic requestLimit;
    DateTime? createdAt;
    DateTime? updatedAt;

    Subscription({
        this.id,
        this.name,
        this.description,
        this.rate,
        this.contact,
        this.chat,
        this.interest,
        this.profileView,
        this.validity,
        this.level,
        this.status,
        this.contactViewLimit,
        this.requestLimit,
        this.createdAt,
        this.updatedAt,
    });

    factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        rate: json["rate"]?.toString(),
        contact: json["contact"],
        chat: json["chat"],
        interest: json["interest"],
        profileView: json["profile_view"],
        validity: json["validity"],
        level: json["level"],
        status: json["status"],
        contactViewLimit: json["contact_view_limit"],
        requestLimit: json["request_limit"],
        createdAt: json["created_at"] == null ? null : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.tryParse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "rate": rate,
        "contact": contact,
        "chat": chat,
        "interest": interest,
        "profile_view": profileView,
        "validity": validity,
        "level": level,
        "status": status,
        "contact_view_limit": contactViewLimit,
        "request_limit": requestLimit,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
