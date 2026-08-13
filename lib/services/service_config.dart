import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:async/async.dart';
import 'package:matrimony_app/model/basic_info_model.dart';
import 'package:matrimony_app/model/blood_group.dart';
import 'package:matrimony_app/model/body_type.dart';
import 'package:matrimony_app/model/cast_model.dart';
import 'package:matrimony_app/model/choices_model.dart';
import 'package:matrimony_app/model/community_location.dart';
import 'package:matrimony_app/model/countries_model.dart';
import 'package:matrimony_app/model/created_for_model.dart';
import 'package:matrimony_app/model/curriencies_model.dart';
import 'package:matrimony_app/model/diets_model.dart';
import 'package:matrimony_app/model/district_model.dart';
import 'package:matrimony_app/model/education_model.dart';
import 'package:matrimony_app/model/error_response_model.dart';
import 'package:matrimony_app/model/family_model.dart';
import 'package:matrimony_app/model/family_statuses.dart';
import 'package:matrimony_app/model/family_type_model.dart';
import 'package:matrimony_app/model/family_values_model.dart';
import 'package:matrimony_app/model/gender_model.dart';
import 'package:matrimony_app/model/gotar_model.dart';
import 'package:matrimony_app/model/hobbies_model.dart';
import 'package:matrimony_app/model/income_model.dart';
import 'package:matrimony_app/model/job_industries_model.dart';
import 'package:matrimony_app/model/marital_statuses_model.dart';
import 'package:matrimony_app/model/mother_tongue.dart';
import 'package:matrimony_app/model/occupations_model.dart';
import 'package:matrimony_app/model/personal_model.dart';
import 'package:matrimony_app/model/professional_model.dart';
import 'package:matrimony_app/model/religions_model.dart';
import 'package:matrimony_app/model/residiential_model.dart';
import 'package:matrimony_app/model/signup_model.dart';
import 'package:matrimony_app/model/skin_type_model.dart';
import 'package:matrimony_app/model/stars_model.dart';
import 'package:matrimony_app/model/states_model.dart';
import 'package:matrimony_app/model/subcaste_model.dart';
import 'package:matrimony_app/model/value_slab_model.dart';
import 'package:matrimony_app/model/verify_otp_model.dart';
import 'app_exceptions.dart';
import 'base_client.dart';
import 'shared_preference_helper.dart';

