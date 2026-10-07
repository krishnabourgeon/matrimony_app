import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

const boyAvatar = 'assets/image/boy_icon.jpeg';
const girlAvatar = 'assets/image/girl_icon.jpeg';

/// Normalises a gender value to 'male' / 'female', or null if unknown.
/// Accepts strings ("Male", "M", "female", "F"...) or API gender ids
/// (1 = Male, 2 or 3 = Female).
String? normGender(dynamic g) {
  if (g == null) return null;
  if (g is int) {
    return switch (g) {
      1 => 'male',
      2 || 3 => 'female',
      _ => null,
    };
  }
  final v = g.toString().trim().toLowerCase();
  if (v.isEmpty) return null;
  final asInt = int.tryParse(v);
  if (asInt != null) return normGender(asInt);
  if (v.startsWith('m')) return 'male';
  if (v.startsWith('f')) return 'female';
  return null;
}

String? oppositeGender(dynamic g) {
  final n = normGender(g);
  if (n == 'male') return 'female';
  if (n == 'female') return 'male';
  return null;
}

/// The logged-in user's gender, kept globally so image widgets (which are
/// often plain functions with no BuildContext) can pick the right default
/// avatar. Persisted because the login (verify OTP) response doesn't
/// include gender — it's only known from signup / basic-info.
class UserGender {
  static const _prefsKey = 'user_gender';
  static String? current;

  /// Gender to assume for other people's profiles (opposite of the user).
  static String? get matchGender => oppositeGender(current);

  static Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      current = prefs.getString(_prefsKey);
    } catch (_) {}
  }

  static Future<void> set(dynamic gender) async {
    final g = normGender(gender);
    if (g == null || g == current) return;
    current = g;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsKey, g);
    } catch (_) {}
  }
}

/// Default avatar shown when a profile has no photo (or it fails to load):
/// the boy/girl image based on [gender], or a person icon if unknown.
Widget genderAvatarFallback({
  String? gender,
  double? width,
  double? height,
  BoxFit fit = BoxFit.cover,
  double iconSize = 44,
  Key? key,
}) {
  final iconFallback = Container(
    key: key,
    width: width,
    height: height,
    color: AppColors.primaryLight,
    child: Icon(Icons.person, size: iconSize, color: AppColors.primary),
  );
  final g = normGender(gender);
  if (g == null) return iconFallback;
  return Image.asset(
    g == 'male' ? boyAvatar : girlAvatar,
    key: key,
    width: width,
    height: height,
    fit: fit,
    alignment: Alignment.topCenter,
    errorBuilder: (_, __, ___) => iconFallback,
  );
}
