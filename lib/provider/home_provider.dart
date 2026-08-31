import 'package:flutter/material.dart';
import 'package:matrimony_app/function.dart';
import 'package:matrimony_app/model/chat_model.dart';
import 'package:matrimony_app/model/contacts_viewed_by_me_model.dart';
import 'package:matrimony_app/model/contacts_viewed_you_model.dart';
import 'package:matrimony_app/model/dashboard_model.dart';
import 'package:matrimony_app/model/all_matches_model.dart';
import 'package:matrimony_app/model/interest_received_all.dart';
import 'package:matrimony_app/model/interest_recevied_model.dart';
import 'package:matrimony_app/model/interest_send_model.dart';
import 'package:matrimony_app/model/new_matches_model.dart';
import 'package:matrimony_app/model/request_model.dart';
import 'package:matrimony_app/model/request_send_model.dart';
import 'package:matrimony_app/model/respond_interest_model.dart';
import 'package:matrimony_app/model/respond_request_model.dart';
import 'package:matrimony_app/model/shortlist_model.dart';
import 'package:matrimony_app/model/shortlisted_by_you_model.dart';
import 'package:matrimony_app/model/shortlisted_you_model.dart';
import 'package:matrimony_app/model/viewed_by_me_model.dart';
import 'package:matrimony_app/model/viewed_me_model.dart';
import 'package:matrimony_app/services/provider_helper_class.dart';

class HomeProvider extends ProviderHelperClass with ChangeNotifier {
  DashboardModel? dashboardModel;
  AllMatchesModel? allMatchesModel;
  NewMatchesModel? newMatchesModel;
  ViewedByMeModel? viewedByMeModel;
  ViewedMeModel? viewedMeModel;
  ShortlistedByYouModel? shortlistedByYouModel;
  ShortlistedYouModel? shortlistedYouModel;
  ChatModel? chatModel;
  InterestReceivedAllModel? interestReceivedAllModel;
  InterestReceivedModel? interestReceivedModel;
  InterestSentModel? interestSendModel;
  RespondInterestModel? respondInterestModel;
  RequestModel? requestModel;
  RespondRequestModel? respondRequestModel;
  ShortListModel? shortListModel;
  RequestSendModel? requestSendModel;
  ContactsViewedByMeModel? contactsViewedByMeModel;
  ContactsViewedYouModel? contactsViewedYouModel;

  @override
  void updateLoadState(LoaderState state) {
    loaderState = state;
    notifyListeners();
  }

  Future<void> getDashboard() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getDashboard();
        if (res.isValue) {
          dashboardModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in dashboard: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getAllMatches() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getAllMatches();
        if (res.isValue) {
          allMatchesModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in all matches: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getNewMatches() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getNewMatches();
        if (res.isValue) {
          newMatchesModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in new matches: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getViewedMe() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getViewedMe();
        if (res.isValue) {
          viewedMeModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in viewed me: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getViewedByMe() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getViewedByMe();
        if (res.isValue) {
          viewedByMeModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in viewed by me: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getShortlistedByYou() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getShortlistedByYou();
        if (res.isValue) {
          shortlistedByYouModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in shortlisted by you: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getShortlistedYou() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getShortlistedYou();
        if (res.isValue) {
          shortlistedYouModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in shortlisted: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> getChat() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.getChat();
        if (res.isValue) {
          chatModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in chat: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> interestReceivedAll() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.interestReceivedAll();
        if (res.isValue) {
          interestReceivedAllModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in interest received all: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> interestReceived(int status) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.interestReceived(status);
        if (res.isValue) {
          interestReceivedModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in interest received: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> interestSend(int status) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.interestSend(status);
        if (res.isValue) {
          interestSendModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in interest send: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> respondInterest(int interestid, String status) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.respondInterest(interestid, status);
        if (res.isValue) {
          respondInterestModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in interest respond: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> request(String type) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.request(type);
        if (res.isValue) {
          requestModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in request: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> respondRequest(int requestid, String status) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.requestRespond(requestid, status);
        if (res.isValue) {
          respondRequestModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in request respond: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> shortlist(int id) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.shorlist(id);
        if (res.isValue) {
          shortListModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
          // The toggle only flips the flag server-side — refresh the
          // "shortlisted by you" list so screens reading it (Inbox
          // Shortlistings, Matches) pick up the add/remove immediately.
          await getShortlistedByYou();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in shortlist: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }

  Future<void> requestSend(String type) async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.requestSend(type);
        if (res.isValue) {
          requestSendModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in request send: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }


  Future<void> contactsViewedByMe() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.contactsViewedByMe();
        if (res.isValue) {
          contactsViewedByMeModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in contacts viewed by me: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }


  Future<void> contactsViewedByYou() async {
    updateLoadState(LoaderState.loading);
    final network = await CommonFunctions.checkInternetConnection();
    if (network) {
      try {
        var res = await serviceConfig.contactsViewedByYou();
        if (res.isValue) {
          contactsViewedYouModel = res.asValue!.value;
          updateLoadState(LoaderState.loaded);

          notifyListeners();
        } else {
          updateLoadState(LoaderState.loaded);
        }
      } catch (e) {
        debugPrint('exception in contacts viewed by you: $e');
        updateLoadState(LoaderState.loaded);
      }
    }
  }
}