class ServiceConfig {
  // Pulls the real reason out of a Laravel-style validation error body, e.g.
  //   {"errors": {"email": ["The email address has already been taken."]},
  //    "message": "Validation failed."}
  // The per-field messages under "errors" are what the user actually needs
  // to see — the top-level "message" is just a generic "Validation failed."
  // and is only used as a fallback when "errors" isn't present.
  static String _extractErrorMessage(String? rawBody, {String fallback = 'Something went wrong'}) {
    // A 302 redirect to the login page (returned as an HTML body instead of
    // JSON) means the request went out unauthenticated — most commonly an
    // empty/expired bearer token rather than a validation failure.
    if (rawBody != null && rawBody.trimLeft().startsWith('<')) {
      return 'Your session has expired. Please verify your mobile number again.';
    }
    try {
      final decoded = jsonDecode(rawBody ?? '{}');
      if (decoded is Map) {
        final errors = decoded['errors'];
        if (errors is Map && errors.isNotEmpty) {
          final messages = <String>[];
          errors.forEach((_, value) {
            if (value is List) {
              messages.addAll(value.map((e) => e.toString()));
            } else if (value != null) {
              messages.add(value.toString());
            }
          });
          if (messages.isNotEmpty) return messages.join('\n');
        }
        if (decoded['message'] != null) return decoded['message'].toString();
      }
    } catch (_) {}
    return fallback;
  }

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
    } on AppException catch (e) {
      // 400/422 responses are thrown by BaseClient instead of returned as a
      // Result, so the real validation-error body (e.g. "The mobile number
      // has already been taken.") lives in e.message — parse it here instead
      // of letting it get swallowed as a generic exception upstream.
      debugPrint('signup validation error: ${e.message}');
      return Result.error(
        ErrorResponseModel(errorMessage: _extractErrorMessage(e.message)),
      );
    }
  }

  Future<Result> verifyOtp(String mobilenumber, int otp) async {
    try {
      Result res = await BaseClient.post(
        'verify-otp',
        body: {'mobile_number': mobilenumber, 'otp': otp},
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
        if (verifyOtpModel.token.isNotEmpty) {
          // Every request after this one (basic-info, community-location, ...)
          // relies on BaseClient.token, which reads from here. Without saving
          // it now, those calls go out with an empty bearer token and the
          // backend 302-redirects them to the login page instead of
          // returning JSON, which used to surface as a generic "Something
          // went wrong" with no real error text to parse.
          await SharedPreferenceHelper.saveToken(verifyOtpModel.token);
        }
        return verifyOtpModel.token.isNotEmpty
            ? Result.value(verifyOtpModel)
            : Result.error(
                ErrorResponseModel(
                  errorMessage: 'Invalid OTP. Please try again',
                ),
              );
      }
    } on AppException catch (e) {
      debugPrint('verify otp validation error: ${e.message}');
      return Result.error(
        ErrorResponseModel(
          errorMessage: _extractErrorMessage(e.message, fallback: 'Invalid OTP. Please try again'),
        ),
      );
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
      return (genderModel.genders != null && genderModel.genders.isNotEmpty)
          ? Result.value(genderModel)
          : Result.error(genderModel);
    }
  }

  Future<Result> basicInfo(String email,String password,String passwordconfirmation,String dob,int genderid) async {
    try {
      Result res = await BaseClient.post('basic-info',body: {
        'email':email,
        'password':password,
        'password_confirmation':passwordconfirmation,
        'dob':dob,
        'gender_id':genderid
      });
      if (res.isError) {
        ErrorResponseModel errorResponseModel = ErrorResponseModel(
          errorMessage: 'OOps...!, Something went wrong',
        );
        return Result.error(errorResponseModel);
      } else {
        var response = res.asValue!.value;
        debugPrint('basic info response $response');
        BasicInfoModel basicInfoModel = BasicInfoModel.fromJson(response);
        return Result.value(basicInfoModel);
      }
    } on AppException catch (e) {
      debugPrint('basic info validation error: ${e.message}');
      return Result.error(
        ErrorResponseModel(
          errorMessage: _extractErrorMessage(e.message, fallback: 'Something went wrong. Please try again'),
        ),
      );
    }
  }



    Future<Result> getReligion() async {
    Result res = await BaseClient.get('religions');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      ReligionsModel religionModel = ReligionsModel.fromJson(response);
      return (religionModel.religions != null && religionModel.religions.isNotEmpty)
          ? Result.value(religionModel)
          : Result.error(religionModel);
    }
  }

    Future<Result> getCast(int religionid) async {
    Result res = await BaseClient.get('castes/$religionid');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      CastModel castesModel = CastModel.fromJson(response);
      return (castesModel.castes != null && castesModel.castes.isNotEmpty)
          ? Result.value(castesModel)
          : Result.error(castesModel);
    }
  }


  Future<Result> getSubCast(int castid) async {
    Result res = await BaseClient.get('sub-castes/$castid');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      SubcastesModel subCastModel = SubcastesModel.fromJson(response);
      return (subCastModel.subCastes != null && subCastModel.subCastes.isNotEmpty)
          ? Result.value(subCastModel)
          : Result.error(subCastModel);
    }
  }

  Future<Result> getGotra() async {
    Result res = await BaseClient.get('gotras');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      GotrasModel gotraModel = GotrasModel.fromJson(response);
      return (gotraModel.gotras != null && gotraModel.gotras.isNotEmpty)
          ? Result.value(gotraModel)
          : Result.error(gotraModel);
    }
  }

   Future<Result> getCountries() async {
    Result res = await BaseClient.get('countries');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      CountriesModel countriesModel = CountriesModel.fromJson(response);
      return (countriesModel.countries != null && countriesModel.countries.isNotEmpty)
          ? Result.value(countriesModel)
          : Result.error(countriesModel);
    }
  }

   Future<Result> getStates(int countryid) async {
    Result res = await BaseClient.get('states/$countryid');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      StatesModel statesModel = StatesModel.fromJson(response);
      return (statesModel.states != null && statesModel.states.isNotEmpty)
          ? Result.value(statesModel)
          : Result.error(statesModel);
    }
  }


   Future<Result> getDistricts(int stateid) async {
    Result res = await BaseClient.get('districts/$stateid');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      DistrictModel districtsModel = DistrictModel.fromJson(response);
      return (districtsModel.districts != null && districtsModel.districts.isNotEmpty)
          ? Result.value(districtsModel)
          : Result.error(districtsModel);
    }
  }


   Future<Result> communityandLocation(
    int nativecountryid,
    int nativestateid,
    int nativedistrictid,
    String nativedescription,
    int permanentcountryid,
    int permanentstateid,
    int permanentdistrictid,
    String permanentaddress,
    String permanentpincode,
    int currentcountryid,
    int currentstateid,
    int currentdistrictid,
    String currentaddress,
    String currentpincode,
    int religionid,
    int casteid,
    int subcasteid,
    int gotraid,
    String castematch
    ) async {
    try {
      Result res = await BaseClient.post('community-location',body: {
        'native_country_id':nativecountryid,
        'native_state_id':nativestateid,
        "native_district_id": nativedistrictid,
        "native_description": nativedescription,
        "permanent_country_id": permanentcountryid,
        "permanent_state_id": permanentstateid,
        "permanent_district_id": permanentdistrictid,
        "permanent_address": permanentaddress,
        "permanent_pincode": permanentpincode,
        "current_country_id": currentcountryid,
        "current_state_id": currentstateid,
        "current_district_id": currentdistrictid,
        "current_address": currentaddress,
        "current_pincode": currentpincode,
        "religion_id": religionid,
        "caste_id": casteid,
        "sub_caste_id": subcasteid,
        "gotra_id": gotraid,
        "caste_match": castematch
      });
      if (res.isError) {
        ErrorResponseModel errorResponseModel = ErrorResponseModel(
          errorMessage: 'OOps...!, Something went wrong',
        );
        return Result.error(errorResponseModel);
      } else {
        var response = res.asValue!.value;
        debugPrint('community and location response $response');
        CommunityLocationModel communityAndLocationModel = CommunityLocationModel.fromJson(response);
        return Result.value(communityAndLocationModel);
      }
    } on AppException catch (e) {
      debugPrint('community and location validation error: ${e.message}');
      return Result.error(
        ErrorResponseModel(
          errorMessage: _extractErrorMessage(e.message, fallback: 'Something went wrong. Please try again'),
        ),
      );
    }
  }

  Future<Result> getEducation() async {
    Result res = await BaseClient.get('educations');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      EducationModel educationModel = EducationModel.fromJson(response);
      return (educationModel.educations != null && educationModel.educations.isNotEmpty)
          ? Result.value(educationModel)
          : Result.error(educationModel);
    }
  }

  Future<Result> getEmployementType() async {
    Result res = await BaseClient.get('job-industries');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      JobIndustriesModel jobIndustriesModel = JobIndustriesModel.fromJson(response);
      return (jobIndustriesModel.jobIndustries != null && jobIndustriesModel.jobIndustries.isNotEmpty)
          ? Result.value(jobIndustriesModel)
          : Result.error(jobIndustriesModel);
    }
  }


  Future<Result> getOccupation() async {
    Result res = await BaseClient.get('occupations');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      OccupationsModel occupationsModel = OccupationsModel.fromJson(response);
      return (occupationsModel.occupations != null && occupationsModel.occupations.isNotEmpty)
          ? Result.value(occupationsModel)
          : Result.error(occupationsModel);
    }
  }

  Future<Result> getResidentialStatus() async {
    Result res = await BaseClient.get('residential-statuses');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      ResidentialModel residentialModel = ResidentialModel.fromJson(response);
      return (residentialModel.residentialStatuses != null && residentialModel.residentialStatuses.isNotEmpty)
          ? Result.value(residentialModel)
          : Result.error(residentialModel);
    }
  }


  Future<Result> getCurrencies() async {
    Result res = await BaseClient.get('currencies');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      CurrenciesModel currenciesModel = CurrenciesModel.fromJson(response);
      return (currenciesModel.currencies != null && currenciesModel.currencies.isNotEmpty)
          ? Result.value(currenciesModel)
          : Result.error(currenciesModel);
    }
  }

  Future<Result> getIncome(int currencyid) async {
    Result res = await BaseClient.get('incomes/$currencyid');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      IncomeModel incomeModel = IncomeModel.fromJson(response);
      return (incomeModel.incomes != null && incomeModel.incomes.isNotEmpty)
          ? Result.value(incomeModel)
          : Result.error(incomeModel);
    }
  }



  Future<Result> professionalDetails(
    int highesteducationid,
    String educationdesc,
    int jobindustryid,
    int occupationid,
    int workingcountryid,
    int workingstateid,
    int workingdistrictid,
    int residentialstatusid,
    int currencyid,
    int incomeslabid,
    List<int> languages,
    ) async {
    try {
      Result res = await BaseClient.post('professional-info',body: {
        "highest_education_id": highesteducationid,
        "education_desc": educationdesc,
        "job_industry_id": jobindustryid,
        "occupation_id": occupationid,
        "working_country_id": workingcountryid,
        "working_state_id": workingstateid,
        "working_district_id": workingdistrictid,
        "residential_status_id": residentialstatusid,
        "currency_id": currencyid,
        "income_slab_id": incomeslabid,
        "languages": languages
      });
      if (res.isError) {
        ErrorResponseModel errorResponseModel = ErrorResponseModel(
          errorMessage: 'OOps...!, Something went wrong',
        );
        return Result.error(errorResponseModel);
      } else {
        var response = res.asValue!.value;
        debugPrint('Professional info response $response');
        ProfessionalModel professionalModel = ProfessionalModel.fromJson(response);
        return Result.value(professionalModel);
      }
    } on AppException catch (e) {
      debugPrint('Professional info validation error: ${e.message}');
      return Result.error(
        ErrorResponseModel(
          errorMessage: _extractErrorMessage(e.message, fallback: 'Something went wrong. Please try again'),
        ),
      );
    }
  }

  Future<Result> getMatrialStatues() async {
    Result res = await BaseClient.get('marital-statuses');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      MaritalStatusesModel maritalStatusesModel = MaritalStatusesModel.fromJson(response);
      return (maritalStatusesModel.maritalStatuses != null && maritalStatusesModel.maritalStatuses.isNotEmpty)
          ? Result.value(maritalStatusesModel)
          : Result.error(maritalStatusesModel);
    }
  }



  Future<Result> getSkinColor() async {
    Result res = await BaseClient.get('skin-types');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      SkinTypeModel skinTypeModel = SkinTypeModel.fromJson(response);
      return (skinTypeModel.skinTypes != null && skinTypeModel.skinTypes.isNotEmpty)
          ? Result.value(skinTypeModel)
          : Result.error(skinTypeModel);
    }
  }

  Future<Result> getBodyType() async {
    Result res = await BaseClient.get('body-types');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      BodyTypesModel bodyTypeModel = BodyTypesModel.fromJson(response);
      return (bodyTypeModel.bodyTypes != null && bodyTypeModel.bodyTypes.isNotEmpty)
          ? Result.value(bodyTypeModel)
          : Result.error(bodyTypeModel);
    }
  }

  Future<Result> getBloodGroup() async {
    Result res = await BaseClient.get('blood-groups');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      BloodGroupModel bloodGroupModel = BloodGroupModel.fromJson(response);
      return (bloodGroupModel.bloodGroups != null && bloodGroupModel.bloodGroups.isNotEmpty)
          ? Result.value(bloodGroupModel)
          : Result.error(bloodGroupModel);
    }
  }

  Future<Result> getDiets() async {
    Result res = await BaseClient.get('diets');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      DietsModel dietsModel = DietsModel.fromJson(response);
      return (dietsModel.diets != null && dietsModel.diets.isNotEmpty)
          ? Result.value(dietsModel)
          : Result.error(dietsModel);
    }
  }

  Future<Result> getChoices() async {
    Result res = await BaseClient.get('choices');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      ChoicesModel choicesModel = ChoicesModel.fromJson(response);
      return (choicesModel.choices != null && choicesModel.choices.isNotEmpty)
          ? Result.value(choicesModel)
          : Result.error(choicesModel);
    }
  }



  Future<Result> getValueslabs() async {
    Result res = await BaseClient.get('value-slabs');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      ValueSlabModel valueSlabsModel = ValueSlabModel.fromJson(response);
      return (valueSlabsModel.valueSlabs != null && valueSlabsModel.valueSlabs.isNotEmpty)
          ? Result.value(valueSlabsModel)
          : Result.error(valueSlabsModel);
    }
  }


    Future<Result> personalDetails(
    int maritalstatusid,
    int childcount,
    int height,
    int weight,
    int skintypeid,
    int bodytypeid,
    int bloodgroupid,
    int disabilitystatus,
    String disabilitydesc,
    int majorsurgery,
    int dietid,
    int drinkinghabitid,
    int smokinghabitid,
    int havepet,
    ) async {
    try {
      Result res = await BaseClient.post('personal-info',body: {
        "marital_status_id": maritalstatusid,
        "child_count": childcount,
        "height": height,
        "weight": weight,
        "skin_type_id": skintypeid,
        "body_type_id": bodytypeid,
        "blood_group_id": bloodgroupid,
        "disability_status": disabilitystatus,
        "disability_desc": disabilitydesc,
        "major_surgery": majorsurgery,
        "diet_id": dietid,
        "drinking_habit_id": drinkinghabitid,
        "smoking_habit_id": smokinghabitid,
        "have_pet": havepet
      });
      if (res.isError) {
        ErrorResponseModel errorResponseModel = ErrorResponseModel(
          errorMessage: 'OOps...!, Something went wrong',
        );
        return Result.error(errorResponseModel);
      } else {
        var response = res.asValue!.value;
        debugPrint('Personal info response $response');
        PersonalModel personalModel = PersonalModel.fromJson(response);
        return Result.value(personalModel);
      }
    } on AppException catch (e) {
      debugPrint('Personal info validation error: ${e.message}');
      return Result.error(
        ErrorResponseModel(
          errorMessage: _extractErrorMessage(e.message, fallback: 'Something went wrong. Please try again'),
        ),
      );
    }
  }


  Future<Result> getFamilyStatus() async {
    Result res = await BaseClient.get('family-statuses');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      FamilyStatusesModel familyStatusesModel = FamilyStatusesModel.fromJson(response);
      return (familyStatusesModel.familyStatuses != null && familyStatusesModel.familyStatuses.isNotEmpty)
          ? Result.value(familyStatusesModel)
          : Result.error(familyStatusesModel);
    }
  }

  Future<Result> getFamilyType() async {
    Result res = await BaseClient.get('family-types');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      FamilyTypeModel familyTypesModel = FamilyTypeModel.fromJson(response);
      return (familyTypesModel.familyTypes != null && familyTypesModel.familyTypes.isNotEmpty)
          ? Result.value(familyTypesModel)
          : Result.error(familyTypesModel);
    }
  }

  
  Future<Result> getFamilyValue() async {
    Result res = await BaseClient.get('family-values');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      FamilyValuesModel familyValuesModel = FamilyValuesModel.fromJson(response);
      return (familyValuesModel.familyValues != null && familyValuesModel.familyValues.isNotEmpty)
          ? Result.value(familyValuesModel)
          : Result.error(familyValuesModel);
    }
  }



  Future<Result> familyInfo(
    int familytypeid,
    int familystatusid,
    int familyvalueid,
    int memberscount,
    int brothercount,
    int sistercount,
    int brothermarriedcount,
    int sistermarriedcount,
    int fatherjobid,
    int motherjobid,
    int familypropertyvalueid,
    String mobile2,
    ) async {
    try {
      Result res = await BaseClient.post('family-info',body: {
        "family_type_id": familytypeid,
        "family_status_id": familystatusid,
        "family_value_id": familyvalueid,
        "members_count": memberscount,
        "brother_count": brothercount,
        "sister_count": sistercount,
        "brother_married_count": brothermarriedcount,
        "sister_married_count": sistermarriedcount,
        "father_job_id": fatherjobid,
        "mother_job_id": motherjobid,
        "family_property_value_id": familypropertyvalueid,
        "mobile_2": mobile2,
      });
      if (res.isError) {
        ErrorResponseModel errorResponseModel = ErrorResponseModel(
          errorMessage: 'OOps...!, Something went wrong',
        );
        return Result.error(errorResponseModel);
      } else {
        var response = res.asValue!.value;
        debugPrint('family info response $response');
        FamilyModel familyModel = FamilyModel.fromJson(response);
        return Result.value(familyModel);
      }
    } on AppException catch (e) {
      debugPrint('family info validation error: ${e.message}');
      return Result.error(
        ErrorResponseModel(
          errorMessage: _extractErrorMessage(e.message, fallback: 'Something went wrong. Please try again'),
        ),
      );
    }
  }


  Future<Result> gethobbies() async {
    Result res = await BaseClient.get('hobbies');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      HobbiesModel hobbiesModel = HobbiesModel.fromJson(response);
      return (hobbiesModel.hobbies != null && hobbiesModel.hobbies.isNotEmpty)
          ? Result.value(hobbiesModel)
          : Result.error(hobbiesModel);
    }
  }



    Future<Result> hobbyInfo(
      List<int> hobbies,
      String otherHobbies,
    ) async {
    try {
      Result res = await BaseClient.post('hobby-info',body: {
        "hobbies": hobbies,
        "other_hobbies": otherHobbies,
      });
      if (res.isError) {
        ErrorResponseModel errorResponseModel = ErrorResponseModel(
          errorMessage: 'OOps...!, Something went wrong',
        );
        return Result.error(errorResponseModel);
      } else {
        var response = res.asValue!.value;
        debugPrint('family info response $response');
        HobbiesModel hobbiesModel =  HobbiesModel.fromJson(response);
        return Result.value(hobbiesModel);
      }
    } on AppException catch (e) {
      debugPrint('family info validation error: ${e.message}');
      return Result.error(
        ErrorResponseModel(
          errorMessage: _extractErrorMessage(e.message, fallback: 'Something went wrong. Please try again'),
        ),
      );
    }
  }


    Future<Result> getStars() async {
    Result res = await BaseClient.get('stars');
    if (res.isError) {
      ErrorResponseModel errorResponseModel = ErrorResponseModel(
        errorMessage: 'OOps...!, Something went wrong',
      );
      return Result.error(errorResponseModel);
    } else {
      var response = res.asValue!.value;
      StarsModel starsModel = StarsModel.fromJson(response);
      return (starsModel.stars != null && starsModel.stars.isNotEmpty)
          ? Result.value(starsModel)
          : Result.error(starsModel);
    }
  }


}
