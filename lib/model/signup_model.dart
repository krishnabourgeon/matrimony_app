import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) =>
    json.encode(data.toJson());

class SignupModel {
  final String? message;
  final int? createdForId;
  final int? genderId;
  final SignupError? error;

  SignupModel({
    this.message,
    this.createdForId,
    this.genderId,
    this.error,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      message: json['message'],
      createdForId: json["created_for_id"],
      genderId: json["gender_id"],
      error: json['error'] != null
          ? SignupError.fromJson(json['error'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      "created_for_id": createdForId,
      "gender_id": genderId,
      'error': error?.toJson(),
    };
  }
}

class SignupError {
  final List<String>? mobileNumber;

  SignupError({
    this.mobileNumber,
  });

  factory SignupError.fromJson(Map<String, dynamic> json) {
    return SignupError(
      mobileNumber: json['mobile_number'] != null
          ? List<String>.from(json['mobile_number'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mobile_number': mobileNumber,
    };
  }
}