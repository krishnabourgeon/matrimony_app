// To parse this JSON data, do
//
//     final imageTypesModel = imageTypesModelFromJson(jsonString);

import 'dart:convert';

ImageTypesModel imageTypesModelFromJson(String str) => ImageTypesModel.fromJson(json.decode(str));

String imageTypesModelToJson(ImageTypesModel data) => json.encode(data.toJson());

class ImageTypesModel {
    List<ImageType> imageTypes;

    ImageTypesModel({
        required this.imageTypes,
    });

    factory ImageTypesModel.fromJson(Map<String, dynamic> json) => ImageTypesModel(
        imageTypes: List<ImageType>.from(json["imageTypes"].map((x) => ImageType.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "imageTypes": List<dynamic>.from(imageTypes.map((x) => x.toJson())),
    };
}

class ImageType {
    int id;
    String name;

    ImageType({
        required this.id,
        required this.name,
    });

    factory ImageType.fromJson(Map<String, dynamic> json) => ImageType(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };

    @override
    bool operator ==(Object other) =>
        identical(this, other) || (other is ImageType && other.id == id);

    @override
    int get hashCode => id.hashCode;
}
