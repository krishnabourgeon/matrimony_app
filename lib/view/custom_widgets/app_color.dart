import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand
  static const Color primary        = Color(0xFFE85D75);
  static const Color primaryDark    = Color(0xFFE85D75);
  static const Color primaryLight   = Color(0xFFFAECF0);
  static const Color primaryMid     = Color(0xFFF2C4D0);
  static const Color onPrimary      = Colors.white;

  static const Color roseGold       = Color(0xFFD4A373);
  static const Color roseGoldLight  = Color(0xFFFFF5EC);
  static const Color roseGoldDark   = Color(0xFFB8884A);

  static const Color secondary      = Color(0xFFD4A373);
  static const Color secondaryLight = Color(0xFFFFF5EC);
  static const Color onSecondary    = Colors.white;

  // Background / Surface
  static const Color background     = Color(0xFFFFF8F0);
  static const Color beige          = Color(0xFFF7F2EC);
  static const Color surface        = Colors.white;
  static const Color surfaceVariant = Color(0xFFF7F2EC);
  static const Color surfaceElev1   = Color(0xFFFFFBFF);
  static const Color cardBg         = Color(0xFFFFF8F0);

  // Text
  static const Color textPrimary    = Color(0xFF2C1810);
  static const Color textSecondary  = Color(0xFF6B4C3B);
  static const Color textHint       = Color(0xFFB09080);
  static const Color textOnPrimary  = Colors.white;

  // Semantic
  static const Color success        = Color(0xFF2D7A4F);
  static const Color successLight   = Color(0xFFEDF7F1);
  static const Color successDark    = Color(0xFF1F5A38);
  static const Color warning        = Color(0xFFF59E0B);
  static const Color warningLight   = Color(0xFFFFFBEB);
  //static const Color error          = Color(0xFFDC2626);
  static const Color errorLight     = Color(0xFFFEF2F2);

  // Gold
  static const Color gold           = Color(0xFFC9A227);
  static const Color goldLight      = Color(0xFFFFF9E8);
  static const Color goldDark       = Color(0xFFA67C1A);

  // Purple
  static const Color purple         = Color(0xFF7C3AED);
  static const Color purpleLight    = Color(0xFFF5F3FF);

  // Blue
  static const Color blue           = Color(0xFF1D65C1);
  static const Color blueLight      = Color(0xFFEFF4FF);

  // Border
  static const Color border         = Color(0xFFE8DDD5);
  static const Color divider        = Color(0xFFF2EAE4);



  static const Color coral = Color(0xFFFF3356);
  static const Color coralDark = Color(0xFFE01F42);
  static const Color coralLight = Color(0xFFFFEEF1);
  static const Color ink = Color(0xFF1A1A1A);
  static const Color subtleWhite = Color(0xFFFFFFFF);


  static const Color fieldBg = Color(0xFFF5F5F7);
  static const Color hintText = Color(0xFF8A8A8E);
  static const Color trackBg = Color(0xFFECECEE);
  static const Color error = Color(0xFFE53935);
  static const Color grey = Color(0xFFBDBDBD);

  // Shadows
  static List<BoxShadow> get shadowXs => [
    BoxShadow(color: const Color(0xFF8B1538).withOpacity(0.05),
        blurRadius: 6, offset: const Offset(0, 2)),
  ];
  static List<BoxShadow> get shadowSm => [
    BoxShadow(color: const Color(0xFF8B1538).withOpacity(0.08),
        blurRadius: 14, offset: const Offset(0, 4)),
    BoxShadow(color: Colors.black.withOpacity(0.03),
        blurRadius: 4, offset: const Offset(0, 1)),
  ];
  static List<BoxShadow> get shadowMd => [
    BoxShadow(color: const Color(0xFF8B1538).withOpacity(0.10),
        blurRadius: 24, offset: const Offset(0, 8)),
    BoxShadow(color: Colors.black.withOpacity(0.04),
        blurRadius: 8, offset: const Offset(0, 2)),
  ];
  static List<BoxShadow> get shadowPrimary => [
    BoxShadow(color: primary.withOpacity(0.30),
        blurRadius: 24, offset: const Offset(0, 10)),
    BoxShadow(color: primary.withOpacity(0.12),
        blurRadius: 8, offset: const Offset(0, 3)),
  ];
  static List<BoxShadow> get shadowGold => [
    BoxShadow(color: gold.withOpacity(0.30),
        blurRadius: 20, offset: const Offset(0, 8)),
  ];
  static List<BoxShadow> get shadowNav => [
    BoxShadow(color: const Color(0xFF8B1538).withOpacity(0.12),
        blurRadius: 32, offset: const Offset(0, -8)),
    BoxShadow(color: Colors.black.withOpacity(0.05),
        blurRadius: 10, offset: const Offset(0, -2)),
  ];

  // Gradients
  static const LinearGradient gradPrimary = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient gradHero = LinearGradient(
    colors: [Color(0xFF9C1844), Color(0xFF6B0F2A), Color(0xFF3D0815)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.55, 1.0],
  );
  static const LinearGradient gradCard = LinearGradient(
    colors: [Colors.transparent, Color(0xCC000000)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient gradGold = LinearGradient(
    colors: [Color(0xFFD4A373), Color(0xFFC9A227)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient gradGreen = LinearGradient(
    colors: [Color(0xFF2D7A4F), Color(0xFF48BB78)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient gradRoseGold = LinearGradient(
    colors: [Color(0xFFD4A373), Color(0xFFB8884A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Spacing
  static const double sp2  = 2;
  static const double sp4  = 4;
  static const double sp8  = 8;
  static const double sp12 = 12;
  static const double sp16 = 16;
  static const double sp20 = 20;
  static const double sp24 = 24;
  static const double sp32 = 32;
  static const double sp40 = 40;
  static const double sp48 = 48;

  // Radius
  static const double r8   = 8;
  static const double r10  = 10;
  static const double r12  = 12;
  static const double r16  = 16;
  static const double r20  = 20;
  static const double r24  = 24;
  static const double r32  = 32;

  // Typography
  static const TextStyle h1 = TextStyle(fontSize: 28, fontWeight: FontWeight.w800,
      color: textPrimary, letterSpacing: -0.6, height: 1.2);
  static const TextStyle h2 = TextStyle(fontSize: 22, fontWeight: FontWeight.w800,
      color: textPrimary, letterSpacing: -0.4, height: 1.25);
  static const TextStyle h3 = TextStyle(fontSize: 18, fontWeight: FontWeight.w700,
      color: textPrimary, letterSpacing: -0.2, height: 1.3);
  static const TextStyle h4 = TextStyle(fontSize: 15, fontWeight: FontWeight.w700,
      color: textPrimary, height: 1.4);
  static const TextStyle body1 = TextStyle(fontSize: 14, fontWeight: FontWeight.w400,
      color: textPrimary, height: 1.6);
  static const TextStyle body2 = TextStyle(fontSize: 13, fontWeight: FontWeight.w400,
      color: textSecondary, height: 1.5);
  static const TextStyle caption = TextStyle(fontSize: 11, fontWeight: FontWeight.w400,
      color: textHint, height: 1.4);
  static const TextStyle label = TextStyle(fontSize: 12, fontWeight: FontWeight.w600,
      color: textSecondary, letterSpacing: 0.2);
  static const TextStyle overline = TextStyle(fontSize: 10, fontWeight: FontWeight.w700,
      color: primary, letterSpacing: 1.5);

  // Legacy aliases
  static const Color primary_dp  = roseGold;
  static const Color surfaceVar  = surfaceVariant;
  static const Color surfaceElev = surfaceElev1;
  static const Color outline     = border;
  static const Color textSecond  = textSecondary;

  static const double radiusSm  = r8;
  static const double radiusMd  = r12;
  static const double radiusLg  = r16;
  static const double radiusXl  = r20;
  static const double radiusXxl = r32;

  static const double xs  = sp4;
  static const double sm  = sp8;
  static const double md  = sp16;
  static const double lg  = sp24;
  static const double xl  = sp32;
  static const double xxl = sp48;

  static const Color kAccent    = primary;
  static const Color kCardBg    = cardBg;
  static const Color kBorder    = border;
  static const Color kTextDark  = textPrimary;
  static const Color kTextMuted = textSecondary;
  static const Color kWhite     = Colors.white;
  static const Color kBgTop     = Color(0xFFFFF8F0);
  static const Color kBgBottom  = Color(0xFF6B0F2A);
  static const Color kDarkSlate = Color(0xFF2C1810);
  static const Color kSlate     = Color(0xFF6B4C3B);
  static const Color kAccentDp  = roseGold;
  static const Color kDark      = textPrimary;
  static const Color kMuted     = textSecondary;
  static const Color kCard      = cardBg;
  static const Color kBg        = background;
  static const Color kSurface   = surface;
  static const Color kAccentSoft = primaryLight;
  static const Color kGold      = gold;
  static const Color kGoldSoft  = goldLight;
  static const Color kGreen     = success;
  static const Color kTextBody  = textSecondary;
  static const Color kShadow    = Color(0x0F8B1538);

  static const LinearGradient kBgGradient = LinearGradient(
    colors: [kBgTop, kBgBottom],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient kAccentGradient = gradPrimary;
}
