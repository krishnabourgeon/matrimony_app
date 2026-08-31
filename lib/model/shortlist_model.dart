// To parse this JSON data, do
//
//     final shortListModel = shortListModelFromJson(jsonString);

import 'dart:convert';

ShortListModel shortListModelFromJson(String str) => ShortListModel.fromJson(json.decode(str));

String shortListModelToJson(ShortListModel data) => json.encode(data.toJson());

class ShortListModel {
    bool? shortlisted;

    ShortListModel({
        this.shortlisted,
    });

    factory ShortListModel.fromJson(Map<String, dynamic> json) => ShortListModel(
        shortlisted: json["shortlisted"],
    );

    Map<String, dynamic> toJson() => {
        "shortlisted": shortlisted,
    };
}
