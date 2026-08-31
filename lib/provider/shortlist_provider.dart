import 'package:flutter/foundation.dart';
import 'package:matrimony_app/view/matches_screen.dart';

/// Tracks which profiles the current user has shortlisted, keyed by name
/// (the same de-facto identity already used elsewhere for [MatchProfileItem],
/// e.g. MatchProfileDetailScreen's prev/next lookup). Used two ways:
/// - [shortlistedProfiles]/[toggle]/[isShortlisted]: purely local/in-memory
///   list, for screens whose profiles have no real backend id yet.
/// - [overrideFor]/[setOverride]: an optimistic local override — keyed by
///   MatchProfileItem.profileId — layered on top of the real
///   HomeProvider.shortlistedByYouModel list for API-backed profiles, so a
///   tap flips the heart instantly without waiting for the toggle request
///   and the list refetch that follows it to land.
class ShortlistProvider extends ChangeNotifier {
  final Map<String, MatchProfileItem> _shortlisted = {};
  final Map<String, bool> _overrides = {};

  List<MatchProfileItem> get shortlistedProfiles => _shortlisted.values.toList();

  bool isShortlisted(MatchProfileItem profile) => _shortlisted.containsKey(profile.name);

  void toggle(MatchProfileItem profile) {
    if (_shortlisted.containsKey(profile.name)) {
      _shortlisted.remove(profile.name);
    } else {
      _shortlisted[profile.name] = profile;
    }
    notifyListeners();
  }

  bool? overrideFor(String profileId) => _overrides[profileId];

  void setOverride(String profileId, bool value) {
    _overrides[profileId] = value;
    notifyListeners();
  }
}
