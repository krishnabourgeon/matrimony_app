import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony_app/view/splash_screen.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const VivahBharathApp());
}

class VivahBharathApp extends StatelessWidget {
  const VivahBharathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(debugShowCheckedModeBanner: false, home: child);
      },
      child: SplashScreen(),
    );
  }
}





// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//     statusBarColor: Colors.transparent,
//     statusBarIconBrightness: Brightness.dark,
//   ));
//   runApp(const VivahBharathApp());
// }

// // ─── Brand Colors ────────────────────────────────────────────────────────────
// class C {
//   static const primaryDark = Color(0xFF7B1E28);
//   static const primary     = Color(0xFFF16A5B);
//   static const secondary   = Color(0xFFC0616E);
//   static const bg          = Color(0xFFF9E0DD);
//   static const cardBg      = Color(0xFFFDF0EE);
//   static const border      = Color(0xFFF3C7C2);
//   static const textMuted   = Color(0xFF9E6B6B);
//   static const textLight   = Color(0xFFBBA0A0);
//   static const gold        = Color(0xFFC9A84C);
//   static const green       = Color(0xFF2E7D32);
//   static const greenBg     = Color(0xFFE8F5E9);
// }

// // ─── Root App ────────────────────────────────────────────────────────────────
// class VivahBharathApp extends StatelessWidget {
//   const VivahBharathApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'VivahBharath',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'tasaOrbiter',
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: C.primaryDark,
//           surface: C.bg,
//         ),
//         scaffoldBackgroundColor: C.bg,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.white,
//           surfaceTintColor: Colors.transparent,
//           elevation: 0,
//           iconTheme: IconThemeData(color: C.primaryDark),
//           titleTextStyle: TextStyle(
//             fontFamily: 'tasaOrbiter',
//             fontSize: 16,
//             fontWeight: FontWeight.w700,
//             color: C.primaryDark,
//           ),
//         ),
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  SHARED / REUSABLE WIDGETS
// // ══════════════════════════════════════════════════════════════════════════════

// class LogoBars extends StatelessWidget {
//   final Color color;
//   final double scale;
//   const LogoBars({super.key, this.color = C.primaryDark, this.scale = 1.0});

//   @override
//   Widget build(BuildContext context) {
//     const specs = [[3.0, 22.0], [3.0, 17.0], [3.0, 13.0], [2.0, 9.0], [2.0, 6.0]];
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       mainAxisSize: MainAxisSize.min,
//       children: specs.map((s) => Container(
//         width: s[0] * scale,
//         height: s[1] * scale,
//         margin: EdgeInsets.only(right: 2 * scale),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(2 * scale),
//         ),
//       )).toList(),
//     );
//   }
// }

// class LogoTitle extends StatelessWidget {
//   final double fontSize;
//   const LogoTitle({super.key, this.fontSize = 20});

//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       text: TextSpan(children: [
//         TextSpan(
//           text: 'vivah',
//           style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: fontSize,
//               fontWeight: FontWeight.w300, color: C.primary),
//         ),
//         TextSpan(
//           text: 'bharath',
//           style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: fontSize,
//               fontWeight: FontWeight.w800, color: C.primaryDark),
//         ),
//       ]),
//     );
//   }
// }

// class FullLogo extends StatelessWidget {
//   final double fontSize;
//   final double barScale;
//   const FullLogo({super.key, this.fontSize = 20, this.barScale = 1.0});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         LogoBars(scale: barScale),
//         SizedBox(width: 10 * barScale),
//         LogoTitle(fontSize: fontSize),
//       ],
//     );
//   }
// }

// class PrimaryBtn extends StatelessWidget {
//   final String label;
//   final VoidCallback? onTap;
//   const PrimaryBtn({super.key, required this.label, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(vertical: 14),
//         decoration: BoxDecoration(
//           color: C.primary,
//           borderRadius: BorderRadius.circular(14),
//           boxShadow: [BoxShadow(color: C.primary.withOpacity(0.35),
//               blurRadius: 14, offset: const Offset(0, 6))],
//         ),
//         child: Text(label,
//           textAlign: TextAlign.center,
//           style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 14,
//               fontWeight: FontWeight.w700, color: Colors.white)),
//       ),
//     );
//   }
// }

// class OutlineBtn extends StatelessWidget {
//   final String label;
//   final VoidCallback? onTap;
//   const OutlineBtn({super.key, required this.label, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(vertical: 13),
//         decoration: BoxDecoration(
//           border: Border.all(color: C.primary, width: 1.5),
//           borderRadius: BorderRadius.circular(14),
//         ),
//         child: Text(label,
//           textAlign: TextAlign.center,
//           style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 14,
//               fontWeight: FontWeight.w600, color: C.primary)),
//       ),
//     );
//   }
// }

// class AppCard extends StatelessWidget {
//   final Widget child;
//   final EdgeInsetsGeometry? padding;
//   final Color? color;
//   const AppCard({super.key, required this.child, this.padding, this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: padding ?? const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: color ?? Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: C.border),
//         boxShadow: [BoxShadow(color: C.primaryDark.withOpacity(0.06),
//             blurRadius: 12, offset: const Offset(0, 2))],
//       ),
//       child: child,
//     );
//   }
// }

// class TagChip extends StatelessWidget {
//   final String label;
//   final bool active;
//   const TagChip({super.key, required this.label, this.active = false});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//       decoration: BoxDecoration(
//         color: active ? C.primary : C.cardBg,
//         border: Border.all(color: active ? C.primary : C.border),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(label,
//         style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 11,
//             fontWeight: FontWeight.w600,
//             color: active ? Colors.white : C.primaryDark)),
//     );
//   }
// }

// class BadgeGreen extends StatelessWidget {
//   final String label;
//   const BadgeGreen({super.key, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//       decoration: BoxDecoration(color: C.greenBg, borderRadius: BorderRadius.circular(20)),
//       child: Text(label,
//         style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10,
//             fontWeight: FontWeight.w700, color: C.green)),
//     );
//   }
// }

// class BadgeGold extends StatelessWidget {
//   final String label;
//   const BadgeGold({super.key, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//             colors: [Color(0xFFC9A84C), Color(0xFFE2BF6A)]),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(label,
//         style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10,
//             fontWeight: FontWeight.w700, color: Colors.white)),
//     );
//   }
// }

// class AppInput extends StatelessWidget {
//   final String hint;
//   final IconData? prefixIcon;
//   final bool obscure;
//   final TextEditingController? controller;
//   final TextInputType? keyboardType;
//   const AppInput({super.key, required this.hint, this.prefixIcon, this.obscure = false,
//     this.controller, this.keyboardType});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: C.cardBg,
//         border: Border.all(color: C.border, width: 1.5),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: TextField(
//         controller: controller,
//         obscureText: obscure,
//         keyboardType: keyboardType,
//         style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13, color: C.primaryDark),
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13, color: C.textLight),
//           prefixIcon: prefixIcon != null
//               ? Icon(prefixIcon, color: C.secondary, size: 18)
//               : null,
//           border: InputBorder.none,
//           contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
//         ),
//       ),
//     );
//   }
// }

// /// Styled dropdown field
// class AppDropdown extends StatelessWidget {
//   final String hint;
//   final List<String> items;
//   final String? value;
//   final ValueChanged<String?>? onChanged;
//   const AppDropdown({super.key, required this.hint, required this.items,
//     this.value, this.onChanged});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: C.cardBg,
//         border: Border.all(color: C.border, width: 1.5),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 14),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//           value: value,
//           hint: Text(hint,
//             style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13, color: C.textLight)),
//           isExpanded: true,
//           icon: const Icon(Icons.keyboard_arrow_down_rounded, color: C.secondary),
//           style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13, color: C.primaryDark),
//           dropdownColor: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
//           onChanged: onChanged,
//         ),
//       ),
//     );
//   }
// }

// /// Styled textarea
// class AppTextArea extends StatelessWidget {
//   final String hint;
//   final TextEditingController? controller;
//   final int maxLength;
//   const AppTextArea({super.key, required this.hint, this.controller, this.maxLength = 255});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: C.cardBg,
//         border: Border.all(color: C.border, width: 1.5),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: TextField(
//         controller: controller,
//         maxLines: 4,
//         maxLength: maxLength,
//         style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13, color: C.primaryDark),
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13, color: C.textLight),
//           border: InputBorder.none,
//           contentPadding: const EdgeInsets.all(14),
//           counterStyle: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10, color: C.textLight),
//         ),
//       ),
//     );
//   }
// }

// /// Gender / selection toggle button pair
// class ToggleBtn extends StatelessWidget {
//   final String label;
//   final bool active;
//   final VoidCallback onTap;
//   const ToggleBtn({super.key, required this.label, required this.active, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         decoration: BoxDecoration(
//           color: active ? C.primary : Colors.white,
//           border: Border.all(color: active ? C.primary : C.border, width: 1.5),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Text(label,
//           style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//               fontWeight: FontWeight.w600,
//               color: active ? Colors.white : C.primaryDark)),
//       ),
//     );
//   }
// }

// /// Employment sector chip (multi-select style)
// class SectorChip extends StatelessWidget {
//   final String label;
//   final bool active;
//   final VoidCallback onTap;
//   const SectorChip({super.key, required this.label, required this.active, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
//         decoration: BoxDecoration(
//           color: active ? C.primary.withOpacity(0.1) : Colors.white,
//           border: Border.all(color: active ? C.primary : C.border, width: 1.5),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Text(label,
//           style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 12,
//               fontWeight: FontWeight.w500,
//               color: active ? C.primary : C.primaryDark)),
//       ),
//     );
//   }
// }

// class MainBottomNav extends StatelessWidget {
//   final int currentIndex;
//   final ValueChanged<int> onTap;
//   const MainBottomNav({super.key, required this.currentIndex, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     final items = [
//       (Icons.home_rounded,          'Home'),
//       (Icons.search_rounded,        'Search'),
//       (Icons.favorite_rounded,      'Matches'),
//       (Icons.chat_bubble_rounded,   'Chat'),
//       (Icons.person_rounded,        'Profile'),
//     ];
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         border: Border(top: BorderSide(color: C.border)),
//       ),
//       child: Row(
//         children: items.asMap().entries.map((e) {
//           final i = e.key;
//           final (icon, label) = e.value;
//           final active = i == currentIndex;
//           return Expanded(
//             child: GestureDetector(
//               onTap: () => onTap(i),
//               behavior: HitTestBehavior.opaque,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(icon, color: active ? C.primary : C.textLight, size: 22),
//                     const SizedBox(height: 2),
//                     Text(label,
//                       style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10,
//                           fontWeight: FontWeight.w500,
//                           color: active ? C.primary : C.textLight)),
//                     if (active) ...[
//                       const SizedBox(height: 3),
//                       Container(width: 5, height: 5,
//                           decoration: const BoxDecoration(
//                               color: C.primary, shape: BoxShape.circle)),
//                     ],
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

// // ── Step progress header shared across all register screens ──────────────────
// class RegStepHeader extends StatelessWidget {
//   final int currentStep; // 0-based: 0=Basic,1=Community,2=Professional,3=Physical,4=Education
//   final String title;
//   const RegStepHeader({super.key, required this.currentStep, required this.title});

