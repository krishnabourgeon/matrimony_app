// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:matrimony_app/view/onboarding_screen.dart';

// /// ── VivahBharath brand palette ──
// class _SplashColors {
//   static const Color burgundy = Color(0xFF8B1E3F);
//   static const Color rosePink = Color(0xFFE85D75);
//   static const Color gold = Color(0xFFD4AF37);
//   static const Color ivory = Color(0xFFFFF8F3);
//   static const Color blush = Color(0xFFFFECEF);
// }

// /// A distinctive splash screen built around a mandap-style pointed arch
// /// (a classic Indian wedding motif) instead of a generic circular logo
// /// badge. The arch draws itself in like an ink stroke, small gold corner
// /// flourishes fade in, the heart+rings mark appears inside the arch with a
// /// soft glow (no hard circle), and a few petals drift slowly in the
// /// background for quiet motion.
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() =>
//       _SplashScreenState();
// }

// class _SplashScreenState
//     extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   // ── One-shot entrance: arch draw-in, corner flourishes, mark, text ──
//   late final AnimationController _entrance = AnimationController(
//     vsync: this,
//     duration: const Duration(milliseconds: 2200),
//   );

//   // ── Continuous loop: petals drifting down ──
//   late final AnimationController _petals = AnimationController(
//     vsync: this,
//     duration: const Duration(seconds: 9),
//   )..repeat();

//   final List<_Petal> _petalSeeds = List.generate(7, (i) => _Petal(seed: i));

//   // Arch outline: draws in like an ink stroke
//   late final Animation<double> _archDraw = CurvedAnimation(
//     parent: _entrance,
//     curve: const Interval(0.0, 0.45, curve: Curves.easeInOut),
//   );

//   // Corner flourishes: fade + gentle scale
//   late final Animation<double> _cornerFade = CurvedAnimation(
//     parent: _entrance,
//     curve: const Interval(0.3, 0.6, curve: Curves.easeOut),
//   );

//   // Heart+rings mark inside the arch: fade + soft scale, appears after the
//   // arch has mostly drawn itself
//   late final Animation<double> _markFade = CurvedAnimation(
//     parent: _entrance,
//     curve: const Interval(0.42, 0.72, curve: Curves.easeOut),
//   );
//   late final Animation<double> _markScale = Tween(begin: 0.85, end: 1.0).animate(
//     CurvedAnimation(
//       parent: _entrance,
//       curve: const Interval(0.42, 0.72, curve: Curves.easeOutCubic),
//     ),
//   );

//   // App name: fade + rise
//   late final Animation<double> _nameFade = CurvedAnimation(
//     parent: _entrance,
//     curve: const Interval(0.6, 0.92, curve: Curves.easeOut),
//   );
//   late final Animation<Offset> _nameRise = Tween(
//     begin: const Offset(0, 0.2),
//     end: Offset.zero,
//   ).animate(CurvedAnimation(
//     parent: _entrance,
//     curve: const Interval(0.6, 0.92, curve: Curves.easeOut),
//   ));

//   // Tagline: fades in last
//   late final Animation<double> _taglineFade = CurvedAnimation(
//     parent: _entrance,
//     curve: const Interval(0.78, 1.0, curve: Curves.easeOut),
//   );

//   bool _exiting = false;

//   @override
//   void initState() {
//     super.initState();
//     _entrance.forward();

//     Future.delayed(const Duration(milliseconds: 2900), () {
//       if (mounted) setState(() => _exiting = true);
//     });
//     Future.delayed(const Duration(milliseconds: 3300), () {
//       if (mounted) {
//         Navigator.pushReplacement(
//           context,
//           PageRouteBuilder(
//             transitionDuration: const Duration(milliseconds: 450),
//             pageBuilder: (_, animation, __) => FadeTransition(
//               opacity: animation,
//               child: const OnboardingScreen(),
//             ),
//           ),
//         );
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _entrance.dispose();
//     _petals.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: _SplashColors.ivory,
//       body: AnimatedOpacity(
//         opacity: _exiting ? 0.0 : 1.0,
//         duration: const Duration(milliseconds: 400),
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [_SplashColors.ivory, _SplashColors.blush],
//             ),
//           ),
//           child: Stack(
//             children: [
//               // ── Slowly drifting petals ──
//               Positioned.fill(
//                 child: AnimatedBuilder(
//                   animation: _petals,
//                   builder: (context, _) {
//                     return CustomPaint(
//                       painter: _PetalPainter(
//                         progress: _petals.value,
//                         seeds: _petalSeeds,
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               // ── Corner flourishes ──
//               FadeTransition(
//                 opacity: _cornerFade,
//                 child: const Stack(
//                   children: [
//                     Positioned(top: 28, left: 24, child: _CornerFlourish(rotation: 0)),
//                     Positioned(
//                       top: 28,
//                       right: 24,
//                       child: _CornerFlourish(rotation: math.pi / 2),
//                     ),
//                     Positioned(
//                       bottom: 28,
//                       left: 24,
//                       child: _CornerFlourish(rotation: -math.pi / 2),
//                     ),
//                     Positioned(
//                       bottom: 28,
//                       right: 24,
//                       child: _CornerFlourish(rotation: math.pi),
//                     ),
//                   ],
//                 ),
//               ),

