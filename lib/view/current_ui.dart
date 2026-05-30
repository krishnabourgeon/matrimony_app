// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:matrimony_app/view/custom_widgets/app_theme.dart';
// // import 'package:matrimony_app/view/splash_screen.dart';
// // import 'package:matrimony_app/view/login_screen.dart';
// // import 'package:matrimony_app/view/home_screen.dart';

// // void main() {
// //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
// //     statusBarColor: Colors.transparent,
// //     statusBarIconBrightness: Brightness.dark,
// //   ));
// //   runApp(const VivahApp());
// // }

// // class VivahApp extends StatefulWidget {
// //   const VivahApp({super.key});

// //   @override
// //   State<VivahApp> createState() => _VivahAppState();
// // }

// // class _VivahAppState extends State<VivahApp> {
// //   String _currentScreen = 'splash';

// //   @override
// //   Widget build(BuildContext context) {
// //     Widget homeWidget;
// //     switch (_currentScreen) {
// //       case 'splash':
// //         homeWidget = SplashScreen(
// //           onFinish: () => setState(() => _currentScreen = 'login'),
// //         );
// //         break;
// //       case 'login':
// //         homeWidget = LoginScreen(
// //           onLogin: () => setState(() => _currentScreen = 'home'),
// //         );
// //         break;
// //       case 'home':
// //         homeWidget = const HomeScreen();
// //         break;
// //       default:
// //         homeWidget = const HomeScreen();
// //     }

// //     return MaterialApp(
// //       title: 'VivahMatch',
// //       debugShowCheckedModeBanner: false,
// //       theme: VivahTheme.theme,
// //       home: homeWidget,
// //     );
// //   }
// // }

// // ════════════════════════════════════════════════════════════════════════════
// //  VivahBharath — Gen-Z Kerala Matrimonial App
// //  Flutter implementation of the full UI case study (17 screens)
// //
// //  pubspec.yaml dependencies needed:
// //    dependencies:
// //      flutter:
// //        sdk: flutter
// //      google_fonts: ^6.1.0   ← optional; remove if adding Poppins as asset
// //
// //  If using google_fonts, replace const TextStyle(fontFamily: 'Poppins', ...)
// //  with GoogleFonts.poppins(...) throughout.
// //
// //  Otherwise, add Poppins to flutter/fonts in pubspec.yaml and keep as-is.
// // ════════════════════════════════════════════════════════════════════════════

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
//         fontFamily: 'Poppins',
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
//             fontFamily: 'Poppins',
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

// /// The descending bar‑stack logo mark
// class LogoBars extends StatelessWidget {
//   final Color color;
//   final double scale;
//   const LogoBars({super.key, this.color = C.primaryDark, this.scale = 1.0});

//   @override
//   Widget build(BuildContext context) {
//     const specs = [[3.0, 22.0], [3.0, 17.0], [3.0, 13.0], [2.0, 9.0], [2.0, 6.0]];
//     return 
//     Row(
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

// /// "vivah" (light) + "bharath" (bold) wordmark
// class LogoTitle extends StatelessWidget {
//   final double fontSize;
//   const LogoTitle({super.key, this.fontSize = 20});

//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       text: TextSpan(children: [
//         TextSpan(
//           text: 'vivah',
//           style: TextStyle(fontFamily: 'Poppins', fontSize: fontSize,
//               fontWeight: FontWeight.w300, color: C.primary),
//         ),
//         TextSpan(
//           text: 'bharath',
//           style: TextStyle(fontFamily: 'Poppins', fontSize: fontSize,
//               fontWeight: FontWeight.w800, color: C.primaryDark),
//         ),
//       ]),
//     );
//   }
// }

// /// Mark + wordmark together
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

// /// Coral filled call-to-action button
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
//           style: const TextStyle(fontFamily: 'Poppins', fontSize: 14,
//               fontWeight: FontWeight.w700, color: Colors.white)),
//       ),
//     );
//   }
// }

// /// Coral outline button
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
//           style: const TextStyle(fontFamily: 'Poppins', fontSize: 14,
//               fontWeight: FontWeight.w600, color: C.primary)),
//       ),
//     );
//   }
// }

