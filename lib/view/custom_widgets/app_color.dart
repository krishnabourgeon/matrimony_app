import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF9B174C);
  static const Color secondary = Color(0xFFC54C68);
  static const Color background = Color(0xFFF7F0EC);
  static const Color gold = Color(0xFFD8A44C);
  static const Color textDark = Color(0xFF2E1A1A);
  static const Color border = Color(0xFFE0D6D1);


  
static const Color kAccent      = Color(0xFFE8876A); // salmon / primary CTA
static const Color kBgTop       = Color(0xFFFFF0EC); // warm blush light
static const Color kBgBottom    = Color(0xFFFFE4DC); // warm blush dark
static const Color kDarkSlate   = Color(0xFF1A202C); // dark text / dark page
static const Color kSlate       = Color(0xFF2D3748); // secondary dark
static const Color kWhite       = Colors.white;
static const Color kTextDark    = Color(0xFF2D1810);
static const Color kTextMuted   = Color(0xFF9E7B70);
static const Color kBorder      = Color(0xFFEDD5CC);
static const Color kCardBg      = Color(0xFFFFEFEB);

static const LinearGradient kBgGradient = LinearGradient(
  colors: [kBgTop, kBgBottom],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

}