//               // ── Center content ──
//               SafeArea(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Spacer(flex: 4),

//                     // ── Mandap-style arch frame with the mark inside ──
//                     SizedBox(
//                       height: 200,
//                       width: 190,
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           // Arch outline, drawing itself in
//                           AnimatedBuilder(
//                             animation: _archDraw,
//                             builder: (context, _) {
//                               return CustomPaint(
//                                 size: const Size(190, 200),
//                                 painter: _ArchPainter(
//                                   progress: _archDraw.value,
//                                   color: _SplashColors.gold,
//                                 ),
//                               );
//                             },
//                           ),

//                           // Soft glow behind the mark (no hard circle)
//                           FadeTransition(
//                             opacity: _markFade,
//                             child: Container(
//                               height: 92,
//                               width: 92,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 gradient: RadialGradient(
//                                   colors: [
//                                     Colors.white.withOpacity(0.9),
//                                     Colors.white.withOpacity(0.0),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),

//                           // Heart+rings placeholder mark
//                           FadeTransition(
//                             opacity: _markFade,
//                             child: ScaleTransition(
//                               scale: _markScale,
//                               child: SizedBox(
//                                 height: 74,
//                                 width: 74,
//                                 // Replace this CustomPaint with
//                                 // Image.asset("assets/image/logo.png")
//                                 // once the real logo is ready.
//                                 child: CustomPaint(
//                                   painter: _HeartRingsPainter(
//                                     burgundy: _SplashColors.burgundy,
//                                     gold: _SplashColors.gold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 14),

//                     // ── App name ──
//                     SlideTransition(
//                       position: _nameRise,
//                       child: FadeTransition(
//                         opacity: _nameFade,
//                         child: RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: "Vivah",
//                                 style: GoogleFonts.playfairDisplay(
//                                   color: _SplashColors.burgundy,
//                                   fontSize: 36,
//                                   fontWeight: FontWeight.w700,
//                                   letterSpacing: 0.2,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: "Bharath",
//                                 style: GoogleFonts.tasaOrbiter(
//                                   color: _SplashColors.burgundy,
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.w600,
//                                   letterSpacing: 0.2,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 8),

//                     // ── Tagline ──
//                     FadeTransition(
//                       opacity: _taglineFade,
//                       child: Text(
//                         "FIND YOUR PERFECT LIFE PARTNER",
//                         style: GoogleFonts.tasaOrbiter(
//                           color: _SplashColors.burgundy.withOpacity(0.6),
//                           letterSpacing: 2,
//                           fontSize: 11,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),

//                     const Spacer(flex: 5),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// A small quarter-mandala style flourish for the four screen corners —
// /// two nested arcs and a dot, simple enough to read as ornamental rather
// /// than busy.
// class _CornerFlourish extends StatelessWidget {
//   final double rotation;
//   const _CornerFlourish({required this.rotation});

//   @override
//   Widget build(BuildContext context) {
//     return Transform.rotate(
//       angle: rotation,
//       child: CustomPaint(
//         size: const Size(46, 46),
//         painter: _FlourishPainter(color: _SplashColors.gold.withOpacity(0.55)),
//       ),
//     );
//   }
// }

// class _FlourishPainter extends CustomPainter {
//   final Color color;
//   _FlourishPainter({required this.color});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1.4
//       ..strokeCap = StrokeCap.round;

