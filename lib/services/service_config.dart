import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:async/async.dart';
import 'package:matrimony_app/model/created_for_model.dart';
import 'package:matrimony_app/model/error_response_model.dart';
import 'package:matrimony_app/model/gender_model.dart';
import 'package:matrimony_app/model/mother_tongue.dart';
import 'package:matrimony_app/model/signup_model.dart';
import 'package:matrimony_app/model/verify_otp_model.dart';
import 'app_exceptions.dart';
import 'base_client.dart';

class ServiceConfig {
  // Future<Result> login({String? email, String? password}) async {
  //   Map<String, dynamic> body = {
  //     'email': email ?? '',
  //     'password': password ?? '',
  //   };
  //   Result res = await BaseClient.post('auth/login', body: body);
  //   if (res.isError) {
  //     ErrorResponseModel errorResponseModel = ErrorResponseModel(
  //       errorMessage: 'OOps...!, login failed',
  //     );
  //     return Result.error(errorResponseModel);
  //   } else {
  //     var response = res.asValue!.value;
  //     LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
  //       response,
  //     );
  //     return (loginResponseModel.status ?? false)
  //         ? Result.value(loginResponseModel)
  //         : Result.error(loginResponseModel);
  //   }
  // }

  // Future<Result> getDeities() async {
  //   Result res = await BaseClient.get('deities');
  //   if (res.isError) {
  //     ErrorResponseModel errorResponseModel = ErrorResponseModel(
  //       errorMessage: 'OOps...!, Something went wrong',
  //     );
  //     return Result.error(errorResponseModel);
  //   } else {
  //     var response = res.asValue!.value;
  //     debugPrint('-----------------deities response $response-------------------');
  //     print("-----------------deities response $response-------------------");
  //     DeitiesResponse deitiesResponse = DeitiesResponse.fromJson(response);
  //     return (deitiesResponse.status ?? false)
  //         ? Result.value(deitiesResponse)
  //         : Result.error(deitiesResponse);
  //   }
  // }

  Future<Result> getCreatedFor() async {
    Result res = await BaseClient.get('created-fors');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      CreatedForModel createdForModel = CreatedForModel.fromJson(response);
      return (createdForModel.createdFors != null &&
              createdForModel.createdFors.isNotEmpty)
          ? Result.value(createdForModel)
          : Result.error(createdForModel);
    }
  }

  Future<Result> getMotherTongue() async {
    Result res = await BaseClient.get('languages');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      MotherTongueModel motherTongueModel = MotherTongueModel.fromJson(
        response,
      );
      return (motherTongueModel.languages != null &&
              motherTongueModel.languages.isNotEmpty)
          ? Result.value(motherTongueModel)
          : Result.error(motherTongueModel);
    }
  }

  Future<Result> signUp(
    int createdforid,
    String name,
    int mothertongueid,
    String mobilenumber,
  ) async {
    try {
      Result res = await BaseClient.post(
        'signup',
        body: {
          'created_for_id': createdforid,
          'name': name,
          'mother_tongue_id': mothertongueid,
          'mobile_number': mobilenumber,
        },
      );
      if (res.isError) {
        ErrorResponseModel errorResponseModel = ErrorResponseModel(
          errorMessage: 'OOps...!, Something went wrong',
        );

        return Result.error(errorResponseModel);
      } else {
        var response = res.asValue!.value;
        debugPrint('signup response $response');
        SignupModel signUpResponseModel = SignupModel.fromJson(response);
        return signUpResponseModel.error == null
            ? Result.value(signUpResponseModel)
            : Result.error(signUpResponseModel);
      }
    } on BadRequestException catch (e) {
      // 400/422 responses are thrown by BaseClient instead of returned as a
      // Result, so the real validation-error body (e.g. "The mobile number
      // has already been taken.") lives in e.message — parse it here instead
      // of letting it get swallowed as a generic exception upstream.
      debugPrint('signup validation error: ${e.message}');
      try {
        final decoded = jsonDecode(e.message ?? '{}');
        final signUpResponseModel = SignupModel.fromJson(decoded);
        return Result.error(signUpResponseModel);
      } catch (_) {
        return Result.error(
          ErrorResponseModel(errorMessage: e.message ?? 'Something went wrong'),
        );
      }
    }
  }


  Future<Result> verifyOtp(
    String mobilenumber,
    int otp
  ) async {
    try {
      Result res = await BaseClient.post(
        'verify-otp',
        body: {
          'mobile_number': mobilenumber,
          'otp': otp,
        },
      );
      if (res.isError) {
        ErrorResponseModel errorResponseModel = ErrorResponseModel(
          errorMessage: 'OOps...!, Something went wrong',
        );

        return Result.error(errorResponseModel);
      } else {
        var response = res.asValue!.value;
        debugPrint('verify otp response $response');
        VerifyOtpModel verifyOtpModel = VerifyOtpModel.fromJson(response);
        return verifyOtpModel.token.isNotEmpty
            ? Result.value(verifyOtpModel)
            : Result.error(
                ErrorResponseModel(errorMessage: 'Invalid OTP. Please try again'),
              );
      }
    } on BadRequestException catch (e) {
      debugPrint('verify otp validation error: ${e.message}');
      String message = 'Invalid OTP. Please try again';
      try {
        final decoded = jsonDecode(e.message ?? '{}');
        if (decoded is Map && decoded['message'] != null) {
          message = decoded['message'].toString();
        }
      } catch (_) {}
      return Result.error(ErrorResponseModel(errorMessage: message));
    }
  }



  Future<Result> getGenders() async {
    Result res = await BaseClient.get('genders');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      GenderModel genderModel = GenderModel.fromJson(response);
      return (genderModel.genders != null &&
              genderModel.genders.isNotEmpty)
          ? Result.value(genderModel)
          : Result.error(genderModel);
    }
  }
}
