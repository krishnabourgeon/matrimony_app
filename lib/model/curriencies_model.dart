// To parse this JSON data, do
//
//     final currenciesModel = currenciesModelFromJson(jsonString);

import 'dart:convert';

CurrenciesModel currenciesModelFromJson(String str) => CurrenciesModel.fromJson(json.decode(str));

String currenciesModelToJson(CurrenciesModel data) => json.encode(data.toJson());

class CurrenciesModel {
    List<Currency> currencies;

    CurrenciesModel({
        required this.currencies,
    });

    factory CurrenciesModel.fromJson(Map<String, dynamic> json) => CurrenciesModel(
        currencies: List<Currency>.from(json["currencies"].map((x) => Currency.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
    };
}

class Currency {
    int id;
    String name;
    int status;
    DateTime createdAt;
    DateTime updatedAt;

    Currency({
        required this.id,
        required this.name,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };

    @override
    bool operator ==(Object other) =>
        identical(this, other) || (other is Currency && other.id == id);

    @override
    int get hashCode => id.hashCode;
}
