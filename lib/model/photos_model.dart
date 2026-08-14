// To parse this JSON data, do
//
//     final photosModel = photosModelFromJson(jsonString);

import 'dart:convert';

PhotosModel photosModelFromJson(String str) => PhotosModel.fromJson(json.decode(str));

String photosModelToJson(PhotosModel data) => json.encode(data.toJson());

class PhotosModel {
    String? message;
    Data? data;

    PhotosModel({
        this.message,
        this.data,
    });

    factory PhotosModel.fromJson(Map<String, dynamic> json) => PhotosModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    List<PhotoImage>? images;

    Data({
        this.images,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        images: json["images"] == null
            ? null
            : List<PhotoImage>.from(json["images"].map((x) => PhotoImage.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "images": images == null ? null : List<dynamic>.from(images!.map((x) => x.toJson())),
    };
}

class PhotoImage {
    int? id;
    int? customerId;
    String? image;
    int? typeId;
    // Backend returns this as a string ("1"/"0") in the upload response —
    // keep it loosely typed rather than assuming int.
    dynamic isMainImage;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    PhotoImage({
        this.id,
        this.customerId,
        this.image,
        this.typeId,
        this.isMainImage,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory PhotoImage.fromJson(Map<String, dynamic> json) => PhotoImage(
        id: json["id"],
        customerId: json["customer_id"],
        image: json["image"],
        typeId: json["type_id"],
        isMainImage: json["is_main_image"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.tryParse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "image": image,
        "type_id": typeId,
        "is_main_image": isMainImage,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
