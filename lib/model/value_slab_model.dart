// To parse this JSON data, do
//
//     final valueSlabModel = valueSlabModelFromJson(jsonString);

import 'dart:convert';

ValueSlabModel valueSlabModelFromJson(String str) => ValueSlabModel.fromJson(json.decode(str));

String valueSlabModelToJson(ValueSlabModel data) => json.encode(data.toJson());

class ValueSlabModel {
    List<ValueSlab> valueSlabs;

    ValueSlabModel({
        required this.valueSlabs,
    });

    factory ValueSlabModel.fromJson(Map<String, dynamic> json) => ValueSlabModel(
        valueSlabs: List<ValueSlab>.from(json["valueSlabs"].map((x) => ValueSlab.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "valueSlabs": List<dynamic>.from(valueSlabs.map((x) => x.toJson())),
    };
}

class ValueSlab {
    int id;
    String name;
    String valueFrom;
    String valueTo;

    ValueSlab({
        required this.id,
        required this.name,
        required this.valueFrom,
        required this.valueTo,
    });

    factory ValueSlab.fromJson(Map<String, dynamic> json) => ValueSlab(
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
        identical(this, other) || (other is ValueSlab && other.id == id);

    @override
    int get hashCode => id.hashCode;
}
