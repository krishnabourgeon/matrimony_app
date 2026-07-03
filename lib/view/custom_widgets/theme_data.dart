import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

ThemeData buildTheme() => ThemeData(
      useMaterial3: true,
      fontFamily: 'Georgia',
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary_dp,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.primaryDark,
        onSecondary: AppColors.onPrimary,
        
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
        error: AppColors.error,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: AppColors.surfaceVar,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: AppColors.h3,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceElev,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppColors.radiusMd), borderSide: const BorderSide(color: AppColors.outline)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppColors.radiusMd), borderSide: const BorderSide(color: AppColors.outline)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppColors.radiusMd), borderSide: const BorderSide(color: AppColors.primary_dp, width: 1.5)),
        hintStyle: AppColors.body2.copyWith(color: AppColors.textHint),
        labelStyle: AppColors.label,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary_dp,
          foregroundColor: AppColors.onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppColors.radiusMd)),
          padding: const EdgeInsets.symmetric(vertical: 14),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 0.2),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceElev,
        selectedColor: AppColors.primary_dp,
        labelStyle: AppColors.caption.copyWith(color: AppColors.textSecond),
        side: const BorderSide(color: AppColors.outline),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.divider, thickness: 1, space: 1),
      tabBarTheme: TabBarThemeData(
        labelColor: AppColors.onPrimary,
        unselectedLabelColor: AppColors.textSecond,
        labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        indicator: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(10)),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
      ),
    );