//     final rect1 = Rect.fromCircle(center: Offset.zero, radius: size.width * 0.9);
//     final rect2 = Rect.fromCircle(center: Offset.zero, radius: size.width * 0.6);

//     canvas.drawArc(rect1, math.pi, math.pi / 2, false, paint);
//     canvas.drawArc(rect2, math.pi, math.pi / 2, false, paint);

//     canvas.drawCircle(
//       Offset(-size.width * 0.6, 0),
//       2.2,
//       Paint()..color = color,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant _FlourishPainter oldDelegate) => false;
// }

// /// Paints a mandap-style pointed arch outline (two curved sides meeting in
// /// a soft point at the top), animated to draw itself in over `progress`.
// class _ArchPainter extends CustomPainter {
//   final double progress; // 0..1, one-shot
//   final Color color;

//   _ArchPainter({required this.progress, required this.color});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final path = Path();
//     final w = size.width;
//     final h = size.height;

//     // Start bottom-left, curve up to a soft point at top-center, curve
//     // back down to bottom-right.
//     path.moveTo(w * 0.06, h * 0.98);
//     path.cubicTo(
//       w * 0.02, h * 0.45,
//       w * 0.18, h * 0.05,
//       w * 0.5, h * 0.02,
//     );
//     path.cubicTo(
//       w * 0.82, h * 0.05,
//       w * 0.98, h * 0.45,
//       w * 0.94, h * 0.98,
//     );

//     final metrics = path.computeMetrics().toList();
//     final drawPath = Path();
//     for (final metric in metrics) {
//       drawPath.addPath(
//         metric.extractPath(0, metric.length * progress),
//         Offset.zero,
//       );
//     }

//     final paint = Paint()
//       ..color = color.withOpacity(0.85)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.0
//       ..strokeCap = StrokeCap.round;

//     canvas.drawPath(drawPath, paint);

//     // A thin inner echo line for a little extra elegance once mostly drawn.
//     if (progress > 0.5) {
//       final innerOpacity = ((progress - 0.5) / 0.5).clamp(0.0, 1.0) * 0.35;
//       final innerPaint = Paint()
//         ..color = color.withOpacity(innerOpacity)
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 1.0;
//       final innerPath = Path();
//       innerPath.moveTo(w * 0.14, h * 0.95);
//       innerPath.cubicTo(
//         w * 0.1, h * 0.5,
//         w * 0.24, h * 0.14,
//         w * 0.5, h * 0.11,
//       );
//       innerPath.cubicTo(
//         w * 0.76, h * 0.14,
//         w * 0.9, h * 0.5,
//         w * 0.86, h * 0.95,
//       );
//       canvas.drawPath(innerPath, innerPaint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant _ArchPainter oldDelegate) =>
//       oldDelegate.progress != progress;
// }

// /// Placeholder brand mark: a small burgundy heart at the intersection of
// /// two interlocking gold wedding-band rings. Swap for the real logo asset
// /// later — replace the CustomPaint above with an Image.asset.
// class _HeartRingsPainter extends CustomPainter {
//   final Color burgundy;
//   final Color gold;

//   _HeartRingsPainter({required this.burgundy, required this.gold});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final ringRadius = size.width * 0.26;
//     final ringPaint = Paint()
//       ..color = gold
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width * 0.05;

//     canvas.drawCircle(
//       center.translate(-ringRadius * 0.55, ringRadius * 0.1),
//       ringRadius,
//       ringPaint,
//     );
//     canvas.drawCircle(
//       center.translate(ringRadius * 0.55, ringRadius * 0.1),
//       ringRadius,
//       ringPaint,
//     );

//     final heartPaint = Paint()
//       ..color = burgundy
//       ..style = PaintingStyle.fill;
//     final s = size.width * 0.24;
//     final heartCenter = center.translate(0, -ringRadius * 0.55);

//     final path = Path();
//     path.moveTo(heartCenter.dx, heartCenter.dy + s * 0.32);
//     path.cubicTo(
//       heartCenter.dx - s, heartCenter.dy - s * 0.55,
//       heartCenter.dx - s * 0.5, heartCenter.dy - s,
//       heartCenter.dx, heartCenter.dy - s * 0.22,
//     );
//     path.cubicTo(
//       heartCenter.dx + s * 0.5, heartCenter.dy - s,
//       heartCenter.dx + s, heartCenter.dy - s * 0.55,
//       heartCenter.dx, heartCenter.dy + s * 0.32,
//     );
//     path.close();
//     canvas.drawPath(path, heartPaint);
//   }

