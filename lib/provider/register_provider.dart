import 'package:flutter/material.dart';
import 'package:matrimony_app/function.dart';
import 'package:matrimony_app/model/created_for_model.dart';
import 'package:matrimony_app/model/gender_model.dart';
import 'package:matrimony_app/model/mother_tongue.dart';
import 'package:matrimony_app/model/error_response_model.dart';
import 'package:matrimony_app/model/signup_model.dart';
import 'package:matrimony_app/model/verify_otp_model.dart';
import 'package:matrimony_app/services/provider_helper_class.dart';

class RegisterProvider extends ProviderHelperClass with ChangeNotifier {
  CreatedForModel? createdForModel;
  MotherTongueModel? motherTongueModel;
  SignupModel? signupModel;
  GenderModel? genderModel;
  VerifyOtpModel? verifyOtpModel;
  String? verifyOtpError;

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
      if (result is SignupModel) signupModel = result;
      updateLoadState(LoaderState.loaded);
      notifyListeners();
      return res.isValue;
    } catch (e) {
      debugPrint('exception in signup: $e');
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



  Future<bool> verifyOtp(String mobilenumber,int otp) async {
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
}
