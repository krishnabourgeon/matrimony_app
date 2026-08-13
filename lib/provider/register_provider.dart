import 'package:flutter/material.dart';
import 'package:matrimony_app/function.dart';
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
import 'package:matrimony_app/model/error_response_model.dart';
import 'package:matrimony_app/model/occupations_model.dart';
import 'package:matrimony_app/model/personal_model.dart';
import 'package:matrimony_app/model/professional_model.dart';
import 'package:matrimony_app/model/religions_model.dart';
import 'package:matrimony_app/model/residiential_model.dart';
import 'package:matrimony_app/model/signup_model.dart';
import 'package:matrimony_app/model/skin_type_model.dart';
import 'package:matrimony_app/model/states_model.dart';
import 'package:matrimony_app/model/subcaste_model.dart';
import 'package:matrimony_app/model/value_slab_model.dart';
import 'package:matrimony_app/model/verify_otp_model.dart';
import 'package:matrimony_app/services/provider_helper_class.dart';

class RegisterProvider extends ProviderHelperClass with ChangeNotifier {
  CreatedForModel? createdForModel;
  MotherTongueModel? motherTongueModel;
  SignupModel? signupModel;
  String? signupError;
  GenderModel? genderModel;
  VerifyOtpModel? verifyOtpModel;
  String? verifyOtpError;
  BasicInfoModel? basicInfoModel;
  String? basicInfoError;
  ReligionsModel? religionsModel;
  CastModel? castModel;
  SubcastesModel? subcastesModel;
  GotrasModel? gotrasModel;
  CountriesModel? countriesModel;
  StatesModel? statesModel;
  DistrictModel? districtModel;
  CommunityLocationModel? communityLocationModel;
  String? communityLocationError;
  EducationModel? educationModel;
  JobIndustriesModel? jobIndustriesModel;
  OccupationsModel? occupationsModel;
  ResidentialModel? residentialModel;
  CurrenciesModel? currenciesModel;
  IncomeModel? incomeModel;
  ProfessionalModel? professionalModel;
  String? professionalError;
  SkinTypeModel? skinTypeModel;
  BodyTypesModel? bodyTypeModel;
  BloodGroupModel? bloodGroupModel;
  MaritalStatusesModel? maritalStatusesModel;
  DietsModel? dietsModel;
  ChoicesModel? choicesModel;
  PersonalModel? personalModel;
  String? personalError;
  FamilyStatusesModel? familyStatusesModel;
  FamilyTypeModel? familyTypeModel;
  FamilyValuesModel? familyValuesModel;
  ValueSlabModel? valueSlabModel;
  FamilyModel? familyModel;
  String? familyError;
  HobbiesModel? hobbiesModel;
  HobbiesModel? hobbySaveModel;
  String? hobbyError;

  @override
  void updateLoadState(LoaderState state) {
    loaderState = state;
    notifyListeners();
  }

  Future<void> createdFors() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getCreatedFor();
        if (res.isValue) {
          createdForModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in created for: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> motherTongue() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getMotherTongue();
        if (res.isValue) {
          motherTongueModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in mother tongue: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<bool> signup(
    int createdforid,
    String name,
    int mothertongueid,
    String mobilenumber,
  ) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (!network) {
      updateLoadState(LoaderState.loaded);
      return false;
    }
    try {
      var res = await serviceConfig.signUp(
        createdforid,
        name,
        mothertongueid,
        mobilenumber,
      );
      final result = res.asValue?.value ?? res.asError?.error;
      if (result is SignupModel) {
        signupModel = result;
        signupError = null;
      } else if (result is ErrorResponseModel) {
        signupError = result.errorMessage ?? 'Signup failed. Please try again';
      }
      updateLoadState(LoaderState.loaded);
      notifyListeners();
      return res.isValue;
    } catch (e) {
      debugPrint('exception in signup: $e');
      signupError = 'Signup failed. Please try again';
      updateLoadState(LoaderState.loaded);
      return false;
    }
  }

  Future<void> getGenders() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getGenders();
        if (res.isValue) {
          genderModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in genders: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<bool> verifyOtp(String mobilenumber, int otp) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (!network) {
      updateLoadState(LoaderState.loaded);
      return false;
    }
    try {
      var res = await serviceConfig.verifyOtp(mobilenumber, otp);
      final result = res.asValue?.value ?? res.asError?.error;
      if (result is VerifyOtpModel) {
        verifyOtpModel = result;
        verifyOtpError = null;
      } else if (result is ErrorResponseModel) {
        verifyOtpError = result.errorMessage ?? 'Invalid OTP. Please try again';
      }
      updateLoadState(LoaderState.loaded);
      notifyListeners();
      return res.isValue;
    } catch (e) {
      debugPrint('exception in verify otp: $e');
      verifyOtpError = 'Something went wrong';
      updateLoadState(LoaderState.loaded);
      return false;
    }
  }

  Future<bool> basicInfo(
    String email,
    String password,
    String passwordConfirmation,
    String dob,
    int genderId,
  ) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (!network) {
      updateLoadState(LoaderState.loaded);
      return false;
    }
    try {
      var res = await serviceConfig.basicInfo(
        email,
        password,
        passwordConfirmation,
        dob,
        genderId,
      );
      final result = res.asValue?.value ?? res.asError?.error;
      if (result is BasicInfoModel) {
        basicInfoModel = result;
        basicInfoError = null;
      } else if (result is ErrorResponseModel) {
        basicInfoError =
            result.errorMessage ?? 'Something went wrong. Please try again';
      }
      updateLoadState(LoaderState.loaded);
      notifyListeners();
      return res.isValue;
    } catch (e) {
      debugPrint('exception in basic info: $e');
      basicInfoError = 'Something went wrong. Please try again';
      updateLoadState(LoaderState.loaded);
      return false;
    }
  }