// /// White elevated card
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

// /// Pill tag chip
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
//         style: TextStyle(fontFamily: 'Poppins', fontSize: 11,
//             fontWeight: FontWeight.w600,
//             color: active ? Colors.white : C.primaryDark)),
//     );
//   }
// }

// /// Green percentage badge
// class BadgeGreen extends StatelessWidget {
//   final String label;
//   const BadgeGreen({super.key, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//       decoration: BoxDecoration(color: C.greenBg, borderRadius: BorderRadius.circular(20)),
//       child: Text(label,
//         style: const TextStyle(fontFamily: 'Poppins', fontSize: 10,
//             fontWeight: FontWeight.w700, color: C.green)),
//     );
//   }
// }

// /// Gold gradient verified badge
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
//         style: const TextStyle(fontFamily: 'Poppins', fontSize: 10,
//             fontWeight: FontWeight.w700, color: Colors.white)),
//     );
//   }
// }

// /// Styled text input field
// class AppInput extends StatelessWidget {
//   final String hint;
//   final IconData? prefixIcon;
//   final bool obscure;
//   const AppInput({super.key, required this.hint, this.prefixIcon, this.obscure = false});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: C.cardBg,
//         border: Border.all(color: C.border, width: 1.5),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: TextField(
//         obscureText: obscure,
//         style: const TextStyle(fontFamily: 'Poppins', fontSize: 13, color: C.primaryDark),
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 13, color: C.textLight),
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

