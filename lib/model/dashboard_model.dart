// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
    String? greeting;
    ProfileCompletion? profileCompletion;
    Stats? stats;
    Notifications? notifications;
    Subscription? subscription;
    List<DailyMatch>? dailyMatches;
    List<DailyMatch>? newMatches;
    List<DailyMatch>? premiumMatches;
    List<DailyMatch>? recentVisited;

    DashboardModel({
        this.greeting,
        this.profileCompletion,
        this.stats,
        this.notifications,
        this.subscription,
        this.dailyMatches,
        this.newMatches,
        this.premiumMatches,
        this.recentVisited,
    });

    factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        greeting: json["greeting"],
        profileCompletion: json["profile_completion"] == null
            ? null
            : ProfileCompletion.fromJson(json["profile_completion"]),
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
        notifications: json["notifications"] == null ? null : Notifications.fromJson(json["notifications"]),
        subscription: json["subscription"] == null ? null : Subscription.fromJson(json["subscription"]),
        dailyMatches: json["daily_matches"] == null
            ? null
            : List<DailyMatch>.from(json["daily_matches"].map((x) => DailyMatch.fromJson(x))),
        newMatches: json["new_matches"] == null
            ? null
            : List<DailyMatch>.from(json["new_matches"].map((x) => DailyMatch.fromJson(x))),
        premiumMatches: json["premium_matches"] == null
            ? null
            : List<DailyMatch>.from(json["premium_matches"].map((x) => DailyMatch.fromJson(x))),
        recentVisited: json["recent_visited"] == null
            ? null
            : List<DailyMatch>.from(json["recent_visited"].map((x) => DailyMatch.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "greeting": greeting,
        "profile_completion": profileCompletion?.toJson(),
        "stats": stats?.toJson(),
        "notifications": notifications?.toJson(),
        "subscription": subscription?.toJson(),
        "daily_matches": dailyMatches == null ? null : List<dynamic>.from(dailyMatches!.map((x) => x.toJson())),
        "new_matches": newMatches == null ? null : List<dynamic>.from(newMatches!.map((x) => x.toJson())),
        "premium_matches":
            premiumMatches == null ? null : List<dynamic>.from(premiumMatches!.map((x) => x.toJson())),
        "recent_visited": recentVisited == null ? null : List<dynamic>.from(recentVisited!.map((x) => x.toJson())),
    };
}

class DailyMatch {
    int? id;
    String? name;
    int? age;
    String? height;
    // The real backend can send any mother tongue / location string, not
    // just the one sample this file was originally generated from — kept as
    // plain strings instead of a 1-2-value enum so unexpected values don't
    // crash the parse.
    String? motherTongue;
    String? community;
    String? location;
    String? imageUrl;
    dynamic interestStatus;
    bool? alreadyConnected;

    DailyMatch({
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

    factory DailyMatch.fromJson(Map<String, dynamic> json) => DailyMatch(
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

class Notifications {
    int? unreadCount;

    Notifications({
        this.unreadCount,
    });

    factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        unreadCount: json["unread_count"],
    );

    Map<String, dynamic> toJson() => {
        "unread_count": unreadCount,
    };
}

class ProfileCompletion {
    int? percentage;
    List<String>? incompleteSections;

    ProfileCompletion({
        this.percentage,
        this.incompleteSections,
    });

    factory ProfileCompletion.fromJson(Map<String, dynamic> json) => ProfileCompletion(
        percentage: json["percentage"],
        incompleteSections: json["incomplete_sections"] == null
            ? null
            : List<String>.from(json["incomplete_sections"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "percentage": percentage,
        "incomplete_sections":
            incompleteSections == null ? null : List<dynamic>.from(incompleteSections!.map((x) => x)),
    };
}

class Stats {
    int? interestReceived;
    int? interestAccepted;
    int? contactsViewed;

    Stats({
        this.interestReceived,
        this.interestAccepted,
        this.contactsViewed,
    });

    factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        interestReceived: json["interest_received"],
        interestAccepted: json["interest_accepted"],
        contactsViewed: json["contacts_viewed"],
    );

    Map<String, dynamic> toJson() => {
        "interest_received": interestReceived,
        "interest_accepted": interestAccepted,
        "contacts_viewed": contactsViewed,
    };
}

class Subscription {
    bool? isPremium;
    dynamic planName;

    Subscription({
        this.isPremium,
        this.planName,
    });

    factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        isPremium: json["is_premium"],
        planName: json["plan_name"],
    );

    Map<String, dynamic> toJson() => {
        "is_premium": isPremium,
        "plan_name": planName,
    };
}