//   static const _labels = ['Basic', 'Community', 'Professional', 'Physical', 'Education'];

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         GestureDetector(
//           onTap: () => Navigator.pop(context),
//           child: const Row(children: [
//             Icon(Icons.arrow_back_ios_rounded, color: C.primary, size: 16),
//             SizedBox(width: 6),
//             Text('Create your profile',
//               style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13, color: C.textMuted)),
//           ]),
//         ),
//         const SizedBox(height: 16),
//         Row(
//           children: List.generate(_labels.length * 2 - 1, (i) {
//             if (i.isOdd) {
//               final stepIdx = i ~/ 2;
//               return Expanded(child: Container(
//                 height: 2,
//                 color: stepIdx < currentStep ? C.primary : C.border,
//               ));
//             }
//             final stepIdx = i ~/ 2;
//             final done = stepIdx < currentStep;
//             final active = stepIdx == currentStep;
//             return _StepBubble(
//               label: done ? '✓' : '${stepIdx + 1}',
//               done: done,
//               active: active,
//             );
//           }),
//         ),
//         const SizedBox(height: 6),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: _labels.asMap().entries.map((e) => Text(e.value,
//             style: TextStyle(
//               fontFamily: 'tasaOrbiter', fontSize: 9,
//               color: e.key <= currentStep ? C.primary : C.textMuted,
//               fontWeight: e.key == currentStep ? FontWeight.w700 : FontWeight.w400,
//             ))).toList(),
//         ),
//       ]),
//     );
//   }
// }

// class _StepBubble extends StatelessWidget {
//   final String label;
//   final bool done, active;
//   const _StepBubble({required this.label, this.done = false, this.active = false});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 26, height: 26,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: done ? C.primary : Colors.transparent,
//         border: active || (!done) ? Border.all(
//             color: active ? C.primary : C.border, width: 2) : null,
//       ),
//       child: Center(child: Text(label,
//         style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10,
//             fontWeight: FontWeight.w700,
//             color: done ? Colors.white : active ? C.primary : C.textLight))),
//     );
//   }
// }

// /// Left-side gradient illustration panel (mirrors web layout's left card)
// class RegIllustrationPanel extends StatelessWidget {
//   final String title;
//   const RegIllustrationPanel({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [C.primaryDark, Color(0xFFC0616E), Color(0xFFF4A441)],
//         ),
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: Row(children: [
//         Expanded(
//           child: Text(title,
//             style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 16,
//                 fontWeight: FontWeight.w700, color: Colors.white)),
//         ),
//         const Text('👫', style: TextStyle(fontSize: 32)),
//       ]),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  SCREEN 01 — SPLASH
// // ══════════════════════════════════════════════════════════════════════════════
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//   @override State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 2), () {
//       if (mounted) {
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (_) => const OnboardingScreen()));
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [C.primaryDark, Color(0xFFC0616E), C.primary],
//           ),
//         ),
//         child: Stack(
//           children: [
//             Positioned(bottom: 60, left: -30,
//               child: _DecorativeCircle(size: 160, opacity: 0.15)),
//             Positioned(top: 100, right: -20,
//               child: _DecorativeCircle(size: 120, opacity: 0.12)),
//             Center(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(
//                     width: 120, height: 120,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white.withOpacity(0.15),
//                       border: Border.all(color: Colors.white.withOpacity(0.3)),
//                     ),
//                     child: Center(
//                       child: Container(
//                         width: 88, height: 88,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white.withOpacity(0.2),
//                         ),
//                         child: const Center(child: Text('💍', style: TextStyle(fontSize: 36))),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   RichText(text: const TextSpan(children: [
//                     TextSpan(text: 'vivah',
//                       style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 28,
//                           fontWeight: FontWeight.w300, color: Color(0xFFFFD0CB))),
//                     TextSpan(text: 'bharath',
//                       style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 28,
//                           fontWeight: FontWeight.w800, color: Colors.white)),
//                   ])),
//                   const SizedBox(height: 6),
//                   Text('TRUSTED KERALA MATRIMONY',
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10,
//                         letterSpacing: 2.5, color: Colors.white.withOpacity(0.7))),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       _Dot(wide: true),
//                       const SizedBox(width: 5),
//                       _Dot(), const SizedBox(width: 5), _Dot(),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _DecorativeCircle extends StatelessWidget {
//   final double size, opacity;
//   const _DecorativeCircle({required this.size, required this.opacity});
//   @override
//   Widget build(BuildContext context) => Container(
//     width: size, height: size,
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       border: Border.all(color: Colors.white.withOpacity(opacity), width: 1),
//     ),
//   );
// }

// class _Dot extends StatelessWidget {
//   final bool wide;
//   const _Dot({this.wide = false});
//   @override
//   Widget build(BuildContext context) => Container(
//     width: wide ? 24 : 8, height: 6,
//     decoration: BoxDecoration(
//       color: Colors.white.withOpacity(wide ? 1 : 0.4),
//       borderRadius: BorderRadius.circular(3),
//     ),
//   );
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  SCREEN 02-04 — ONBOARDING
// // ══════════════════════════════════════════════════════════════════════════════
// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});
//   @override State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final _ctrl = PageController();
//   int _page = 0;

//   void nextPage() {
//     if (_page < 2) {
//       _ctrl.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
//     } else {
//       _goLogin();
//     }
//   }

//   void _goLogin() => Navigator.pushReplacement(
//       context, MaterialPageRoute(builder: (_) => const LoginScreen()));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             PageView(
//               controller: _ctrl,
//               onPageChanged: (i) => setState(() => _page = i),
//               children: const [_OnboardPage1(), _OnboardPage2(), _OnboardPage3()],
//             ),
//             Positioned(
//               top: 12, right: 20,
//               child: TextButton(
//                 onPressed: _goLogin,
//                 child: const Text('Skip',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', color: C.textMuted, fontSize: 13)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _OBTemplate extends StatelessWidget {
//   final Widget illustration;
//   final String title, desc, btnLabel;
//   final int pageIndex;
//   final Widget? footer;
//   const _OBTemplate({
//     required this.illustration, required this.title,
//     required this.desc, required this.btnLabel,
//     required this.pageIndex, this.footer,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final state = context.findAncestorStateOfType<_OnboardingScreenState>();
//     return Column(
//       children: [
//         Expanded(flex: 6, child: Center(child: illustration)),
//         Container(
//           height: 344,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
//             boxShadow: [BoxShadow(color: Color(0x14000000),
//                 blurRadius: 20, offset: Offset(0, -4))],
//           ),
//           padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
//           child: Column(children: [
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: List.generate(3, (i) => AnimatedContainer(
//                 duration: const Duration(milliseconds: 200),
//                 margin: const EdgeInsets.symmetric(horizontal: 3),
//                 width: i == pageIndex ? 24 : 8, height: 7,
//                 decoration: BoxDecoration(
//                   color: i == pageIndex ? C.primary : C.border,
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               )),
//             ),
//             const SizedBox(height: 18),
//             Text(title,
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 25,
//                   fontWeight: FontWeight.w700, color: C.primaryDark)),
//             const SizedBox(height: 8),
//             Text(desc,
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 18,
//                   color: C.textMuted, height: 1.6)),
//             const SizedBox(height: 20),
//             PrimaryBtn(label: btnLabel, onTap: state?.nextPage),
//             if (footer != null) ...[const SizedBox(height: 8), footer!],
//           ]),
//         ),
//       ],
//     );
//   }
// }

// class _OnboardPage1 extends StatelessWidget {
//   const _OnboardPage1();
//   @override
//   Widget build(BuildContext context) => _OBTemplate(
//     illustration: _CoupleIllustration(),
//     title: 'Find Your Soulmate',
//     desc: 'Thousands of verified Kerala profiles curated just for you, with AI-powered compatibility.',
//     btnLabel: 'Get Started →',
//     pageIndex: 0,
//     footer: TextButton(
//       onPressed: () => Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (_) => const LoginScreen())),
//       child: const Text.rich(TextSpan(children: [
//         TextSpan(text: 'Already have account? ',
//           style: TextStyle(fontFamily: 'tasaOrbiter', color: C.textMuted, fontSize: 13)),
//         TextSpan(text: 'Sign In',
//           style: TextStyle(fontFamily: 'tasaOrbiter', color: C.primary,
//               fontWeight: FontWeight.w700, fontSize: 13)),
//       ])),
//     ),
//   );
// }

// class _OnboardPage2 extends StatelessWidget {
//   const _OnboardPage2();
//   @override
//   Widget build(BuildContext context) => _OBTemplate(
//     illustration: _VerifiedIllustration(),
//     title: 'Verified Profiles Only',
//     desc: 'Every profile is manually reviewed. Gold-verified members have KYC and horoscope confirmation.',
//     btnLabel: 'Continue →',
//     pageIndex: 1,
//   );
// }

// class _OnboardPage3 extends StatelessWidget {
//   const _OnboardPage3();
//   @override
//   Widget build(BuildContext context) => _OBTemplate(
//     illustration: _AIIllustration(),
//     title: 'Smart Compatibility AI',
//     desc: 'Our AI matches you on values, tradition, lifestyle and 30+ personality traits.',
//     btnLabel: 'Start Matching 💫',
//     pageIndex: 2,
//   );
// }

// class _CoupleIllustration extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 170, height: 170,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         gradient: const LinearGradient(
//             begin: Alignment.topLeft, end: Alignment.bottomRight,
//             colors: [Colors.white, C.cardBg]),
//         border: Border.all(color: C.border, width: 2),
//       ),
//       child: Stack(alignment: Alignment.center, children: [
//         CustomPaint(size: const Size(110, 110), painter: _CouplePainter()),
//         Positioned(
//           bottom: 14, right: 14,
//           child: Container(
//             width: 28, height: 28,
//             decoration: const BoxDecoration(color: C.gold, shape: BoxShape.circle),
//             child: const Center(child: Text('💍', style: TextStyle(fontSize: 13))),
//           ),
//         ),
//       ]),
//     );
//   }
// }

// class _CouplePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size s) {
//     canvas.drawCircle(Offset(s.width * .38, s.height * .27), 14,
//         Paint()..color = C.primaryDark);
//     canvas.drawPath(
//       Path()
//         ..moveTo(s.width * .18, s.height * .72)
//         ..quadraticBezierTo(s.width * .38, s.height * .52, s.width * .58, s.height * .72)
//         ..lineTo(s.width * .58, s.height * .95)
//         ..lineTo(s.width * .18, s.height * .95)
//         ..close(),
//       Paint()..color = C.primaryDark,
//     );
//     canvas.drawCircle(Offset(s.width * .64, s.height * .29), 12,
//         Paint()..color = C.primary);
//     canvas.drawPath(
//       Path()
//         ..moveTo(s.width * .48, s.height * .74)
//         ..quadraticBezierTo(s.width * .64, s.height * .56, s.width * .82, s.height * .74)
//         ..lineTo(s.width * .82, s.height * .95)
//         ..lineTo(s.width * .48, s.height * .95)
//         ..close(),
//       Paint()..color = C.primary,
//     );
//     canvas.drawArc(
//       Rect.fromCenter(center: Offset(s.width * .5, s.height * .44), width: 16, height: 16),
//       math.pi, math.pi, false,
//       Paint()..color = C.gold..style = PaintingStyle.stroke..strokeWidth = 1.5,
//     );
//   }
//   @override bool shouldRepaint(_) => false;
// }

// class _VerifiedIllustration extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 170, height: 170,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(28),
//         gradient: const LinearGradient(
//             begin: Alignment.topLeft, end: Alignment.bottomRight,
//             colors: [Colors.white, C.cardBg]),
//         border: Border.all(color: C.border, width: 2),
//       ),
//       child: Stack(
//         alignment: Alignment.topRight,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(18),
//             child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//               _ProfileRow(color: C.primaryDark),
//               const SizedBox(height: 14),
//               _ProfileRow(color: C.primary),
//             ]),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Container(
//               width: 30, height: 30,
//               decoration: const BoxDecoration(color: C.gold, shape: BoxShape.circle),
//               child: const Icon(Icons.check, color: Colors.white, size: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ProfileRow extends StatelessWidget {
//   final Color color;
//   const _ProfileRow({required this.color});
//   @override
//   Widget build(BuildContext context) {
//     return Row(children: [
//       CircleAvatar(radius: 14, backgroundColor: color.withOpacity(0.75)),
//       const SizedBox(width: 10),
//       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         Container(width: 60, height: 8,
//             decoration: BoxDecoration(color: C.primaryDark.withOpacity(0.45),
//                 borderRadius: BorderRadius.circular(4))),
//         const SizedBox(height: 5),
//         Container(width: 40, height: 6,
//             decoration: BoxDecoration(color: C.textLight.withOpacity(0.45),
//                 borderRadius: BorderRadius.circular(4))),
//       ]),
//     ]);
//   }
// }

// class _AIIllustration extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Container(
//     width: 170, height: 170,
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       gradient: const LinearGradient(colors: [C.cardBg, Colors.white]),
//       border: Border.all(color: C.border, width: 2),
//     ),
//     child: CustomPaint(painter: _AICompatPainter()),
//   );
// }

// class _AICompatPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size s) {
//     final cx = s.width / 2, cy = s.height / 2;
//     canvas.drawCircle(Offset(cx, cy), s.width * .42,
//         Paint()..color = C.border..style = PaintingStyle.stroke..strokeWidth = 2);
//     canvas.drawCircle(Offset(cx, cy), s.width * .27, Paint()..color = C.bg);
//     canvas.drawArc(
//       Rect.fromCenter(center: Offset(cx, cy), width: 64, height: 64),
//       math.pi * 1.2, math.pi * 0.6, false,
//       Paint()..color = C.primary..style = PaintingStyle.stroke..strokeWidth = 2.5..strokeCap = StrokeCap.round,
//     );
//     canvas.drawCircle(Offset(cx - 22, cy + 5), 8, Paint()..color = C.primaryDark);
//     canvas.drawCircle(Offset(cx + 22, cy + 5), 8, Paint()..color = C.primary);
//     canvas.drawArc(
//       Rect.fromCenter(center: Offset(cx, cy + 5), width: 24, height: 18),
//       0, math.pi, false,
//       Paint()..color = C.gold..style = PaintingStyle.stroke..strokeWidth = 2..strokeCap = StrokeCap.round,
//     );
//     for (final (dx, dy, r, c) in [
//       (-50.0, -48.0, 9.0, C.primary),
//       ( 44.0, -52.0, 7.0, C.primaryDark),
//       ( 46.0,  46.0, 9.0, C.gold),
//       (-54.0,  42.0, 7.0, C.primary),
//     ]) {
//       canvas.drawCircle(Offset(cx + dx, cy + dy), r,
//           Paint()..color = c.withOpacity(0.35));
//     }
//   }
//   @override bool shouldRepaint(_) => false;
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  SCREEN 05 — LOGIN
// // ══════════════════════════════════════════════════════════════════════════════
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(children: [
//             const SizedBox(height: 48),
//             Column(children: [
//               const Center(child: Text('💍', style: TextStyle(fontSize: 30))),
//               const SizedBox(height: 10),
//               const LogoTitle(fontSize: 22),
//               const SizedBox(height: 4),
//               const Text('KERALA MATRIMONY',
//                 style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10,
//                     letterSpacing: 1.5, color: C.textMuted)),
//             ]),
//             const SizedBox(height: 36),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(24),
//                 boxShadow: [BoxShadow(color: C.primaryDark.withOpacity(0.08),
//                     blurRadius: 20, offset: const Offset(0, -4))],
//               ),
//               padding: const EdgeInsets.all(24),
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 const Text('Welcome back ',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 22,
//                       fontWeight: FontWeight.w700, color: C.primaryDark)),
//                 const SizedBox(height: 4),
//                 const Text('Sign in to continue your journey',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13, color: C.textMuted)),
//                 const SizedBox(height: 22),
//                 const Text('Mobile / Email',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 12,
//                       fontWeight: FontWeight.w600, color: C.primaryDark)),
//                 const SizedBox(height: 6),
//                 const AppInput(hint: '+91 98765 43210',
//                     prefixIcon: Icons.phone_android_rounded),
//                 const SizedBox(height: 14),
//                 const Text('Password',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 12,
//                       fontWeight: FontWeight.w600, color: C.primaryDark)),
//                 const SizedBox(height: 6),
//                 const AppInput(hint: '••••••••',
//                     prefixIcon: Icons.lock_rounded, obscure: true),
//                 const SizedBox(height: 6),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(onPressed: () {},
//                     child: const Text('Forgot Password?',
//                       style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 12,
//                           fontWeight: FontWeight.w600, color: C.primary))),
//                 ),
//                 PrimaryBtn(
//                   label: 'Sign In',
//                   onTap: () => Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (_) => const MainShell())),
//                 ),
//                 const SizedBox(height: 12),
//                 Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: C.border, width: 1.5),
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                   padding: const EdgeInsets.all(13),
//                   child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                     Text('G  ', style: TextStyle(fontFamily: 'tasaOrbiter',
//                         fontSize: 14, fontWeight: FontWeight.w700,
//                         color: Color(0xFFEA4335))),
//                     Text('Continue with Google',
//                       style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//                           fontWeight: FontWeight.w600, color: C.primaryDark)),
//                   ]),
//                 ),
//                 const SizedBox(height: 14),
//                 Center(
//                   child: TextButton(
//                     onPressed: () => Navigator.push(context,
//                         MaterialPageRoute(builder: (_) => const RegisterBasicScreen())),
//                     child: const Text.rich(TextSpan(children: [
//                       TextSpan(text: 'New here? ',
//                         style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//                             color: C.textMuted)),
//                       TextSpan(text: 'Create Account',
//                         style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//                             fontWeight: FontWeight.w700, color: C.primary)),
//                     ])),
//                   ),
//                 ),
//               ]),
//             ),
//             const SizedBox(height: 32),
//           ]),
//         ),
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  REGISTER STEP 1 — BASIC INFORMATION
// // ══════════════════════════════════════════════════════════════════════════════
// class RegisterBasicScreen extends StatefulWidget {
//   const RegisterBasicScreen({super.key});
//   @override State<RegisterBasicScreen> createState() => _RegisterBasicScreenState();
// }

// class _RegisterBasicScreenState extends State<RegisterBasicScreen> {
//   String? _gender;
//   String? _religion;
//   String? _motherTongue;
//   final _dobCtrl = TextEditingController();
//   final _emailCtrl = TextEditingController();
//   final _passCtrl = TextEditingController();
//   final _confirmCtrl = TextEditingController();
//   bool _showPass = false;
//   bool _showConfirm = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: SafeArea(
//         child: Column(children: [
//           RegStepHeader(currentStep: 0, title: 'Basic Information'),
//           const SizedBox(height: 8),
//           RegIllustrationPanel(title: 'Basic\nInformation'),
//           const SizedBox(height: 4),
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//               ),
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   const Text('Provide your basic information',
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 15,
//                         fontWeight: FontWeight.w700, color: C.primaryDark)),
//                   const SizedBox(height: 18),

//                   // Date of Birth
//                   _FieldLabel('Date of Birth *'),
//                   AppInput(hint: 'DD-MM-YYYY', controller: _dobCtrl,
//                     prefixIcon: Icons.calendar_today_rounded,
//                     keyboardType: TextInputType.datetime),
//                   const SizedBox(height: 14),

//                   // Gender
//                   _FieldLabel('Gender *'),
//                   Row(children: [
//                     ToggleBtn(label: 'Male', active: _gender == 'Male',
//                       onTap: () => setState(() => _gender = 'Male')),
//                     const SizedBox(width: 10),
//                     ToggleBtn(label: 'Female', active: _gender == 'Female',
//                       onTap: () => setState(() => _gender = 'Female')),
//                   ]),
//                   const SizedBox(height: 14),

//                   // Religion & Mother Tongue side by side
//                   Row(children: [
//                     Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       _FieldLabel('Religion *'),
//                       AppDropdown(
//                         hint: 'Select',
//                         value: _religion,
//                         items: const ['Hindu', 'Muslim', 'Christian', 'Sikh', 'Jain', 'Other'],
//                         onChanged: (v) => setState(() => _religion = v),
//                       ),
//                     ])),
//                     const SizedBox(width: 10),
//                     Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       _FieldLabel('Mother Tongue *'),
//                       AppDropdown(
//                         hint: 'Select',
//                         value: _motherTongue,
//                         items: const ['Malayalam', 'Tamil', 'Telugu', 'Kannada', 'Hindi', 'English'],
//                         onChanged: (v) => setState(() => _motherTongue = v),
//                       ),
//                     ])),
//                   ]),
//                   const SizedBox(height: 14),

//                   // Email
//                   _FieldLabel('Email *'),
//                   AppInput(hint: 'Your Email', controller: _emailCtrl,
//                     prefixIcon: Icons.email_rounded,
//                     keyboardType: TextInputType.emailAddress),
//                   const SizedBox(height: 14),

//                   // Password
//                   _FieldLabel('Password'),
//                   _PasswordField(
//                     hint: 'Min 8 characters',
//                     controller: _passCtrl,
//                     show: _showPass,
//                     onToggle: () => setState(() => _showPass = !_showPass),
//                   ),
//                   const SizedBox(height: 4),
//                   const Text('eg. Abcd@123 minimum 8 characters – maximum 20',
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10, color: C.textLight)),
//                   const SizedBox(height: 14),

//                   // Confirm Password
//                   _FieldLabel('Confirm Password'),
//                   _PasswordField(
//                     hint: 'Re-enter password',
//                     controller: _confirmCtrl,
//                     show: _showConfirm,
//                     onToggle: () => setState(() => _showConfirm = !_showConfirm),
//                   ),
//                   const SizedBox(height: 24),

//                   PrimaryBtn(
//                     label: 'Continue →',
//                     onTap: () => Navigator.push(context,
//                         MaterialPageRoute(builder: (_) => const RegisterCommunityScreen())),
//                   ),
//                 ]),
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

// class _FieldLabel extends StatelessWidget {
//   final String text;
//   const _FieldLabel(this.text);
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Text(text,
//         style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 11,
//             fontWeight: FontWeight.w600, color: C.primaryDark)),
//     );
//   }
// }

// class _PasswordField extends StatelessWidget {
//   final String hint;
//   final TextEditingController? controller;
//   final bool show;
//   final VoidCallback onToggle;
//   const _PasswordField({required this.hint, this.controller,
//     required this.show, required this.onToggle});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: C.cardBg,
//         border: Border.all(color: C.border, width: 1.5),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(children: [
//         Expanded(
//           child: TextField(
//             controller: controller,
//             obscureText: !show,
//             style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13, color: C.primaryDark),
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13, color: C.textLight),
//               border: InputBorder.none,
//               prefixIcon: const Icon(Icons.lock_rounded, color: C.secondary, size: 18),
//               contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: onToggle,
//           child: Padding(
//             padding: const EdgeInsets.only(right: 12),
//             child: Icon(show ? Icons.visibility_off_rounded : Icons.visibility_rounded,
//               color: C.textLight, size: 18),
//           ),
//         ),
//       ]),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  REGISTER STEP 2 — COMMUNITY & LOCATION
// // ══════════════════════════════════════════════════════════════════════════════
// class RegisterCommunityScreen extends StatefulWidget {
//   const RegisterCommunityScreen({super.key});
//   @override State<RegisterCommunityScreen> createState() => _RegisterCommunityState();
// }

// class _RegisterCommunityState extends State<RegisterCommunityScreen> {
//   String? _religion = 'Hindu';
//   String? _caste;
//   String? _subCaste;
//   String? _gotra = "Don't Know";
//   String? _otherCastes = 'No';
//   String? _country = 'India';
//   String? _state = 'Kerala';
//   String? _district;
//   String? _permDistrict;
//   bool _isSameAddress = true;
//   final _ancestralCtrl = TextEditingController();
//   final _addressCtrl = TextEditingController();
//   final _zipCtrl = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: SafeArea(
//         child: Column(children: [
//           RegStepHeader(currentStep: 1, title: 'Community & Location'),
//           const SizedBox(height: 8),
//           RegIllustrationPanel(title: 'Community &\nLocation'),
//           const SizedBox(height: 4),
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//               ),
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   const Text('Tell about your Community & Location',
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 15,
//                         fontWeight: FontWeight.w700, color: C.primaryDark)),
//                   const SizedBox(height: 18),

//                   // Religion & Caste
//                   Row(children: [
//                     Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       _FieldLabel('Religion *'),
//                       AppDropdown(hint: 'Select', value: _religion,
//                         items: const ['Hindu', 'Muslim', 'Christian', 'Sikh', 'Jain', 'Other'],
//                         onChanged: (v) => setState(() => _religion = v)),
//                     ])),
//                     const SizedBox(width: 10),
//                     Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       _FieldLabel('Caste *'),
//                       AppDropdown(hint: 'Select Caste', value: _caste,
//                         items: const ['Nair', 'Ezhava', 'Brahmin', 'Kshatriya', 'Vishwakarma', 'Other'],
//                         onChanged: (v) => setState(() => _caste = v)),
//                     ])),
//                   ]),
//                   const SizedBox(height: 14),

//                   // Other castes toggle
//                   Row(children: [
//                     const Expanded(child: Text(
//                       'Looking for matches from other castes\n(other than own sub castes)?',
//                       style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 11, color: C.primaryDark))),
//                     const SizedBox(width: 8),
//                     SizedBox(
//                       width: 100,
//                       child: AppDropdown(hint: 'No', value: _otherCastes,
//                         items: const ['Yes', 'No'],
//                         onChanged: (v) => setState(() => _otherCastes = v)),
//                     ),
//                   ]),
//                   const SizedBox(height: 14),

//                   // SubCaste & Gotra
//                   Row(children: [
//                     Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       _FieldLabel('SubCaste'),
//                       AppDropdown(hint: 'Select', value: _subCaste,
//                         items: const ['Kiriyathil Nair', 'Illom Nair', 'Sudra Nair', 'Other'],
//                         onChanged: (v) => setState(() => _subCaste = v)),
//                     ])),
//                     const SizedBox(width: 10),
//                     Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       _FieldLabel('Gotra'),
//                       AppDropdown(hint: "Don't Know", value: _gotra,
//                         items: const ["Don't Know", 'Kashyapa', 'Bharadwaja', 'Atri', 'Vasishtha'],
//                         onChanged: (v) => setState(() => _gotra = v)),
//                     ])),
//                   ]),
//                   const SizedBox(height: 14),

//                   // Native Place
//                   _FieldLabel('Native Place / Ancestral Origin'),
//                   Row(children: [
//                     Expanded(child: AppDropdown(hint: 'India', value: _country,
//                       items: const ['India', 'UAE', 'USA', 'UK', 'Canada', 'Australia'],
//                       onChanged: (v) => setState(() => _country = v))),
//                     const SizedBox(width: 8),
//                     Expanded(child: AppDropdown(hint: 'Kerala', value: _state,
//                       items: const ['Kerala', 'Tamil Nadu', 'Karnataka', 'Maharashtra', 'Other'],
//                       onChanged: (v) => setState(() => _state = v))),
//                     const SizedBox(width: 8),
//                     Expanded(child: AppDropdown(hint: 'Select District', value: _district,
//                       items: const ['Thrissur', 'Kochi', 'Trivandrum', 'Calicut', 'Palakkad', 'Kannur', 'Kollam'],
//                       onChanged: (v) => setState(() => _district = v))),
//                   ]),
//                   const SizedBox(height: 8),
//                   AppTextArea(hint: 'Tell about your ancestral origin', controller: _ancestralCtrl),
//                   const SizedBox(height: 14),

//                   // Permanent Residence
//                   _FieldLabel('Permanent Residence *'),
//                   Row(children: [
//                     Expanded(child: AppDropdown(hint: 'India', value: _country,
//                       items: const ['India', 'UAE', 'USA', 'UK', 'Canada', 'Australia'],
//                       onChanged: (v) => setState(() => _country = v))),
//                     const SizedBox(width: 8),
//                     Expanded(child: AppDropdown(hint: 'Kerala', value: _state,
//                       items: const ['Kerala', 'Tamil Nadu', 'Karnataka', 'Maharashtra'],
//                       onChanged: (v) => setState(() => _state = v))),
//                   ]),
//                   const SizedBox(height: 8),
//                   Row(children: [
//                     Expanded(child: AppDropdown(hint: 'Select District', value: _permDistrict,
//                       items: const ['Thrissur', 'Kochi', 'Trivandrum', 'Calicut', 'Palakkad'],
//                       onChanged: (v) => setState(() => _permDistrict = v))),
//                     const SizedBox(width: 8),
//                     Expanded(child: AppInput(hint: 'Enter ZIP Code',
//                       controller: _zipCtrl, keyboardType: TextInputType.number)),
//                   ]),
//                   const SizedBox(height: 14),

//                   // Home Address
//                   _FieldLabel('Home Address *'),
//                   AppInput(hint: 'Enter Home Address', controller: _addressCtrl),
//                   const SizedBox(height: 10),

//                   // Current address toggle
//                   Row(children: [
//                     const Expanded(child: Text('Is this your current address?',
//                       style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 12, color: C.primaryDark))),
//                     ToggleBtn(label: 'Yes', active: _isSameAddress,
//                       onTap: () => setState(() => _isSameAddress = true)),
//                     const SizedBox(width: 8),
//                     ToggleBtn(label: 'No', active: !_isSameAddress,
//                       onTap: () => setState(() => _isSameAddress = false)),
//                   ]),
//                   const SizedBox(height: 24),

//                   PrimaryBtn(
//                     label: 'Continue →',
//                     onTap: () => Navigator.push(context,
//                         MaterialPageRoute(builder: (_) => const RegisterProfessionalScreen())),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text('After completing the registration, you can edit the profile from your personal dashboard.',
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10, color: C.primary)),
//                 ]),
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  REGISTER STEP 3 — PROFESSIONAL DETAILS
// // ══════════════════════════════════════════════════════════════════════════════
// class RegisterProfessionalScreen extends StatefulWidget {
//   const RegisterProfessionalScreen({super.key});
//   @override State<RegisterProfessionalScreen> createState() => _RegisterProfessionalState();
// }

// class _RegisterProfessionalState extends State<RegisterProfessionalScreen> {
//   String? _education;
//   String? _occupation;
//   String? _workCountry;
//   String? _state;
//   String? _city;
//   String? _residentialStatus;
//   String? _incomeRange;
//   String? _incomeCurrency = '₹';
//   final _educDetailCtrl = TextEditingController();
//   final _langCtrl = TextEditingController();
//   final Set<String> _selectedSectors = {};

//   static const _sectors = [
//     'Healthcare', 'Information Technology', 'Farmer', 'Defence',
//     'Government/PSU', 'Private sector', 'Business', 'Others'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: SafeArea(
//         child: Column(children: [
//           RegStepHeader(currentStep: 2, title: 'Professional Details'),
//           const SizedBox(height: 8),
//           RegIllustrationPanel(title: 'Professional\nDetails'),
//           const SizedBox(height: 4),
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//               ),
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   const Text('Professional Details help us to find the best companion',
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 15,
//                         fontWeight: FontWeight.w700, color: C.primaryDark)),
//                   const SizedBox(height: 18),

//                   // Highest Education
//                   _FieldLabel('Highest Education *'),
//                   AppDropdown(hint: 'Select Education', value: _education,
//                     items: const [
//                       'High School', 'Diploma', 'B.Tech / B.E', 'BCA', 'B.Com', 'B.Sc',
//                       'MBA', 'M.Tech / M.E', 'MCA', 'M.Com', 'MBBS', 'MD', 'CA', 'PhD', 'Other'
//                     ],
//                     onChanged: (v) => setState(() => _education = v)),
//                   const SizedBox(height: 14),

//                   // Education Detail
//                   _FieldLabel('Education in Detail'),
//                   AppTextArea(hint: 'Write a brief description', controller: _educDetailCtrl),
//                   const SizedBox(height: 14),

//                   // Languages
//                   _FieldLabel('Languages known'),
//                   AppInput(hint: 'Select languages', controller: _langCtrl,
//                     prefixIcon: Icons.language_rounded),
//                   const SizedBox(height: 14),

//                   // Employed in sectors
//                   _FieldLabel('Employed in'),
//                   Wrap(
//                     spacing: 8,
//                     runSpacing: 8,
//                     children: _sectors.map((s) => SectorChip(
//                       label: s,
//                       active: _selectedSectors.contains(s),
//                       onTap: () => setState(() {
//                         if (_selectedSectors.contains(s)) {
//                           _selectedSectors.remove(s);
//                         } else {
//                           _selectedSectors.add(s);
//                         }
//                       }),
//                     )).toList(),
//                   ),
//                   const SizedBox(height: 14),

//                   // Occupation & Working Country
//                   Row(children: [
//                     Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       _FieldLabel('Occupation *'),
//                       AppDropdown(hint: 'Select', value: _occupation,
//                         items: const ['Software Engineer', 'Doctor', 'Nurse', 'Teacher', 'Engineer',
//                           'Accountant', 'Lawyer', 'Business', 'Government Employee', 'Other'],
//                         onChanged: (v) => setState(() => _occupation = v)),
//                     ])),
//                     const SizedBox(width: 10),
//                     Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       _FieldLabel('Working Country'),
//                       AppDropdown(hint: 'Select', value: _workCountry,
//                         items: const ['India', 'UAE', 'USA', 'UK', 'Canada', 'Australia', 'Saudi Arabia'],
//                         onChanged: (v) => setState(() => _workCountry = v)),
//                     ])),
//                   ]),
//                   const SizedBox(height: 14),

//                   // State & City
//                   Row(children: [
//                     Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       _FieldLabel('State'),
//                       AppDropdown(hint: 'Select State', value: _state,
//                         items: const ['Kerala', 'Tamil Nadu', 'Karnataka', 'Maharashtra', 'Other'],
//                         onChanged: (v) => setState(() => _state = v)),
//                     ])),
//                     const SizedBox(width: 10),
//                     Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       _FieldLabel('City'),
//                       AppDropdown(hint: 'Select', value: _city,
//                         items: const ['Kochi', 'Thrissur', 'Trivandrum', 'Calicut', 'Kannur'],
//                         onChanged: (v) => setState(() => _city = v)),
//                     ])),
//                   ]),
//                   const SizedBox(height: 14),

//                   // Residential Status & Annual Income
//                   Row(children: [
//                     Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       _FieldLabel('Residential Status'),
//                       AppDropdown(hint: 'Select', value: _residentialStatus,
//                         items: const ['Permanent Resident', 'Work Permit', 'Student Visa', 'Citizen'],
//                         onChanged: (v) => setState(() => _residentialStatus = v)),
//                     ])),
//                     const SizedBox(width: 10),
//                     Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       _FieldLabel('Annual Income'),
//                       Row(children: [
//                         SizedBox(
//                           width: 64,
//                           child: AppDropdown(hint: '₹', value: _incomeCurrency,
//                             items: const ['₹', '\$', '£', '€', 'AED'],
//                             onChanged: (v) => setState(() => _incomeCurrency = v)),
//                         ),
//                         const SizedBox(width: 6),
//                         Expanded(child: AppDropdown(hint: 'Select', value: _incomeRange,
//                           items: const [
//                             '< 2 Lakhs', '2–5 Lakhs', '5–8 Lakhs', '8–12 Lakhs',
//                             '12–20 Lakhs', '20–30 Lakhs', '30+ Lakhs'
//                           ],
//                           onChanged: (v) => setState(() => _incomeRange = v))),
//                       ]),
//                     ])),
//                   ]),
//                   const SizedBox(height: 24),

//                   PrimaryBtn(
//                     label: 'Continue →',
//                     onTap: () => Navigator.push(context,
//                         MaterialPageRoute(builder: (_) => const RegisterPhysicalScreen())),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text('After completing the registration you can edit the profile from your personal dashboard',
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10, color: C.primary)),
//                 ]),
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  REGISTER STEP 4 — PERSONAL & PHYSICAL
// // ══════════════════════════════════════════════════════════════════════════════
// class RegisterPhysicalScreen extends StatefulWidget {
//   const RegisterPhysicalScreen({super.key});
//   @override State<RegisterPhysicalScreen> createState() => _RegisterPhysicalState();
// }

// class _RegisterPhysicalState extends State<RegisterPhysicalScreen> {
//   String _maritalStatus = 'Unmarried';
//   int _children = 0;
//   String? _height;
//   String? _weight;
//   String? _skinColor;
//   String? _bodyType;
//   String? _bloodGroup;
//   String? _disability = 'Any disability - No';
//   bool _hasSurgery = false;
//   String? _diet;
//   String? _smoking;
//   String? _drinking;
//   bool _hasPets = false;
//   final _descCtrl = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: SafeArea(
//         child: Column(children: [
//           RegStepHeader(currentStep: 3, title: 'Personal & Physical'),
//           const SizedBox(height: 8),
//           RegIllustrationPanel(title: 'Personal &\nPhysical'),
//           const SizedBox(height: 4),
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//               ),
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   const Text('Personal & Physical Details',
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 15,
//                         fontWeight: FontWeight.w700, color: C.primaryDark)),
//                   const SizedBox(height: 18),

//                   // Marital Status
//                   _FieldLabel('Marital Status'),
//                   Row(children: [
//                     ToggleBtn(label: 'Unmarried', active: _maritalStatus == 'Unmarried',
//                       onTap: () => setState(() => _maritalStatus = 'Unmarried')),
//                     const SizedBox(width: 10),
//                     ToggleBtn(label: 'Divorcee', active: _maritalStatus == 'Divorcee',
//                       onTap: () => setState(() => _maritalStatus = 'Divorcee')),
//                     const SizedBox(width: 10),
//                     ToggleBtn(label: 'Widowed', active: _maritalStatus == 'Widowed',
//                       onTap: () => setState(() => _maritalStatus = 'Widowed')),
//                   ]),
//                   const SizedBox(height: 14),

//                   // Number of Children
//                   _FieldLabel('Number of Children'),
//                   Row(children: [
//                     GestureDetector(
//                       onTap: () => setState(() { if (_children > 0) _children--; }),
//                       child: Container(
//                         width: 36, height: 36,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: C.border, width: 1.5),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: const Center(child: Text('–',
//                           style: TextStyle(fontSize: 18, color: C.primaryDark))),
//                       ),
//                     ),
//                     Container(
//                       width: 50, height: 36,
//                       margin: const EdgeInsets.symmetric(horizontal: 8),
//                       decoration: BoxDecoration(
//                         color: C.cardBg,
//                         border: Border.all(color: C.border, width: 1.5),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Center(child: Text('$_children',
//                         style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 14,
//                             fontWeight: FontWeight.w700, color: C.primaryDark))),
//                     ),
//                     GestureDetector(
//                       onTap: () => setState(() => _children++),
//                       child: Container(
//                         width: 36, height: 36,
//                         decoration: BoxDecoration(
//                           color: C.primary,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: const Center(child: Text('+',
//                           style: TextStyle(fontSize: 18, color: Colors.white))),
//                       ),
//                     ),
//                   ]),
//                   const SizedBox(height: 14),

//                   // Physical Details
//                   _FieldLabel('Physical Details'),
//                   Row(children: [
//                     Expanded(child: AppDropdown(hint: 'Height (cm)', value: _height,
//                       items: List.generate(50, (i) => '${140 + i} cm'),
//                       onChanged: (v) => setState(() => _height = v))),
//                     const SizedBox(width: 10),
//                     Expanded(child: AppDropdown(hint: 'Weight (Kg)', value: _weight,
//                       items: List.generate(80, (i) => '${40 + i} kg'),
//                       onChanged: (v) => setState(() => _weight = v))),
//                   ]),
//                   const SizedBox(height: 8),
//                   Row(children: [
//                     Expanded(child: AppDropdown(hint: 'Skin Color', value: _skinColor,
//                       items: const ['Very Fair', 'Fair', 'Wheatish', 'Wheatish Brown', 'Dark'],
//                       onChanged: (v) => setState(() => _skinColor = v))),
//                     const SizedBox(width: 10),
//                     Expanded(child: AppDropdown(hint: 'Body Type', value: _bodyType,
//                       items: const ['Slim', 'Athletic', 'Average', 'Heavy'],
//                       onChanged: (v) => setState(() => _bodyType = v))),
//                   ]),
//                   const SizedBox(height: 8),
//                   Row(children: [
//                     Expanded(child: AppDropdown(hint: 'Blood Group', value: _bloodGroup,
//                       items: const ['A+', 'A–', 'B+', 'B–', 'O+', 'O–', 'AB+', 'AB–'],
//                       onChanged: (v) => setState(() => _bloodGroup = v))),
//                     const SizedBox(width: 10),
//                     Expanded(child: AppDropdown(hint: 'Any disability - No', value: _disability,
//                       items: const ['Any disability - No', 'Physically Challenged', 'Hearing Impaired', 'Visually Impaired'],
//                       onChanged: (v) => setState(() => _disability = v))),
//                   ]),
//                   const SizedBox(height: 8),
//                   AppTextArea(hint: 'Write a brief description', controller: _descCtrl),
//                   const SizedBox(height: 14),

//                   // Surgical
//                   _FieldLabel('Any major surgical treatment or organ replacing done?'),
//                   Row(children: [
//                     ToggleBtn(label: 'No', active: !_hasSurgery,
//                       onTap: () => setState(() => _hasSurgery = false)),
//                     const SizedBox(width: 10),
//                     ToggleBtn(label: 'Yes', active: _hasSurgery,
//                       onTap: () => setState(() => _hasSurgery = true)),
//                   ]),
//                   const SizedBox(height: 14),

//                   // Diet, Smoking, Drinking
//                   Row(children: [
//                     Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       _FieldLabel('Diet'),
//                       AppDropdown(hint: 'Diet', value: _diet,
//                         items: const ['Vegetarian', 'Non-Vegetarian', 'Vegan', 'Eggetarian', 'Jain'],
//                         onChanged: (v) => setState(() => _diet = v)),
//                     ])),
//                     const SizedBox(width: 10),
//                     Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       _FieldLabel('Smoking'),
//                       AppDropdown(hint: 'Smoking', value: _smoking,
//                         items: const ['No', 'Occasionally', 'Yes'],
//                         onChanged: (v) => setState(() => _smoking = v)),
//                     ])),
//                   ]),
//                   const SizedBox(height: 8),
//                   Row(children: [
//                     Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       _FieldLabel('Drinking'),
//                       AppDropdown(hint: 'Drinking', value: _drinking,
//                         items: const ['No', 'Occasionally', 'Yes'],
//                         onChanged: (v) => setState(() => _drinking = v)),
//                     ])),
//                     const SizedBox(width: 10),
//                     const Expanded(child: SizedBox()),
//                   ]),
//                   const SizedBox(height: 14),

//                   // Pets
//                   _FieldLabel('Do you have any pets?'),
//                   Row(children: [
//                     ToggleBtn(label: 'No', active: !_hasPets,
//                       onTap: () => setState(() => _hasPets = false)),
//                     const SizedBox(width: 10),
//                     ToggleBtn(label: 'Yes', active: _hasPets,
//                       onTap: () => setState(() => _hasPets = true)),
//                   ]),
//                   const SizedBox(height: 24),

//                   // Continue & Submit
//                   Row(children: [
//                     Expanded(child: OutlineBtn(
//                       label: 'Continue →',
//                       onTap: () => Navigator.push(context,
//                           MaterialPageRoute(builder: (_) => const RegisterEducationScreen())),
//                     )),
//                     const SizedBox(width: 10),
//                     Expanded(child: PrimaryBtn(
//                       label: 'Submit',
//                       onTap: () => Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (_) => const OtpScreen())),
//                     )),
//                   ]),
//                   const SizedBox(height: 10),
//                   const Text('After completing the registration you can edit the profile from your personal dashboard.',
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10, color: C.primary)),
//                 ]),
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  REGISTER STEP 5 — EDUCATION & CAREER (original step 3)
// // ══════════════════════════════════════════════════════════════════════════════
// class RegisterEducationScreen extends StatelessWidget {
//   const RegisterEducationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: SafeArea(
//         child: Column(children: [
//           RegStepHeader(currentStep: 4, title: 'Education & Career'),
//           const SizedBox(height: 16),
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//               ),
//               padding: const EdgeInsets.all(22),
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 const Text('Education & Career',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 16,
//                       fontWeight: FontWeight.w700, color: C.primaryDark)),
//                 const SizedBox(height: 18),
//                 const Text('Highest Qualification',
//                   style: TextStyle(fontFamily:'tasaOrbiter', fontSize: 11, color: C.textMuted)),
//                 const SizedBox(height: 6),
//                 const AppInput(hint: 'B.Tech — Computer Science'),
//                 const SizedBox(height: 14),
//                 const Text('Occupation',
//                   style: TextStyle(fontFamily:'tasaOrbiter', fontSize: 11, color: C.textMuted)),
//                 const SizedBox(height: 6),
//                 const AppInput(hint: 'Software Engineer'),
//                 const SizedBox(height: 14),
//                 const Text('Annual Income',
//                   style: TextStyle(fontFamily:'tasaOrbiter', fontSize: 11, color: C.textMuted)),
//                 const SizedBox(height: 6),
//                 const AppInput(hint: '₹8 – 12 Lakhs'),
//                 const Spacer(),
//                 PrimaryBtn(
//                   label: 'Continue →',
//                   onTap: () => Navigator.push(context,
//                       MaterialPageRoute(builder: (_) => const OtpScreen())),
//                 ),
//               ]),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  SCREEN 07 — OTP VERIFY
// // ══════════════════════════════════════════════════════════════════════════════
// class OtpScreen extends StatelessWidget {
//   const OtpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(children: [
//             const SizedBox(height: 48),
//             Container(
//               width: 84, height: 84,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: const LinearGradient(colors: [C.cardBg, C.bg]),
//                 border: Border.all(color: C.border, width: 2),
//               ),
//               child: const Center(child: Text('📱', style: TextStyle(fontSize: 36))),
//             ),
//             const SizedBox(height: 22),
//             const Text('Verify Mobile',
//               style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 22,
//                   fontWeight: FontWeight.w700, color: C.primaryDark)),
//             const SizedBox(height: 8),
//             const Text.rich(
//               TextSpan(children: [
//                 TextSpan(text: "We've sent a 6-digit OTP to\n",
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//                       color: C.textMuted, height: 1.7)),
//                 TextSpan(text: '+91 98765 43210',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//                       fontWeight: FontWeight.w700, color: C.primaryDark)),
//               ]),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 32),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _OtpBox(value: '3', filled: true),
//                 _OtpBox(value: '7', filled: true),
//                 _OtpBox(value: '', filled: false),
//                 _OtpBox(value: '', filled: false),
//                 _OtpBox(value: '', filled: false),
//                 _OtpBox(value: '', filled: false),
//               ],
//             ),
//             const SizedBox(height: 32),
//             PrimaryBtn(
//               label: 'Verify OTP',
//               onTap: () => Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (_) => const MainShell())),
//             ),
//             const SizedBox(height: 18),
//             const Text.rich(TextSpan(children: [
//               TextSpan(text: "Didn't receive? ",
//                 style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13, color: C.textMuted)),
//               TextSpan(text: 'Resend in 00:42',
//                 style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//                     fontWeight: FontWeight.w600, color: C.primary)),
//             ])),
//           ]),
//         ),
//       ),
//     );
//   }
// }

// class _OtpBox extends StatelessWidget {
//   final String value;
//   final bool filled;
//   const _OtpBox({required this.value, required this.filled});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 44, height: 54,
//       margin: const EdgeInsets.symmetric(horizontal: 5),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: filled ? C.primary : C.border, width: 2),
//       ),
//       child: Center(
//         child: Text(filled ? value : '·',
//           style: TextStyle(fontFamily: 'tasaOrbiter',
//               fontSize: filled ? 20 : 26, fontWeight: FontWeight.w700,
//               color: filled ? C.primaryDark : C.border)),
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  MAIN SHELL — Bottom nav host
// // ══════════════════════════════════════════════════════════════════════════════
// class MainShell extends StatefulWidget {
//   const MainShell({super.key});
//   @override State<MainShell> createState() => _MainShellState();
// }

// class _MainShellState extends State<MainShell> {
//   int _idx = 0;
//   final _screens = const [
//     HomeScreen(),
//     SearchScreen(),
//     MatchesScreen(),
//     ChatListScreen(),
//     SettingsScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_idx],
//       bottomNavigationBar: MainBottomNav(
//         currentIndex: _idx,
//         onTap: (i) => setState(() => _idx = i),
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  SCREEN 08 — HOME
// // ══════════════════════════════════════════════════════════════════════════════
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: SafeArea(
//         child: Column(children: [
//           Container(
//             color: Colors.white,
//             padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
//             child: Row(children: [
//               const Text('💍', style: TextStyle(fontSize: 22)),
//               const SizedBox(width: 8),
//               const LogoTitle(fontSize: 14),
//               const Spacer(),
//               GestureDetector(
//                 onTap: () => Navigator.push(context,
//                     MaterialPageRoute(builder: (_) => const NotificationsScreen())),
//                 child: const Icon(Icons.notifications_rounded,
//                     color: C.primaryDark, size: 22)),
//               const SizedBox(width: 12),
//               Container(
//                 width: 36, height: 36,
//                 decoration: const BoxDecoration(color: C.primary, shape: BoxShape.circle),
//                 child: const Center(child: Text('A',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 14,
//                       fontWeight: FontWeight.w700, color: Colors.white))),
//               ),
//             ]),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                         colors: [C.primaryDark, C.primary],
//                         begin: Alignment.centerLeft, end: Alignment.centerRight),
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                   padding: const EdgeInsets.all(16),
//                   child: const Row(children: [
//                     Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       Text('Hello, Arjun! 👋',
//                         style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 15,
//                             fontWeight: FontWeight.w700, color: Colors.white)),
//                       SizedBox(height: 4),
//                       Text('12 new matches today ✨',
//                         style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 11,
//                             color: Colors.white70)),
//                     ]),
//                     Spacer(),
//                     Text('💐', style: TextStyle(fontSize: 30)),
//                   ]),
//                 ),
//                 const SizedBox(height: 14),
//                 Container(
//                   decoration: BoxDecoration(color: Colors.white,
//                       border: Border.all(color: C.border, width: 1.5),
//                       borderRadius: BorderRadius.circular(14)),
//                   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//                   child: const Row(children: [
//                     Icon(Icons.search_rounded, color: C.textLight, size: 18),
//                     SizedBox(width: 8),
//                     Text('Search by name, community...',
//                       style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 12,
//                           color: C.textLight)),
//                   ]),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text('Recommended Matches',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 14,
//                       fontWeight: FontWeight.w700, color: C.primaryDark)),
//                 const SizedBox(height: 10),
//                 Row(children: [
//                   Expanded(child: _MatchCard(
//                     name: 'Priya R., 27', sub: 'Doctor · Kochi',
//                     emoji: '👩', bgColor: const Color(0xFFE8C4C0), score: '94%',
//                     onTap: () => Navigator.push(context,
//                         MaterialPageRoute(builder: (_) => const ProfileDetailScreen())),
//                   )),
//                   const SizedBox(width: 10),
//                   Expanded(child: _MatchCard(
//                     name: 'Deepa M., 26', sub: 'CA · Thrissur',
//                     emoji: '👩', bgColor: const Color(0xFFC4D4E8), score: '89%',
//                   )),
//                 ]),
//                 const SizedBox(height: 20),
//                 const Text('Recently Viewed',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 14,
//                       fontWeight: FontWeight.w700, color: C.primaryDark)),
//                 const SizedBox(height: 10),
//                 Row(children: [
//                   Expanded(child: _MatchCard(
//                     name: 'Ananya K., 25', sub: 'Engineer · TVM',
//                     emoji: '👩', bgColor: const Color(0xFFD4E8C4), score: '86%',
//                   )),
//                   const SizedBox(width: 10),
//                   Expanded(child: _MatchCard(
//                     name: 'Meera S., 28', sub: 'Teacher · Calicut',
//                     emoji: '👩', bgColor: const Color(0xFFE8D4C4), score: '82%',
//                   )),
//                 ]),
//                 const SizedBox(height: 10),
//                 GestureDetector(
//                   onTap: () => Navigator.push(context,
//                       MaterialPageRoute(builder: (_) => const WeddingStoriesScreen())),
//                   child: const AppCard(
//                     child: Row(children: [
//                       Text('💕', style: TextStyle(fontSize: 22)),
//                       SizedBox(width: 12),
//                       Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                         Text('Wedding Stories',
//                           style: TextStyle(fontFamily:'tasaOrbiter', fontSize: 13,
//                               fontWeight: FontWeight.w700, color: C.primaryDark)),
//                         Text('Real couples, real Kerala love stories',
//                           style: TextStyle(fontFamily:'tasaOrbiter', fontSize: 11,
//                               color: C.textMuted)),
//                       ])),
//                       Icon(Icons.chevron_right_rounded, color: C.border),
//                     ]),
//                   ),
//                 ),
//               ]),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

// class _MatchCard extends StatelessWidget {
//   final String name, sub, emoji, score;
//   final Color bgColor;
//   final VoidCallback? onTap;
//   const _MatchCard({required this.name, required this.sub, required this.emoji,
//     required this.bgColor, required this.score, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AppCard(
//         padding: const EdgeInsets.all(10),
//         child: Column(children: [
//           Container(
//             width: double.infinity, height: 80,
//             decoration: BoxDecoration(color: bgColor,
//                 borderRadius: BorderRadius.circular(12)),
//             child: Center(child: Text(emoji,
//                 style: const TextStyle(fontSize: 32))),
//           ),
//           const SizedBox(height: 8),
//           Text(name, style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 12,
//               fontWeight: FontWeight.w700, color: C.primaryDark)),
//           Text(sub, style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10,
//               color: C.textMuted)),
//           const SizedBox(height: 6),
//           BadgeGreen(label: '⭐ $score'),
//         ]),
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  SCREEN 09 — MATCH RECOMMENDATIONS
// // ══════════════════════════════════════════════════════════════════════════════
// class MatchesScreen extends StatelessWidget {
//   const MatchesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: SafeArea(
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           const Padding(
//             padding: EdgeInsets.fromLTRB(16, 20, 16, 14),
//             child: Text('Profile Matches',
//               style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 18,
//                   fontWeight: FontWeight.w700, color: C.primaryDark)),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(children: [
//                 GestureDetector(
//                   onTap: () => Navigator.push(context,
//                       MaterialPageRoute(builder: (_) => const ProfileDetailScreen())),
//                   child: AppCard(
//                     padding: EdgeInsets.zero,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(16),
//                       child: Column(children: [
//                         Stack(children: [
//                           Container(
//                             width: double.infinity, height: 200,
//                             decoration: const BoxDecoration(
//                               gradient: LinearGradient(colors: [
//                                 Color(0xFFE8C4C0), Color(0xFFF3C7C2)])),
//                             child: const Center(child: Text('👩',
//                                 style: TextStyle(fontSize: 80))),
//                           ),
//                           Positioned(top: 10, right: 10,
//                             child: Container(
//                               decoration: BoxDecoration(color: Colors.white,
//                                   borderRadius: BorderRadius.circular(20)),
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 4),
//                               child: const Text('⭐ 94%',
//                                 style: TextStyle(fontFamily: 'tasaOrbiter',
//                                     fontSize: 11, fontWeight: FontWeight.w700,
//                                     color: C.green)),
//                             ),
//                           ),
//                           const Positioned(bottom: 10, left: 10,
//                             child: BadgeGold(label: '✓ Verified')),
//                         ]),
//                         Padding(
//                           padding: const EdgeInsets.all(14),
//                           child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text('Priya Ramachandran, 27',
//                                 style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 16,
//                                     fontWeight: FontWeight.w700, color: C.primaryDark)),
//                               const Text('MBBS Doctor · Nair · Kochi',
//                                 style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 11,
//                                     color: C.textMuted)),
//                               const SizedBox(height: 8),
//                               const Wrap(spacing: 6, runSpacing: 6, children: [
//                                 TagChip(label: 'Hindu'),
//                                 TagChip(label: 'Kochi'),
//                                 TagChip(label: '5′4″'),
//                               ]),
//                               const SizedBox(height: 12),
//                               Row(children: [
//                                 Expanded(child: PrimaryBtn(
//                                   label: '💌 Interest',
//                                   onTap: () => Navigator.push(context,
//                                       MaterialPageRoute(builder: (_) =>
//                                       const InterestSentScreen())),
//                                 )),
//                                 const SizedBox(width: 10),
//                                 Expanded(child: OutlineBtn(
//                                   label: '💬 Chat',
//                                   onTap: () => Navigator.push(context,
//                                       MaterialPageRoute(builder: (_) =>
//                                       const ChatDetailScreen())),
//                                 )),
//                               ]),
//                             ]),
//                         ),
//                       ]),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 AppCard(child: Row(children: [
//                   Container(
//                     width: 60, height: 60,
//                     decoration: BoxDecoration(color: const Color(0xFFC4D4E8),
//                         borderRadius: BorderRadius.circular(14)),
//                     child: const Center(child: Text('👩',
//                         style: TextStyle(fontSize: 28))),
//                   ),
//                   const SizedBox(width: 12),
//                   const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Deepa Menon, 25',
//                         style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//                             fontWeight: FontWeight.w700, color: C.primaryDark)),
//                       Text('Chartered Accountant · Thrissur',
//                         style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 11,
//                             color: C.textMuted)),
//                     ])),
//                   const BadgeGreen(label: '⭐ 89%'),
//                 ])),
//                 const SizedBox(height: 12),
//                 AppCard(child: Row(children: [
//                   Container(
//                     width: 60, height: 60,
//                     decoration: BoxDecoration(color: const Color(0xFFD4E8C4),
//                         borderRadius: BorderRadius.circular(14)),
//                     child: const Center(child: Text('👩',
//                         style: TextStyle(fontSize: 28))),
//                   ),
//                   const SizedBox(width: 12),
//                   const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Ananya Krishna, 24',
//                         style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//                             fontWeight: FontWeight.w700, color: C.primaryDark)),
//                       Text('Software Engineer · Trivandrum',
//                         style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 11,
//                             color: C.textMuted)),
//                     ])),
//                   const BadgeGreen(label: '⭐ 85%'),
//                 ])),
//               ]),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  SCREEN 10 — SEARCH & FILTER
// // ══════════════════════════════════════════════════════════════════════════════
// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: SafeArea(
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
//             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               const Text('Search & Filter',
//                 style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 18,
//                     fontWeight: FontWeight.w700, color: C.primaryDark)),
//               const SizedBox(height: 12),
//               Container(
//                 decoration: BoxDecoration(color: Colors.white,
//                     border: Border.all(color: C.border, width: 1.5),
//                     borderRadius: BorderRadius.circular(14)),
//                 padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//                 child: const Row(children: [
//                   Icon(Icons.search_rounded, color: C.textLight, size: 18),
//                   SizedBox(width: 8),
//                   Expanded(child: Text('Search by name, profession...',
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 12,
//                         color: C.textLight))),
//                   Icon(Icons.tune_rounded, color: C.primary, size: 18),
//                 ]),
//               ),
//               const SizedBox(height: 10),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(children: const [
//                   TagChip(label: 'Hindu', active: true), SizedBox(width: 6),
//                   TagChip(label: 'Nair'), SizedBox(width: 6),
//                   TagChip(label: '22–30 yrs'), SizedBox(width: 6),
//                   TagChip(label: 'Kochi'), SizedBox(width: 6),
//                   TagChip(label: '+ More'),
//                 ]),
//               ),
//             ]),
//           ),
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               children: [
//                 _SearchTile(name: 'Priya R., 27', sub: 'Doctor · Kochi',
//                     emoji: '👩', bgColor: const Color(0xFFE8C4C0),
//                     score: '92%', verified: true,
//                     onTap: () => Navigator.push(context,
//                         MaterialPageRoute(builder: (_) => const ProfileDetailScreen()))),
//                 const SizedBox(height: 8),
//                 _SearchTile(name: 'Ananya K., 26', sub: 'Engineer · TVM',
//                     emoji: '👩', bgColor: const Color(0xFFE8C4C0),
//                     score: '91%', verified: true),
//                 const SizedBox(height: 8),
//                 _SearchTile(name: 'Deepa M., 25', sub: 'CA · Thrissur',
//                     emoji: '👩', bgColor: const Color(0xFFC4D4E8),
//                     score: '87%', verified: false),
//               ],
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

// class _SearchTile extends StatelessWidget {
//   final String name, sub, emoji, score;
//   final Color bgColor;
//   final bool verified;
//   final VoidCallback? onTap;
//   const _SearchTile({required this.name, required this.sub, required this.emoji,
//     required this.bgColor, required this.score, required this.verified, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AppCard(child: Row(children: [
//         Container(
//           width: 56, height: 56,
//           decoration: BoxDecoration(color: bgColor,
//               borderRadius: BorderRadius.circular(14)),
//           child: Center(child: Text(emoji, style: const TextStyle(fontSize: 26))),
//         ),
//         const SizedBox(width: 12),
//         Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Row(children: [
//             Text(name, style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//                 fontWeight: FontWeight.w700, color: C.primaryDark)),
//             if (verified) ...[const SizedBox(width: 6),
//               const BadgeGold(label: '✓')],
//           ]),
//           Text(sub, style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 11,
//               color: C.textMuted)),
//         ])),
//         BadgeGreen(label: score),
//       ])),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  SCREEN 11 — PROFILE DETAIL
// // ══════════════════════════════════════════════════════════════════════════════
// class ProfileDetailScreen extends StatelessWidget {
//   const ProfileDetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: Column(children: [
//         Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [C.primaryDark, C.primary],
//                 begin: Alignment.topLeft, end: Alignment.bottomRight)),
//           child: SafeArea(
//             bottom: false,
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(16, 12, 16, 52),
//               child: Column(children: [
//                 GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text('← View Profile',
//                       style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 12,
//                           color: Colors.white70)),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   width: 90, height: 90,
//                   decoration: BoxDecoration(shape: BoxShape.circle,
//                       color: C.border,
//                       border: Border.all(color: Colors.white, width: 3)),
//                   child: const Center(child: Text('👩',
//                       style: TextStyle(fontSize: 44))),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text('Priya Ramachandran',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 18,
//                       fontWeight: FontWeight.w700, color: Colors.white)),
//                 const Text('MBBS Doctor · Kochi',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 12,
//                       color: Colors.white70)),
//                 const SizedBox(height: 10),
//                 const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   BadgeGold(label: '✓ Gold Verified'),
//                   SizedBox(width: 8),
//                   _WhiteBadge(label: '⭐ 94% Match'),
//                 ]),
//               ]),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Container(
//             margin: const EdgeInsets.only(top: -24),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//             ),
//             child: Column(children: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(children: const [
//                     TagChip(label: 'About', active: true), SizedBox(width: 8),
//                     TagChip(label: 'Education'), SizedBox(width: 8),
//                     TagChip(label: 'Family'), SizedBox(width: 8),
//                     TagChip(label: 'Gallery'),
//                   ]),
//                 ),
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   padding: const EdgeInsets.all(16),
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     const Text(
//                       'A compassionate MBBS doctor from Kochi, raised in a close-knit Nair family. Loves classical music & travel. 🎵',
//                       style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//                           color: C.textMuted, height: 1.6)),
//                     const SizedBox(height: 14),
//                     const Wrap(spacing: 6, runSpacing: 6, children: [
//                       TagChip(label: 'Hindu · Nair'),
//                       TagChip(label: '5′4″'),
//                       TagChip(label: 'Malayalam'),
//                       TagChip(label: 'Thiruvathira'),
//                     ]),
//                     const SizedBox(height: 20),
//                     Row(children: [
//                       Expanded(child: PrimaryBtn(
//                         label: '💌 Express Interest',
//                         onTap: () => Navigator.push(context,
//                             MaterialPageRoute(builder: (_) => const InterestSentScreen())),
//                       )),
//                       const SizedBox(width: 10),
//                       Expanded(child: OutlineBtn(
//                         label: '💬 Message',
//                         onTap: () => Navigator.push(context,
//                             MaterialPageRoute(builder: (_) => const ChatDetailScreen())),
//                       )),
//                     ]),
//                   ]),
//                 ),
//               ),
//             ]),
//           ),
//         ),
//       ]),
//     );
//   }
// }

// class _WhiteBadge extends StatelessWidget {
//   final String label;
//   const _WhiteBadge({required this.label});
//   @override
//   Widget build(BuildContext context) => Container(
//     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//     decoration: BoxDecoration(
//       color: Colors.white.withOpacity(0.2),
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: Text(label, style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10,
//         fontWeight: FontWeight.w700, color: Colors.white)),
//   );
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  SCREEN 12 — CHAT LIST
// // ══════════════════════════════════════════════════════════════════════════════
// class ChatListScreen extends StatelessWidget {
//   const ChatListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: SafeArea(
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Container(
//             color: Colors.white,
//             padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
//             child: const Row(children: [
//               Text('Messages', style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 18,
//                   fontWeight: FontWeight.w700, color: C.primaryDark)),
//               Spacer(),
//               Icon(Icons.edit_outlined, color: C.primary, size: 22),
//             ]),
//           ),
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16),
//               children: [
//                 _ChatListTile(name: 'Priya Ramachandran',
//                   msg: 'Namaste! I came across your profile…', time: '2m', unread: 2,
//                   onTap: () => Navigator.push(context,
//                       MaterialPageRoute(builder: (_) => const ChatDetailScreen()))),
//                 const SizedBox(height: 8),
//                 _ChatListTile(name: 'Deepa Menon',
//                   msg: 'Thank you for your interest 🙏', time: '1hr', unread: 0),
//                 const SizedBox(height: 8),
//                 _ChatListTile(name: 'Ananya Krishna',
//                   msg: 'Looking forward to speaking!', time: 'Yesterday', unread: 0),
//               ],
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

// class _ChatListTile extends StatelessWidget {
//   final String name, msg, time;
//   final int unread;
//   final VoidCallback? onTap;
//   const _ChatListTile({required this.name, required this.msg, required this.time,
//     required this.unread, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AppCard(child: Row(children: [
//         Container(width: 48, height: 48,
//           decoration: const BoxDecoration(
//               color: Color(0xFFE8C4C0), shape: BoxShape.circle),
//           child: const Center(child: Text('👩', style: TextStyle(fontSize: 22))),
//         ),
//         const SizedBox(width: 12),
//         Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Text(name, style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//               fontWeight: FontWeight.w700, color: C.primaryDark)),
//           Text(msg, style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 11,
//               color: C.textMuted), maxLines: 1, overflow: TextOverflow.ellipsis),
//         ])),
//         const SizedBox(width: 8),
//         Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//           Text(time, style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10,
//               color: C.textLight)),
//           if (unread > 0) ...[
//             const SizedBox(height: 5),
//             Container(
//               width: 20, height: 20,
//               decoration: const BoxDecoration(color: C.primary, shape: BoxShape.circle),
//               child: Center(child: Text('$unread',
//                 style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10,
//                     fontWeight: FontWeight.w700, color: Colors.white))),
//             ),
//           ],
//         ]),
//       ])),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  SCREEN 12b — CHAT DETAIL
// // ══════════════════════════════════════════════════════════════════════════════
// class ChatDetailScreen extends StatelessWidget {
//   const ChatDetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: SafeArea(
//         child: Column(children: [
//           Container(
//             color: Colors.white,
//             padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
//             child: Row(children: [
//               GestureDetector(onTap: () => Navigator.pop(context),
//                 child: const Icon(Icons.arrow_back_ios_rounded,
//                     color: C.primaryDark, size: 18)),
//               const SizedBox(width: 10),
//               Container(width: 36, height: 36,
//                   decoration: const BoxDecoration(color: Color(0xFFE8C4C0),
//                       shape: BoxShape.circle),
//                   child: const Center(child: Text('👩',
//                       style: TextStyle(fontSize: 18)))),
//               const SizedBox(width: 10),
//               const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Text('Priya Ramachandran',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//                       fontWeight: FontWeight.w700, color: C.primaryDark)),
//                 Row(children: [
//                   CircleAvatar(radius: 4, backgroundColor: Color(0xFF4CAF50)),
//                   SizedBox(width: 4),
//                   Text('Online', style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10,
//                       color: Color(0xFF4CAF50))),
//                 ]),
//               ])),
//               const Icon(Icons.phone_rounded, color: C.primaryDark, size: 20),
//             ]),
//           ),
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16),
//               children: const [
//                 _Bubble(msg: 'Namaste! I came across your profile. Would love to connect 🙏', mine: false),
//                 SizedBox(height: 8),
//                 _Bubble(msg: "Namaste Priya ji! I'm Arjun, Software Engineer at TCS 😊", mine: true),
//                 SizedBox(height: 8),
//                 _Bubble(msg: 'Wonderful! I\'m a doctor at Amrita Hospital, Kochi 🌸', mine: false),
//                 SizedBox(height: 8),
//                 _Bubble(msg: 'Based in Trivandrum. Family from Thrissur 😊', mine: true),
//               ],
//             ),
//           ),
//           Container(
//             color: Colors.white,
//             padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
//             child: Row(children: [
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(color: C.cardBg,
//                       border: Border.all(color: C.border, width: 1.5),
//                       borderRadius: BorderRadius.circular(24)),
//                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
//                   child: const Text('Type a message…',
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 12,
//                         color: C.textLight)),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Container(
//                 width: 42, height: 42,
//                 decoration: const BoxDecoration(color: C.primary, shape: BoxShape.circle),
//                 child: const Icon(Icons.send_rounded, color: Colors.white, size: 18),
//               ),
//             ]),
//           ),
//         ]),
//       ),
//     );
//   }
// }

// class _Bubble extends StatelessWidget {
//   final String msg;
//   final bool mine;
//   const _Bubble({required this.msg, required this.mine});

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         constraints: BoxConstraints(
//             maxWidth: MediaQuery.of(context).size.width * 0.72),
//         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//         decoration: BoxDecoration(
//           color: mine ? C.primary : Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: const Radius.circular(16),
//             topRight: const Radius.circular(16),
//             bottomLeft: Radius.circular(mine ? 16 : 4),
//             bottomRight: Radius.circular(mine ? 4 : 16),
//           ),
//           border: mine ? null : Border.all(color: C.border),
//         ),
//         child: Text(msg,
//           style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 12,
//               color: mine ? Colors.white : C.primaryDark, height: 1.5)),
//       ),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  SCREEN 13 — INTEREST SENT
// // ══════════════════════════════════════════════════════════════════════════════
// class InterestSentScreen extends StatelessWidget {
//   const InterestSentScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: Stack(children: [
//         Positioned(top: 80, left: 30, child: _Confetti(color: C.gold, size: 14)),
//         Positioned(top: 110, right: 40, child: _Confetti(color: C.primary, size: 10)),
//         Positioned(bottom: 200, left: 50, child: _Confetti(color: C.primaryDark, size: 9, opacity: 0.3)),
//         Positioned(bottom: 250, right: 30, child: _Confetti(color: C.gold, size: 12, opacity: 0.5)),
//         SafeArea(
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(32),
//               child: Column(mainAxisSize: MainAxisSize.min, children: [
//                 const Text('💌', style: TextStyle(fontSize: 72)),
//                 const SizedBox(height: 18),
//                 const Text('Interest Sent!',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 24,
//                       fontWeight: FontWeight.w700, color: C.primaryDark)),
//                 const SizedBox(height: 10),
//                 const Text.rich(TextSpan(children: [
//                   TextSpan(text: 'Your interest has been sent to\n',
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//                         color: C.textMuted, height: 1.7)),
//                   TextSpan(text: 'Priya Ramachandran\n',
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//                         fontWeight: FontWeight.w700, color: C.primaryDark, height: 1.7)),
//                   TextSpan(text: "You'll be notified when she responds.",
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//                         color: C.textMuted, height: 1.7)),
//                 ]), textAlign: TextAlign.center),
//                 const SizedBox(height: 26),
//                 Container(
//                   width: 110, height: 110,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: const LinearGradient(colors: [Colors.white, C.cardBg]),
//                     border: Border.all(color: C.border, width: 2),
//                   ),
//                   child: const Center(child: Text('👩',
//                       style: TextStyle(fontSize: 52))),
//                 ),
//                 const SizedBox(height: 28),
//                 PrimaryBtn(label: 'View More Matches',
//                     onTap: () => Navigator.pop(context)),
//                 const SizedBox(height: 10),
//                 OutlineBtn(label: 'Go to Home',
//                     onTap: () => Navigator.popUntil(context, (r) => r.isFirst)),
//               ]),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }

// class _Confetti extends StatelessWidget {
//   final Color color;
//   final double size, opacity;
//   const _Confetti({required this.color, required this.size, this.opacity = 0.5});
//   @override
//   Widget build(BuildContext context) => Container(
//     width: size, height: size,
//     decoration: BoxDecoration(shape: BoxShape.circle,
//         color: color.withOpacity(opacity)),
//   );
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  SCREEN 14 — PREMIUM PLANS
// // ══════════════════════════════════════════════════════════════════════════════
// class PremiumScreen extends StatelessWidget {
//   const PremiumScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       appBar: AppBar(
//         title: const Text('Choose Your Plan'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_rounded, color: C.primaryDark, size: 18),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(children: [
//           const Text('Unlock your perfect match faster',
//             style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13, color: C.textMuted)),
//           const SizedBox(height: 20),
//           AppCard(
//             padding: const EdgeInsets.all(16),
//             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               const Row(children: [
//                 Expanded(child: Text('Free',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 16,
//                       fontWeight: FontWeight.w700, color: C.primaryDark))),
//                 Text('₹0', style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 22,
//                     fontWeight: FontWeight.w800, color: C.primaryDark)),
//               ]),
//               const SizedBox(height: 8),
//               Wrap(spacing: 6, runSpacing: 6, children: const [
//                 TagChip(label: '5 Interests/mo'),
//                 TagChip(label: 'Basic Search'),
//               ]),
//             ]),
//           ),
//           const SizedBox(height: 14),
//           Stack(clipBehavior: Clip.none, children: [
//             Container(
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                     colors: [C.primaryDark, C.primary],
//                     begin: Alignment.topLeft, end: Alignment.bottomRight),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
//               child: Column(children: [
//                 const Row(children: [
//                   Expanded(child: Text('Premium',
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 16,
//                         fontWeight: FontWeight.w700, color: Colors.white))),
//                   Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//                     Text('₹999', style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 22,
//                         fontWeight: FontWeight.w800, color: Colors.white)),
//                     Text('/ 3 months', style: TextStyle(fontFamily: 'tasaOrbiter',
//                         fontSize: 10, color: Colors.white70)),
//                   ]),
//                 ]),
//                 const SizedBox(height: 10),
//                 Wrap(spacing: 6, runSpacing: 6, children: const [
//                   _PTag('Unlimited Chat'),
//                   _PTag('View Contacts'),
//                   _PTag('Priority Match'),
//                   _PTag('Horoscope Match'),
//                 ]),
//               ]),
//             ),
//             Positioned(top: -10, left: 0, right: 0,
//               child: Center(child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
//                 decoration: BoxDecoration(color: C.gold,
//                     borderRadius: BorderRadius.circular(20)),
//                 child: const Text('⭐ MOST POPULAR',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10,
//                       fontWeight: FontWeight.w700, color: Colors.white)),
//               )),
//             ),
//           ]),
//           const SizedBox(height: 16),
//           Container(
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                   colors: [Color(0xFF7B4F1E), C.gold],
//                   begin: Alignment.topLeft, end: Alignment.bottomRight),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             padding: const EdgeInsets.all(16),
//             child: Column(children: [
//               const Row(children: [
//                 Expanded(child: Text('Premium Plus',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 16,
//                       fontWeight: FontWeight.w700, color: Colors.white))),
//                 Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//                   Text('₹1,799', style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 22,
//                       fontWeight: FontWeight.w800, color: Colors.white)),
//                   Text('/ 6 months', style: TextStyle(fontFamily: 'tasaOrbiter',
//                       fontSize: 10, color: Colors.white70)),
//                 ]),
//               ]),
//               const SizedBox(height: 10),
//               Wrap(spacing: 6, runSpacing: 6, children: const [
//                 _PTag('Dedicated RM'),
//                 _PTag('WhatsApp Alerts'),
//                 _PTag('Priority Listing'),
//               ]),
//             ]),
//           ),
//           const SizedBox(height: 24),
//           PrimaryBtn(label: 'Upgrade to Premium ⭐',
//               onTap: () => Navigator.pop(context)),
//         ]),
//       ),
//     );
//   }
// }

// class _PTag extends StatelessWidget {
//   final String label;
//   const _PTag(this.label);
//   @override
//   Widget build(BuildContext context) => Container(
//     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//     decoration: BoxDecoration(
//       color: Colors.white.withOpacity(0.2),
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: Text(label,
//       style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 11,
//           color: Colors.white)),
//   );
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  SCREEN 15 — NOTIFICATIONS
// // ══════════════════════════════════════════════════════════════════════════════
// class NotificationsScreen extends StatelessWidget {
//   const NotificationsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       appBar: AppBar(
//         title: const Text('Notifications'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_rounded, color: C.primaryDark, size: 18),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: const [
//           _NotifTile(emoji: '👩',
//             title: 'Priya R. liked your profile',
//             sub: 'She viewed your profile 3 times today',
//             time: '2 mins ago', unread: true),
//           SizedBox(height: 8),
//           _NotifTile(emoji: '👩',
//             title: 'Deepa M. sent you a message',
//             sub: '"Namaste! Your profile caught my..."',
//             time: '15 mins ago', unread: false),
//           SizedBox(height: 8),
//           _NotifTile(emoji: '👩',
//             title: 'Anjali K. sent an interest',
//             sub: "She's a CA from Thrissur, 89% match",
//             time: '45 mins ago', unread: false),
//           SizedBox(height: 8),
//           _NotifTile(emoji: '⭐',
//             title: 'Premium offer expires soon!',
//             sub: '40% off on 6-month plan · Today only',
//             time: '1 hr ago', unread: false, isSpecial: true),
//         ],
//       ),
//     );
//   }
// }

// class _NotifTile extends StatelessWidget {
//   final String emoji, title, sub, time;
//   final bool unread, isSpecial;
//   const _NotifTile({required this.emoji, required this.title,
//     required this.sub, required this.time,
//     required this.unread, this.isSpecial = false});

//   @override
//   Widget build(BuildContext context) {
//     return AppCard(
//       child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         Container(
//           width: 44, height: 44,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             gradient: isSpecial
//                 ? const LinearGradient(colors: [C.primaryDark, C.primary]) : null,
//             color: isSpecial ? null : const Color(0xFFE8C4C0),
//           ),
//           child: Center(child: Text(emoji,
//               style: TextStyle(fontSize: isSpecial ? 18 : 22))),
//         ),
//         const SizedBox(width: 12),
//         Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Text(title, style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 12,
//               fontWeight: FontWeight.w700, color: C.primaryDark)),
//           const SizedBox(height: 2),
//           Text(sub, style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 11,
//               color: C.textMuted)),
//           const SizedBox(height: 2),
//           Text(time, style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10,
//               color: C.textLight)),
//         ])),
//         if (unread)
//           Container(width: 9, height: 9,
//               decoration: const BoxDecoration(color: C.primary, shape: BoxShape.circle)),
//       ]),
//     );
//   }
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  SCREEN 16 — SETTINGS / PROFILE
// // ══════════════════════════════════════════════════════════════════════════════
// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: SafeArea(
//         child: Column(children: [
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                   colors: [C.primaryDark, C.primary],
//                   begin: Alignment.centerLeft, end: Alignment.centerRight),
//             ),
//             padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
//             child: Row(children: [
//               Container(
//                 width: 60, height: 60,
//                 decoration: BoxDecoration(shape: BoxShape.circle, color: C.border,
//                     border: Border.all(color: Colors.white, width: 2)),
//                 child: const Center(child: Text('🧑',
//                     style: TextStyle(fontSize: 28))),
//               ),
//               const SizedBox(width: 14),
//               const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Text('Arjun Nair',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 16,
//                       fontWeight: FontWeight.w700, color: Colors.white)),
//                 Text('VB-2024-88921',
//                   style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 10,
//                       color: Colors.white70)),
//                 SizedBox(height: 4),
//                 BadgeGold(label: '⭐ Premium'),
//               ]),
//               const Spacer(),
//               const Icon(Icons.edit_rounded, color: Colors.white, size: 18),
//             ]),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
//             child: AppCard(
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                   Text('Profile Complete',
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 12,
//                         fontWeight: FontWeight.w600, color: C.primaryDark)),
//                   Text('78%', style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 12,
//                       fontWeight: FontWeight.w700, color: C.primary)),
//                 ]),
//                 const SizedBox(height: 8),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(4),
//                   child: const LinearProgressIndicator(
//                     value: 0.78,
//                     backgroundColor: C.border,
//                     color: C.primary,
//                     minHeight: 6,
//                   ),
//                 ),
//               ]),
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16),
//               children: [
//                 _SettingRow(icon: Icons.person_rounded, label: 'My Profile'),
//                 const SizedBox(height: 6),
//                 _SettingRow(icon: Icons.photo_library_rounded, label: 'Manage Photos'),
//                 const SizedBox(height: 6),
//                 _SettingRow(icon: Icons.favorite_rounded, label: 'Partner Preferences'),
//                 const SizedBox(height: 6),
//                 _SettingRow(icon: Icons.lock_rounded, label: 'Privacy Settings'),
//                 const SizedBox(height: 6),
//                 GestureDetector(
//                   onTap: () => Navigator.push(context,
//                       MaterialPageRoute(builder: (_) => const PremiumScreen())),
//                   child: _SettingRow(icon: Icons.credit_card_rounded,
//                       label: 'My Membership'),
//                 ),
//                 const SizedBox(height: 6),
//                 GestureDetector(
//                   onTap: () => Navigator.push(context,
//                       MaterialPageRoute(builder: (_) => const NotificationsScreen())),
//                   child: _SettingRow(icon: Icons.notifications_rounded,
//                       label: 'Notifications'),
//                 ),
//                 const SizedBox(height: 6),
//                 _SettingRow(icon: Icons.help_outline_rounded, label: 'Help & Support'),
//                 const SizedBox(height: 6),
//                 AppCard(child: Row(children: const [
//                   Icon(Icons.logout_rounded, color: C.primary, size: 20),
//                   SizedBox(width: 12),
//                   Expanded(child: Text('Logout',
//                     style: TextStyle(fontFamily: 'tasaOrbiter', fontSize: 13,
//                         fontWeight: FontWeight.w700, color: C.primary))),
//                   Icon(Icons.chevron_right_rounded, color: C.border, size: 18),
//                 ])),
//               ],
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

// class _SettingRow extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   const _SettingRow({required this.icon, required this.label});
//   @override
//   Widget build(BuildContext context) => AppCard(
//     child: Row(children: [
//       Icon(icon, color: C.secondary, size: 20),
//       const SizedBox(width: 12),
//       Expanded(child: Text(label, style: const TextStyle(fontFamily: 'tasaOrbiter',
//           fontSize: 13, fontWeight: FontWeight.w500, color: C.primaryDark))),
//       const Icon(Icons.chevron_right_rounded, color: C.border, size: 18),
//     ]),
//   );
// }

// // ══════════════════════════════════════════════════════════════════════════════
// //  SCREEN 17 — WEDDING STORIES
// // ══════════════════════════════════════════════════════════════════════════════
// class WeddingStoriesScreen extends StatelessWidget {
//   const WeddingStoriesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       appBar: AppBar(
//         title: const Text('Wedding Stories 💕'),
//         actions: const [
//           Padding(padding: EdgeInsets.only(right: 16),
//             child: Icon(Icons.add_rounded, color: C.primary, size: 26)),
//         ],
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           _StoryCard(
//             emoji: '👫', gradient: const [Color(0xFFE8C4C0), C.bg],
//             title: "Rohit & Anjali's story 💍",
//             desc: 'Met on VivahBharath in 2023, married this April in a beautiful Kerala ceremony.',
//             likes: '248', comments: '34',
//           ),
//           const SizedBox(height: 14),
//           _StoryCard(
//             emoji: '🎊', gradient: const [Color(0xFFC4D4E8), Color(0xFFD9E8F0)],
//             title: "Arun & Priya's journey",
//             desc: '6 months from first message to the mandap. Thank you VivahBharath!',
//             likes: '192',
//           ),
//           const SizedBox(height: 14),
//           _StoryCard(
//             emoji: '🌸', gradient: const [Color(0xFFE8D4C4), C.cardBg],
//             title: "Vishnu & Lakshmi's blessings",
//             desc: 'A traditional Kerala wedding bringing two families together. Pure magic! ✨',
//             likes: '310', comments: '52',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _StoryCard extends StatelessWidget {
//   final String emoji, title, desc, likes;
//   final String? comments;
//   final List<Color> gradient;
//   const _StoryCard({required this.emoji, required this.gradient,
//     required this.title, required this.desc, required this.likes, this.comments});

//   @override
//   Widget build(BuildContext context) {
//     return AppCard(
//       padding: EdgeInsets.zero,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: Column(children: [
//           Container(
//             height: 140, width: double.infinity,
//             decoration: BoxDecoration(gradient: LinearGradient(colors: gradient)),
//             child: Center(child: Text(emoji, style: const TextStyle(fontSize: 56))),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(14),
//             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text(title, style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 14,
//                   fontWeight: FontWeight.w700, color: C.primaryDark)),
//               const SizedBox(height: 4),
//               Text(desc, style: const TextStyle(fontFamily: 'tasaOrbiter', fontSize: 12,
//                   color: C.textMuted, height: 1.5)),
//               const SizedBox(height: 10),
//               Row(children: [
//                 const Icon(Icons.favorite_rounded, color: C.primary, size: 16),
//                 const SizedBox(width: 4),
//                 Text(likes, style: const TextStyle(fontFamily: 'tasaOrbiter',
//                     fontSize: 11, color: C.textLight)),
//                 if (comments != null) ...[
//                   const SizedBox(width: 14),
//                   const Icon(Icons.chat_bubble_outline_rounded,
//                       color: C.textLight, size: 16),
//                   const SizedBox(width: 4),
//                   Text(comments!, style: const TextStyle(fontFamily: 'tasaOrbiter',
//                       fontSize: 11, color: C.textLight)),
//                 ],
//               ]),
//             ]),
//           ),
//         ]),
//       ),
//     );
//   }
// }