// /// Persistent bottom navigation bar
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
//                       style: TextStyle(fontFamily: 'Poppins', fontSize: 10,
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
//             // Decorative circles
//             Positioned(bottom: 60, left: -30,
//               child: _DecorativeCircle(size: 160, opacity: 0.15)),
//             Positioned(top: 100, right: -20,
//               child: _DecorativeCircle(size: 120, opacity: 0.12)),
//             // Centre content
//             Center(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Nested logo circles
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
//                         child: Center(
//                           child: Image.asset(
//                             'assets/image/logo.png',
//                             width: 40,
//                             height: 40,
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   RichText(text: const TextSpan(children: [
//                     TextSpan(text: 'vivah',
//                       style: TextStyle(fontFamily: 'Poppins', fontSize: 28,
//                           fontWeight: FontWeight.w300, color: Color(0xFFFFD0CB))),
//                     TextSpan(text: 'bharath',
//                       style: TextStyle(fontFamily: 'Poppins', fontSize: 28,
//                           fontWeight: FontWeight.w800, color: Colors.white)),
//                   ])),
//                   const SizedBox(height: 6),
//                   Text('TRUSTED KERALA MATRIMONY',
//                     style: TextStyle(fontFamily: 'Poppins', fontSize: 10,
//                         letterSpacing: 2.5, color: Colors.white.withOpacity(0.7))),
//                   const SizedBox(height: 20),
//                   // Page dots
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
//                   style: TextStyle(fontFamily: 'Poppins', color: C.textMuted, fontSize: 13)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Onboard page template
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
//         Expanded(
//           flex: 6,
//           child: Center(child: illustration)),
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
//             // Page indicators
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
//               style: const TextStyle(fontFamily: 'Poppins', fontSize: 25,
//                   fontWeight: FontWeight.w700, color: C.primaryDark)),
//             const SizedBox(height: 8),
//             Text(desc,
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontFamily: 'Poppins', fontSize: 18,
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
//           style: TextStyle(fontFamily: 'Poppins', color: C.textMuted, fontSize: 13)),
//         TextSpan(text: 'Sign In',
//           style: TextStyle(fontFamily: 'Poppins', color: C.primary,
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

// // ─── Illustrations ────────────────────────────────────────────────────────────
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
//     // Man (dark)
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
//     // Woman (coral)
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
//     // Ring arc
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
//     // Outer dashed ring approximation
//     canvas.drawCircle(Offset(cx, cy), s.width * .42,
//         Paint()..color = C.border..style = PaintingStyle.stroke..strokeWidth = 2);
//     // Inner fill
//     canvas.drawCircle(Offset(cx, cy), s.width * .27, Paint()..color = C.bg);
//     // Connection arc
//     canvas.drawArc(
//       Rect.fromCenter(center: Offset(cx, cy), width: 64, height: 64),
//       math.pi * 1.2, math.pi * 0.6, false,
//       Paint()..color = C.primary..style = PaintingStyle.stroke..strokeWidth = 2.5..strokeCap = StrokeCap.round,
//     );
//     // Two profile dots
//     canvas.drawCircle(Offset(cx - 22, cy + 5), 8, Paint()..color = C.primaryDark);
//     canvas.drawCircle(Offset(cx + 22, cy + 5), 8, Paint()..color = C.primary);
//     // Smile
//     canvas.drawArc(
//       Rect.fromCenter(center: Offset(cx, cy + 5), width: 24, height: 18),
//       0, math.pi, false,
//       Paint()..color = C.gold..style = PaintingStyle.stroke..strokeWidth = 2..strokeCap = StrokeCap.round,
//     );
//     // Corner decorations
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
//              SizedBox(height: 48),
//             // Logo
//              Column(children: [
//               // LogoBars(scale: 0.9),
//                Center(
//                 child: Image.asset(
//                   'assets/image/logo.png',
//                   width: 30,
//                   height: 30,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               SizedBox(height: 10),
//               LogoTitle(fontSize: 22),
//               SizedBox(height: 4),
//               Text('KERALA MATRIMONY',
//                 style: TextStyle(fontFamily: 'Poppins', fontSize: 10,
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
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 22,
//                       fontWeight: FontWeight.w700, color: C.primaryDark)),
//                 const SizedBox(height: 4),
//                 const Text('Sign in to continue your journey',
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 13, color: C.textMuted)),
//                 const SizedBox(height: 22),
//                 const Text('Mobile / Email',
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 12,
//                       fontWeight: FontWeight.w600, color: C.primaryDark)),
//                 const SizedBox(height: 6),
//                 const AppInput(hint: '+91 98765 43210',
//                     prefixIcon: Icons.phone_android_rounded),
//                 const SizedBox(height: 14),
//                 const Text('Password',
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 12,
//                       fontWeight: FontWeight.w600, color: C.primaryDark)),
//                 const SizedBox(height: 6),
//                 const AppInput(hint: '••••••••',
//                     prefixIcon: Icons.lock_rounded, obscure: true),
//                 const SizedBox(height: 6),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(onPressed: () {},
//                     child: const Text('Forgot Password?',
//                       style: TextStyle(fontFamily: 'Poppins', fontSize: 12,
//                           fontWeight: FontWeight.w600, color: C.primary))),
//                 ),
//                 PrimaryBtn(
//                   label: 'Sign In',
//                   onTap: () => Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (_) => const MainShell())),
//                 ),
//                 const SizedBox(height: 12),
//                 // Google button
//                 Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: C.border, width: 1.5),
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                   padding: const EdgeInsets.all(13),
//                   child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                     Text('G  ', style: TextStyle(fontFamily: 'Poppins',
//                         fontSize: 14, fontWeight: FontWeight.w700,
//                         color: Color(0xFFEA4335))),
//                     Text('Continue with Google',
//                       style: TextStyle(fontFamily: 'Poppins', fontSize: 13,
//                           fontWeight: FontWeight.w600, color: C.primaryDark)),
//                   ]),
//                 ),
//                 const SizedBox(height: 14),
//                 Center(
//                   child: TextButton(
//                     onPressed: () => Navigator.push(context,
//                         MaterialPageRoute(builder: (_) => const RegisterScreen())),
//                     child: const Text.rich(TextSpan(children: [
//                       TextSpan(text: 'New here? ',
//                         style: TextStyle(fontFamily: 'Poppins', fontSize: 13,
//                             color: C.textMuted)),
//                       TextSpan(text: 'Create Account',
//                         style: TextStyle(fontFamily: 'Poppins', fontSize: 13,
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
// //  SCREEN 06 — REGISTER
// // ══════════════════════════════════════════════════════════════════════════════
// class RegisterScreen extends StatelessWidget {
//   const RegisterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: C.bg,
//       body: SafeArea(
//         child: Column(children: [
//           // Step header
//           Padding(
//             padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
//             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               GestureDetector(
//                 onTap: () => Navigator.pop(context),
//                 child: const Row(children: [
//                   Icon(Icons.arrow_back_ios_rounded, color: C.primary, size: 16),
//                   SizedBox(width: 6),
//                   Text('Create your profile',
//                     style: TextStyle(fontFamily: 'Poppins', fontSize: 13, color: C.textMuted)),
//                 ]),
//               ),
//               const SizedBox(height: 16),
//               Row(children: [
//                 _StepBubble(label: '✓', done: true),
//                 Expanded(child: Container(height: 2, color: C.primary)),
//                 _StepBubble(label: '✓', done: true),
//                 Expanded(child: Container(height: 2, color: C.border)),
//                 _StepBubble(label: '3', active: true),
//                 Expanded(child: Container(height: 2, color: C.border)),
//                 _StepBubble(label: '4'),
//               ]),
//               const SizedBox(height: 6),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Basic', style: TextStyle(fontFamily:'Poppins', fontSize: 10, color: C.primary)),
//                   Text('Religion', style: TextStyle(fontFamily:'Poppins', fontSize: 10, color: C.primary)),
//                   Text('Education', style: TextStyle(fontFamily:'Poppins', fontSize: 10, color: C.primary)),
//                   Text('Family', style: TextStyle(fontFamily:'Poppins', fontSize: 10, color: C.textMuted)),
//                 ],
//               ),
//             ]),
//           ),
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
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 16,
//                       fontWeight: FontWeight.w700, color: C.primaryDark)),
//                 const SizedBox(height: 18),
//                 const Text('Highest Qualification',
//                   style: TextStyle(fontFamily:'Poppins', fontSize: 11, color: C.textMuted)),
//                 const SizedBox(height: 6),
//                 const AppInput(hint: 'B.Tech — Computer Science'),
//                 const SizedBox(height: 14),
//                 const Text('Occupation',
//                   style: TextStyle(fontFamily:'Poppins', fontSize: 11, color: C.textMuted)),
//                 const SizedBox(height: 6),
//                 const AppInput(hint: 'Software Engineer'),
//                 const SizedBox(height: 14),
//                 const Text('Annual Income',
//                   style: TextStyle(fontFamily:'Poppins', fontSize: 11, color: C.textMuted)),
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
//         style: TextStyle(fontFamily: 'Poppins', fontSize: 10,
//             fontWeight: FontWeight.w700,
//             color: done ? Colors.white : active ? C.primary : C.textLight))),
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
//               style: TextStyle(fontFamily: 'Poppins', fontSize: 22,
//                   fontWeight: FontWeight.w700, color: C.primaryDark)),
//             const SizedBox(height: 8),
//             const Text.rich(
//               TextSpan(children: [
//                 TextSpan(text: "We've sent a 6-digit OTP to\n",
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 13,
//                       color: C.textMuted, height: 1.7)),
//                 TextSpan(text: '+91 98765 43210',
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 13,
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
//                 style: TextStyle(fontFamily: 'Poppins', fontSize: 13, color: C.textMuted)),
//               TextSpan(text: 'Resend in 00:42',
//                 style: TextStyle(fontFamily: 'Poppins', fontSize: 13,
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
//           style: TextStyle(fontFamily: 'Poppins',
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
//           // Top bar
//           Container(
//             color: Colors.white,
//             padding:  EdgeInsets.fromLTRB(16, 12, 16, 12),
//             child: Row(children: [
//               // const LogoBars(scale: 0.7),
//               Center(
//                 child: Image.asset(
//                   'assets/image/logo.png',
//                   width: 30,
//                   height: 30,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//                SizedBox(width: 8),
//                LogoTitle(fontSize: 14),
//                Spacer(),
//               GestureDetector(
//                 onTap: () => Navigator.push(context,
//                     MaterialPageRoute(builder: (_) =>  NotificationsScreen())),
//                 child:  Icon(Icons.notifications_rounded,
//                     color: C.primaryDark, size: 22)),
//                SizedBox(width: 12),
//               Container(
//                 width: 36, height: 36,
//                 decoration:  BoxDecoration(color: C.primary, shape: BoxShape.circle),
//                 child:  Center(child: Text('A',
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 14,
//                       fontWeight: FontWeight.w700, color: Colors.white))),
//               ),
//             ]),
//           ),
//           // Body
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 // Greeting banner
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
//                         style: TextStyle(fontFamily: 'Poppins', fontSize: 15,
//                             fontWeight: FontWeight.w700, color: Colors.white)),
//                       SizedBox(height: 4),
//                       Text('12 new matches today ✨',
//                         style: TextStyle(fontFamily: 'Poppins', fontSize: 11,
//                             color: Colors.white70)),
//                     ]),
//                     Spacer(),
//                     Text('💐', style: TextStyle(fontSize: 30)),
//                   ]),
//                 ),
//                 const SizedBox(height: 14),
//                 // Search bar
//                 Container(
//                   decoration: BoxDecoration(color: Colors.white,
//                       border: Border.all(color: C.border, width: 1.5),
//                       borderRadius: BorderRadius.circular(14)),
//                   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//                   child: const Row(children: [
//                     Icon(Icons.search_rounded, color: C.textLight, size: 18),
//                     SizedBox(width: 8),
//                     Text('Search by name, community...',
//                       style: TextStyle(fontFamily: 'Poppins', fontSize: 12,
//                           color: C.textLight)),
//                   ]),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text('Recommended Matches',
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 14,
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
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 14,
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
//                 // Wedding stories shortcut
//                 GestureDetector(
//                   onTap: () => Navigator.push(context,
//                       MaterialPageRoute(builder: (_) => const WeddingStoriesScreen())),
//                   child: AppCard(
//                     child: Row(children: const [
//                       Text('💕', style: TextStyle(fontSize: 22)),
//                       SizedBox(width: 12),
//                       Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                         Text('Wedding Stories',
//                           style: TextStyle(fontFamily:'Poppins', fontSize: 13,
//                               fontWeight: FontWeight.w700, color: C.primaryDark)),
//                         Text('Real couples, real Kerala love stories',
//                           style: TextStyle(fontFamily:'Poppins', fontSize: 11,
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
//           Text(name, style: const TextStyle(fontFamily: 'Poppins', fontSize: 12,
//               fontWeight: FontWeight.w700, color: C.primaryDark)),
//           Text(sub, style: const TextStyle(fontFamily: 'Poppins', fontSize: 10,
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
//               style: TextStyle(fontFamily: 'Poppins', fontSize: 18,
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
//                                 style: TextStyle(fontFamily: 'Poppins',
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
//                                 style: TextStyle(fontFamily: 'Poppins', fontSize: 16,
//                                     fontWeight: FontWeight.w700, color: C.primaryDark)),
//                               const Text('MBBS Doctor · Nair · Kochi',
//                                 style: TextStyle(fontFamily: 'Poppins', fontSize: 11,
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
//                         style: TextStyle(fontFamily: 'Poppins', fontSize: 13,
//                             fontWeight: FontWeight.w700, color: C.primaryDark)),
//                       Text('Chartered Accountant · Thrissur',
//                         style: TextStyle(fontFamily: 'Poppins', fontSize: 11,
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
//                         style: TextStyle(fontFamily: 'Poppins', fontSize: 13,
//                             fontWeight: FontWeight.w700, color: C.primaryDark)),
//                       Text('Software Engineer · Trivandrum',
//                         style: TextStyle(fontFamily: 'Poppins', fontSize: 11,
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
//                 style: TextStyle(fontFamily: 'Poppins', fontSize: 18,
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
//                     style: TextStyle(fontFamily: 'Poppins', fontSize: 12,
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
//             Text(name, style: const TextStyle(fontFamily: 'Poppins', fontSize: 13,
//                 fontWeight: FontWeight.w700, color: C.primaryDark)),
//             if (verified) ...[const SizedBox(width: 6),
//               const BadgeGold(label: '✓')],
//           ]),
//           Text(sub, style: const TextStyle(fontFamily: 'Poppins', fontSize: 11,
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
//         // Gradient hero
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
//                       style: TextStyle(fontFamily: 'Poppins', fontSize: 12,
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
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 18,
//                       fontWeight: FontWeight.w700, color: Colors.white)),
//                 const Text('MBBS Doctor · Kochi',
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 12,
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
//         // White card overlapping
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
//                       style: TextStyle(fontFamily: 'Poppins', fontSize: 13,
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
//     child: Text(label, style: const TextStyle(fontFamily: 'Poppins', fontSize: 10,
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
//               Text('Messages', style: TextStyle(fontFamily: 'Poppins', fontSize: 18,
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
//           Text(name, style: const TextStyle(fontFamily: 'Poppins', fontSize: 13,
//               fontWeight: FontWeight.w700, color: C.primaryDark)),
//           Text(msg, style: const TextStyle(fontFamily: 'Poppins', fontSize: 11,
//               color: C.textMuted), maxLines: 1, overflow: TextOverflow.ellipsis),
//         ])),
//         const SizedBox(width: 8),
//         Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//           Text(time, style: const TextStyle(fontFamily: 'Poppins', fontSize: 10,
//               color: C.textLight)),
//           if (unread > 0) ...[
//             const SizedBox(height: 5),
//             Container(
//               width: 20, height: 20,
//               decoration: const BoxDecoration(color: C.primary, shape: BoxShape.circle),
//               child: Center(child: Text('$unread',
//                 style: const TextStyle(fontFamily: 'Poppins', fontSize: 10,
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
//           // Chat header
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
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 13,
//                       fontWeight: FontWeight.w700, color: C.primaryDark)),
//                 Row(children: [
//                   CircleAvatar(radius: 4, backgroundColor: Color(0xFF4CAF50)),
//                   SizedBox(width: 4),
//                   Text('Online', style: TextStyle(fontFamily: 'Poppins', fontSize: 10,
//                       color: Color(0xFF4CAF50))),
//                 ]),
//               ])),
//               const Icon(Icons.phone_rounded, color: C.primaryDark, size: 20),
//             ]),
//           ),
//           // Messages
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
//           // Input
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
//                     style: TextStyle(fontFamily: 'Poppins', fontSize: 12,
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
//           style: TextStyle(fontFamily: 'Poppins', fontSize: 12,
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
//         Positioned(top: 80, left: 30,
//           child: _Confetti(color: C.gold, size: 14)),
//         Positioned(top: 110, right: 40,
//           child: _Confetti(color: C.primary, size: 10)),
//         Positioned(bottom: 200, left: 50,
//           child: _Confetti(color: C.primaryDark, size: 9, opacity: 0.3)),
//         Positioned(bottom: 250, right: 30,
//           child: _Confetti(color: C.gold, size: 12, opacity: 0.5)),
//         SafeArea(
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(32),
//               child: Column(mainAxisSize: MainAxisSize.min, children: [
//                 const Text('💌', style: TextStyle(fontSize: 72)),
//                 const SizedBox(height: 18),
//                 const Text('Interest Sent!',
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 24,
//                       fontWeight: FontWeight.w700, color: C.primaryDark)),
//                 const SizedBox(height: 10),
//                 const Text.rich(TextSpan(children: [
//                   TextSpan(text: 'Your interest has been sent to\n',
//                     style: TextStyle(fontFamily: 'Poppins', fontSize: 13,
//                         color: C.textMuted, height: 1.7)),
//                   TextSpan(text: 'Priya Ramachandran\n',
//                     style: TextStyle(fontFamily: 'Poppins', fontSize: 13,
//                         fontWeight: FontWeight.w700, color: C.primaryDark, height: 1.7)),
//                   TextSpan(text: "You'll be notified when she responds.",
//                     style: TextStyle(fontFamily: 'Poppins', fontSize: 13,
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
//             style: TextStyle(fontFamily: 'Poppins', fontSize: 13, color: C.textMuted)),
//           const SizedBox(height: 20),
//           // Free plan
//           AppCard(
//             padding: const EdgeInsets.all(16),
//             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               const Row(children: [
//                 Expanded(child: Text('Free',
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 16,
//                       fontWeight: FontWeight.w700, color: C.primaryDark))),
//                 Text('₹0', style: TextStyle(fontFamily: 'Poppins', fontSize: 22,
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
//           // Premium (highlighted)
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
//                     style: TextStyle(fontFamily: 'Poppins', fontSize: 16,
//                         fontWeight: FontWeight.w700, color: Colors.white))),
//                   Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//                     Text('₹999', style: TextStyle(fontFamily: 'Poppins', fontSize: 22,
//                         fontWeight: FontWeight.w800, color: Colors.white)),
//                     Text('/ 3 months', style: TextStyle(fontFamily: 'Poppins',
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
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 10,
//                       fontWeight: FontWeight.w700, color: Colors.white)),
//               )),
//             ),
//           ]),
//           const SizedBox(height: 16),
//           // Premium Plus
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
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 16,
//                       fontWeight: FontWeight.w700, color: Colors.white))),
//                 Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//                   Text('₹1,799', style: TextStyle(fontFamily: 'Poppins', fontSize: 22,
//                       fontWeight: FontWeight.w800, color: Colors.white)),
//                   Text('/ 6 months', style: TextStyle(fontFamily: 'Poppins',
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
//       style: const TextStyle(fontFamily: 'Poppins', fontSize: 11,
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
//           Text(title, style: const TextStyle(fontFamily: 'Poppins', fontSize: 12,
//               fontWeight: FontWeight.w700, color: C.primaryDark)),
//           const SizedBox(height: 2),
//           Text(sub, style: const TextStyle(fontFamily: 'Poppins', fontSize: 11,
//               color: C.textMuted)),
//           const SizedBox(height: 2),
//           Text(time, style: const TextStyle(fontFamily: 'Poppins', fontSize: 10,
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
//           // Gradient profile header
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
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 16,
//                       fontWeight: FontWeight.w700, color: Colors.white)),
//                 Text('VB-2024-88921',
//                   style: TextStyle(fontFamily: 'Poppins', fontSize: 10,
//                       color: Colors.white70)),
//                 SizedBox(height: 4),
//                 BadgeGold(label: '⭐ Premium'),
//               ]),
//               const Spacer(),
//               const Icon(Icons.edit_rounded, color: Colors.white, size: 18),
//             ]),
//           ),
//           // Profile completeness
//           Padding(
//             padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
//             child: AppCard(
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                   Text('Profile Complete',
//                     style: TextStyle(fontFamily: 'Poppins', fontSize: 12,
//                         fontWeight: FontWeight.w600, color: C.primaryDark)),
//                   Text('78%', style: TextStyle(fontFamily: 'Poppins', fontSize: 12,
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
//           // Menu
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
//                     style: TextStyle(fontFamily: 'Poppins', fontSize: 13,
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
//       Expanded(child: Text(label, style: const TextStyle(fontFamily: 'Poppins',
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
//               Text(title, style: const TextStyle(fontFamily: 'Poppins', fontSize: 14,
//                   fontWeight: FontWeight.w700, color: C.primaryDark)),
//               const SizedBox(height: 4),
//               Text(desc, style: const TextStyle(fontFamily: 'Poppins', fontSize: 12,
//                   color: C.textMuted, height: 1.5)),
//               const SizedBox(height: 10),
//               Row(children: [
//                 const Icon(Icons.favorite_rounded, color: C.primary, size: 16),
//                 const SizedBox(width: 4),
//                 Text(likes, style: const TextStyle(fontFamily: 'Poppins',
//                     fontSize: 11, color: C.textLight)),
//                 if (comments != null) ...[
//                   const SizedBox(width: 14),
//                   const Icon(Icons.chat_bubble_outline_rounded,
//                       color: C.textLight, size: 16),
//                   const SizedBox(width: 4),
//                   Text(comments!, style: const TextStyle(fontFamily: 'Poppins',
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




