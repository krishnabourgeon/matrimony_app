// To parse this JSON data, do
//
//     final incomeModel = incomeModelFromJson(jsonString);

import 'dart:convert';

IncomeModel incomeModelFromJson(String str) => IncomeModel.fromJson(json.decode(str));

String incomeModelToJson(IncomeModel data) => json.encode(data.toJson());

class IncomeModel {
    List<Income> incomes;

    IncomeModel({
        required this.incomes,
    });

    factory IncomeModel.fromJson(Map<String, dynamic> json) => IncomeModel(
        incomes: List<Income>.from(json["incomes"].map((x) => Income.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "incomes": List<dynamic>.from(incomes.map((x) => x.toJson())),
    };
}

class Income {
    int id;
    String name;
    String valueFrom;
    String valueTo;

    Income({
        required this.id,
        required this.name,
        required this.valueFrom,
        required this.valueTo,
    });

    factory Income.fromJson(Map<String, dynamic> json) => Income(
        id: json["id"],
        name: json["name"],
        valueFrom: json["value_from"],
        valueTo: json["value_to"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value_from": valueFrom,
        "value_to": valueTo,
    };

    @override
    bool operator ==(Object other) =>
        identical(this, other) || (other is Income && other.id == id);

    @override
    int get hashCode => id.hashCode;
}