//   @override
//   bool shouldRepaint(covariant _HeartRingsPainter oldDelegate) => false;
// }

// /// A single drifting petal's random-but-fixed characteristics.
// class _Petal {
//   final double startX;
//   final double size;
//   final double speed;
//   final double phase;
//   final double sway;
//   final double rotationSpeed;

//   _Petal({required int seed})
//       : startX = _rand(seed, 0),
//         size = 8 + _rand(seed, 1) * 6,
//         speed = 0.5 + _rand(seed, 2) * 0.5,
//         phase = _rand(seed, 3),
//         sway = 20 + _rand(seed, 4) * 30,
//         rotationSpeed = 0.6 + _rand(seed, 5) * 0.8;

//   static double _rand(int seed, int salt) {
//     final x = math.sin((seed + 1) * 12.9898 + salt * 78.233) * 43758.5453;
//     return x - x.floorToDouble();
//   }
// }

// /// Paints a handful of small petal shapes drifting slowly downward with a
// /// gentle sway and rotation — quiet background motion, not confetti.
// class _PetalPainter extends CustomPainter {
//   final double progress; // 0..1, loops
//   final List<_Petal> seeds;

//   _PetalPainter({required this.progress, required this.seeds});

//   @override
//   void paint(Canvas canvas, Size size) {
//     for (final p in seeds) {
//       final t = (progress * p.speed + p.phase) % 1.0;

//       final dy = size.height * t - size.height * 0.1;
//       final swayX = math.sin(t * 2 * math.pi) * p.sway;
//       final dx = p.startX * size.width + swayX;

//       final opacity = (math.sin(t * math.pi)).clamp(0.0, 1.0) * 0.4;
//       final angle = t * 2 * math.pi * p.rotationSpeed;

//       canvas.save();
//       canvas.translate(dx, dy);
//       canvas.rotate(angle);

//       final paint = Paint()
//         ..color = _SplashColors.rosePink.withOpacity(opacity)
//         ..style = PaintingStyle.fill;

//       final petalPath = Path();
//       petalPath.moveTo(0, -p.size / 2);
//       petalPath.quadraticBezierTo(p.size / 2, 0, 0, p.size / 2);
//       petalPath.quadraticBezierTo(-p.size / 2, 0, 0, -p.size / 2);
//       petalPath.close();

//       canvas.drawPath(petalPath, paint);
//       canvas.restore();
//     }
//   }

//   @override
//   bool shouldRepaint(covariant _PetalPainter oldDelegate) =>
//       oldDelegate.progress != progress;
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/onboarding_screen.dart';

/// Simple, bold splash screen: a solid coral field with the wordmark
/// fading and scaling gently into place, then handing off to onboarding.
/// No ornamentation — the color and typography carry the brand.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entrance = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  );

  late final Animation<double> _fade = CurvedAnimation(
    parent: _entrance,
    curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
  );

  late final Animation<double> _scale = Tween(begin: 0.92, end: 1.0).animate(
    CurvedAnimation(
      parent: _entrance,
      curve: const Interval(0.0, 1.0, curve: Curves.easeOutCubic),
    ),
  );

  bool _exiting = false;

  @override
  void initState() {
    super.initState();
    _entrance.forward();

    Future.delayed(const Duration(milliseconds: 1700), () {
      if (mounted) setState(() => _exiting = true);
    });
    Future.delayed(const Duration(milliseconds: 2100), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 450),
            pageBuilder: (_, animation, __) => FadeTransition(
              opacity: animation,
              child: const OnboardingScreen(),
            ),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _entrance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.coral,
      body: AnimatedOpacity(
        opacity: _exiting ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 350),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: FadeTransition(
              opacity: _fade,
              child: ScaleTransition(
                scale: _scale,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Vivah',
                      style: GoogleFonts.tasaOrbiter(
                        color: AppColors.subtleWhite,
                        fontSize: 44,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.2,
                      ),
                    ),
                    // const SizedBox(height: 6),
                    // Text(
                    //   'BHARATH',
                    //   style: GoogleFonts.tasaOrbiter(
                    //     color: AppColors.subtleWhite.withOpacity(0.85),
                    //     fontSize: 13,
                    //     fontWeight: FontWeight.w600,
                    //     letterSpacing: 4,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