  Future<void> getReligion() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getReligion();
        if (res.isValue) {
          religionsModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in religion: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getCaste(int religionid) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getCast(religionid);
        if (res.isValue) {
          castModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in cast: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }


  Future<void> getSubCast(int castid) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getSubCast(castid);
        if (res.isValue) {
          subcastesModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in subcaste: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }


  Future<void> getGotar() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getGotra();
        if (res.isValue) {
          gotrasModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in gotar: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getStates(int countryid) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getStates(countryid);
        if (res.isValue) {
          statesModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in states: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }


  Future<void> getDistrict(int stateid) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getDistricts(stateid);
        if (res.isValue) {
          districtModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in district: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }


  Future<void> getCountries() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getCountries();
        if (res.isValue) {
          countriesModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in countries: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<bool> communityAndLocation({
    required int nativeCountryId,
    required int nativeStateId,
    required int nativeDistrictId,
    required String nativeDescription,
    required int permanentCountryId,
    required int permanentStateId,
    required int permanentDistrictId,
    required String permanentAddress,
    required String permanentPincode,
    required int currentCountryId,
    required int currentStateId,
    required int currentDistrictId,
    required String currentAddress,
    required String currentPincode,
    required int religionId,
    required int casteId,
    required int subCasteId,
    required int gotraId,
    required String casteMatch,
  }) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (!network) {
      updateLoadState(LoaderState.loaded);
      return false;
    }
    try {
      var res = await serviceConfig.communityandLocation(
        nativeCountryId,
        nativeStateId,
        nativeDistrictId,
        nativeDescription,
        permanentCountryId,
        permanentStateId,
        permanentDistrictId,
        permanentAddress,
        permanentPincode,
        currentCountryId,
        currentStateId,
        currentDistrictId,
        currentAddress,
        currentPincode,
        religionId,
        casteId,
        subCasteId,
        gotraId,
        casteMatch,
      );
      final result = res.asValue?.value ?? res.asError?.error;
      if (result is CommunityLocationModel) {
        communityLocationModel = result;
        communityLocationError = null;
      } else if (result is ErrorResponseModel) {
        communityLocationError =
            result.errorMessage ?? 'Something went wrong. Please try again';
      }
      updateLoadState(LoaderState.loaded);
      notifyListeners();
      return res.isValue;
    } catch (e) {
      debugPrint('exception in community and location: $e');
      communityLocationError = 'Something went wrong. Please try again';
      updateLoadState(LoaderState.loaded);
      return false;
    }
  }

  Future<void> getEducations() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getEducation();
        if (res.isValue) {
          educationModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in education: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getEmploymentTypes() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getEmployementType();
        if (res.isValue) {
          jobIndustriesModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in employment type: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getOccupations() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getOccupation();
        if (res.isValue) {
          occupationsModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in occupation: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getResidentialStatuses() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getResidentialStatus();
        if (res.isValue) {
          residentialModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in residential status: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getCurrencies() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getCurrencies();
        if (res.isValue) {
          currenciesModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in currencies: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getIncomes(int currencyId) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getIncome(currencyId);
        if (res.isValue) {
          incomeModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in incomes: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getSkinTypes() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getSkinColor();
        if (res.isValue) {
          skinTypeModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in skin types: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getBodyTypes() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getBodyType();
        if (res.isValue) {
          bodyTypeModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in body types: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getBloodGroups() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getBloodGroup();
        if (res.isValue) {
          bloodGroupModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in blood groups: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<bool> professionalDetails({
    required int highestEducationId,
    required String educationDesc,
    required int jobIndustryId,
    required int occupationId,
    required int workingCountryId,
    required int workingStateId,
    required int workingDistrictId,
    required int residentialStatusId,
    required int currencyId,
    required int incomeSlabId,
    required List<int> languages,
  }) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (!network) {
      updateLoadState(LoaderState.loaded);
      return false;
    }
    try {
      var res = await serviceConfig.professionalDetails(
        highestEducationId,
        educationDesc,
        jobIndustryId,
        occupationId,
        workingCountryId,
        workingStateId,
        workingDistrictId,
        residentialStatusId,
        currencyId,
        incomeSlabId,
        languages,
      );
      final result = res.asValue?.value ?? res.asError?.error;
      if (result is ProfessionalModel) {
        professionalModel = result;
        professionalError = null;
      } else if (result is ErrorResponseModel) {
        professionalError =
            result.errorMessage ?? 'Something went wrong. Please try again';
      }
      updateLoadState(LoaderState.loaded);
      notifyListeners();
      return res.isValue;
    } catch (e) {
      debugPrint('exception in professional details: $e');
      professionalError = 'Something went wrong. Please try again';
      updateLoadState(LoaderState.loaded);
      return false;
    }
  }

  Future<void> getMaritalStatuses() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getMatrialStatues();
        if (res.isValue) {
          maritalStatusesModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in marital statuses: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getDiets() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getDiets();
        if (res.isValue) {
          dietsModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in diets: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  // Backs both the Smoking and Drinking dropdowns on the Personal & Physical
  // screen — the backend serves the same list of choices for either field.
  Future<void> getChoices() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getChoices();
        if (res.isValue) {
          choicesModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in choices: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<bool> personalDetails({
    required int maritalStatusId,
    required int childCount,
    required int height,
    required int weight,
    required int skinTypeId,
    required int bodyTypeId,
    required int bloodGroupId,
    required int disabilityStatus,
    required String disabilityDesc,
    required int majorSurgery,
    required int dietId,
    required int drinkingHabitId,
    required int smokingHabitId,
    required int havePet,
  }) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (!network) {
      updateLoadState(LoaderState.loaded);
      return false;
    }
    try {
      var res = await serviceConfig.personalDetails(
        maritalStatusId,
        childCount,
        height,
        weight,
        skinTypeId,
        bodyTypeId,
        bloodGroupId,
        disabilityStatus,
        disabilityDesc,
        majorSurgery,
        dietId,
        drinkingHabitId,
        smokingHabitId,
        havePet,
      );
      final result = res.asValue?.value ?? res.asError?.error;
      if (result is PersonalModel) {
        personalModel = result;
        personalError = null;
      } else if (result is ErrorResponseModel) {
        personalError =
            result.errorMessage ?? 'Something went wrong. Please try again';
      }
      updateLoadState(LoaderState.loaded);
      notifyListeners();
      return res.isValue;
    } catch (e) {
      debugPrint('exception in personal details: $e');
      personalError = 'Something went wrong. Please try again';
      updateLoadState(LoaderState.loaded);
      return false;
    }
  }

  Future<void> getFamilyStatuses() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getFamilyStatus();
        if (res.isValue) {
          familyStatusesModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in family statuses: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getFamilyTypes() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getFamilyType();
        if (res.isValue) {
          familyTypeModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in family types: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getFamilyValues() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getFamilyValue();
        if (res.isValue) {
          familyValuesModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in family values: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getValueSlabs() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getValueslabs();
        if (res.isValue) {
          valueSlabModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in value slabs: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<bool> familyDetails({
    required int familyTypeId,
    required int familyStatusId,
    required int familyValueId,
    required int membersCount,
    required int brotherCount,
    required int sisterCount,
    required int brotherMarriedCount,
    required int sisterMarriedCount,
    required int fatherJobId,
    required int motherJobId,
    required int familyPropertyValueId,
    required String mobile2,
  }) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (!network) {
      updateLoadState(LoaderState.loaded);
      return false;
    }
    try {
      var res = await serviceConfig.familyInfo(
        familyTypeId,
        familyStatusId,
        familyValueId,
        membersCount,
        brotherCount,
        sisterCount,
        brotherMarriedCount,
        sisterMarriedCount,
        fatherJobId,
        motherJobId,
        familyPropertyValueId,
        mobile2,
      );
      final result = res.asValue?.value ?? res.asError?.error;
      if (result is FamilyModel) {
        familyModel = result;
        familyError = null;
      } else if (result is ErrorResponseModel) {
        familyError = result.errorMessage ?? 'Something went wrong. Please try again';
      }
      updateLoadState(LoaderState.loaded);
      notifyListeners();
      return res.isValue;
    } catch (e) {
      debugPrint('exception in family details: $e');
      familyError = 'Something went wrong. Please try again';
      updateLoadState(LoaderState.loaded);
      return false;
    }
  }

  Future<void> getHobbies() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.gethobbies();
        if (res.isValue) {
          hobbiesModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in hobbies: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<bool> saveHobbies({
    required List<int> hobbies,
    required String otherHobbies,
  }) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (!network) {
      updateLoadState(LoaderState.loaded);
      return false;
    }
    try {
      var res = await serviceConfig.hobbyInfo(hobbies, otherHobbies);
      final result = res.asValue?.value ?? res.asError?.error;
      if (result is HobbiesModel) {
        hobbySaveModel = result;
        hobbyError = null;
      } else if (result is ErrorResponseModel) {
        hobbyError = result.errorMessage ?? 'Something went wrong. Please try again';
      }
      updateLoadState(LoaderState.loaded);
      notifyListeners();
      return res.isValue;
    } catch (e) {
      debugPrint('exception in save hobbies: $e');
      hobbyError = 'Something went wrong. Please try again';
      updateLoadState(LoaderState.loaded);
      return false;
    }
  }
}
