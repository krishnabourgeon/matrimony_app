// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/onboarding_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   // ── Entrance: plays once ──
//   late final AnimationController _entrance = AnimationController(
//     vsync: this,
//     duration: const Duration(milliseconds: 1400),
//   );

//   // ── Loop: subtle continuous pulse + progress dots ──
//   late final AnimationController _pulse = AnimationController(
//     vsync: this,
//     duration: const Duration(milliseconds: 1800),
//   )..repeat(reverse: true);

//   late final AnimationController _dots = AnimationController(
//     vsync: this,
//     duration: const Duration(milliseconds: 1200),
//   )..repeat();

//   // Logo: scale + fade in first
//   late final Animation<double> _logoScale = CurvedAnimation(
//     parent: _entrance,
//     curve: const Interval(0.0, 0.55, curve: Curves.easeOutBack),
//   );
//   late final Animation<double> _logoFade = CurvedAnimation(
//     parent: _entrance,
//     curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
//   );

//   // Title: fades + slides up after logo
//   late final Animation<double> _titleFade = CurvedAnimation(
//     parent: _entrance,
//     curve: const Interval(0.4, 0.75, curve: Curves.easeOut),
//   );
//   late final Animation<Offset> _titleSlide = Tween(
//     begin: const Offset(0, 0.25),
//     end: Offset.zero,
//   ).animate(CurvedAnimation(
//     parent: _entrance,
//     curve: const Interval(0.4, 0.75, curve: Curves.easeOut),
//   ));

//   // Subtitle: fades + slides up right after title
//   late final Animation<double> _subtitleFade = CurvedAnimation(
//     parent: _entrance,
//     curve: const Interval(0.55, 0.9, curve: Curves.easeOut),
//   );
//   late final Animation<Offset> _subtitleSlide = Tween(
//     begin: const Offset(0, 0.25),
//     end: Offset.zero,
//   ).animate(CurvedAnimation(
//     parent: _entrance,
//     curve: const Interval(0.55, 0.9, curve: Curves.easeOut),
//   ));

//   // Loader: fades in last
//   late final Animation<double> _loaderFade = CurvedAnimation(
//     parent: _entrance,
//     curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
//   );

//   // Subtle continuous pulse scale for the logo ring (standard "breathing" effect)
//   late final Animation<double> _ringPulse = Tween(begin: 1.0, end: 1.08).animate(
//     CurvedAnimation(parent: _pulse, curve: Curves.easeInOut),
//   );

//   @override
//   void initState() {
//     super.initState();
//     _entrance.forward();
//     Future.delayed(const Duration(milliseconds: 9500), () {
//       if (mounted) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => const OnboardingScreen()),
//         );
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _entrance.dispose();
//     _pulse.dispose();
//     _dots.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [AppColors.primary, AppColors.primaryDark],
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Spacer(flex: 3),

//               // ── Logo with subtle breathing ring ──
//               FadeTransition(
//                 opacity: _logoFade,
//                 child: ScaleTransition(
//                   scale: _logoScale,
//                   child: AnimatedBuilder(
//                     animation: _ringPulse,
//                     builder: (context, child) {
//                       return Container(
//                         height: 116,
//                         width: 116,
//                         alignment: Alignment.center,
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             // Breathing outer ring
//                             Transform.scale(
//                               scale: _ringPulse.value,
//                               child: Container(
//                                 height: 116,
//                                 width: 116,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   border: Border.all(
//                                     color: Colors.white.withOpacity(0.35),
//                                     width: 1.5,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             // Static inner logo circle
//                             Container(
//                               height: 96,
//                               width: 96,
//                               padding: const EdgeInsets.all(14),
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.15),
//                                     blurRadius: 20,
//                                     offset: const Offset(0, 8),
//                                   ),
//                                 ],
//                               ),
//                               child: ClipOval(
//                                 child: Image.asset(
//                                   "assets/image/logo.png",
//                                   fit: BoxFit.cover,
//                                   errorBuilder: (_, __, ___) => const Icon(
//                                     Icons.favorite_rounded,
//                                     color: AppColors.primary,
//                                     size: 40,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 28),

//               // ── Title ──
//               SlideTransition(
//                 position: _titleSlide,
//                 child: FadeTransition(
//                   opacity: _titleFade,
//                   child: Text(
//                     "VivahBharath",
//                     style: GoogleFonts.playfairDisplay(
//                       color: Colors.white,
//                       fontSize: 36,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 0.2,
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 10),

//               // ── Subtitle ──
//               SlideTransition(
//                 position: _subtitleSlide,
//                 child: FadeTransition(
//                   opacity: _subtitleFade,
//                   child: Text(
//                     "FIND YOUR PERFECT LIFE PARTNER",
//                     style: GoogleFonts.poppins(
//                       color: Colors.white.withOpacity(0.85),
//                       letterSpacing: 2,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),

//               const Spacer(flex: 4),

//               // ── Standard animated loading dots ──
//               FadeTransition(
//                 opacity: _loaderFade,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List.generate(3, (i) => _loaderDot(i)),
//                 ),
//               ),

//               const SizedBox(height: 48),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _loaderDot(int index) {
//     return AnimatedBuilder(
//       animation: _dots,
//       builder: (context, child) {
//         final t = (_dots.value + index * 0.2) % 1.0;
//         // Standard easeInOut bounce between 0.4 and 1.0 opacity/scale
//         final wave = (math.sin(t * math.pi)).clamp(0.0, 1.0);
//         return Container(
//           margin: const EdgeInsets.symmetric(horizontal: 4),
//           child: Opacity(
//             opacity: 0.4 + 0.6 * wave,
//             child: Transform.scale(
//               scale: 0.7 + 0.3 * wave,
//               child: Container(
//                 width: 9,
//                 height: 9,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }














import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // ── Entrance: plays once ──
  late final AnimationController _entrance = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  );

  // ── Loop: subtle continuous pulse + progress dots ──
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  )..repeat(reverse: true);

  late final AnimationController _dots = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat();

  // ── New: slow rotating accent ring around the logo ──
  late final AnimationController _rotation = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 6),
  )..repeat();

  // ── New: shimmer sweep across the title text ──
  late final AnimationController _shimmer = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2200),
  )..repeat();

  // ── New: floating background particles (hearts) ──
  late final AnimationController _particles = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 8),
  )..repeat();

  // ── New: slow background gradient color drift ──
  late final AnimationController _bgShift = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  )..repeat(reverse: true);

  final List<_Particle> _particleSeeds =
      List.generate(14, (i) => _Particle(seed: i));

  // Logo: scale + fade in first
  late final Animation<double> _logoScale = CurvedAnimation(
    parent: _entrance,
    curve: const Interval(0.0, 0.55, curve: Curves.easeOutBack),
  );
  late final Animation<double> _logoFade = CurvedAnimation(
    parent: _entrance,
    curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
  );

  // Title: fades + slides up after logo
  late final Animation<double> _titleFade = CurvedAnimation(
    parent: _entrance,
    curve: const Interval(0.4, 0.75, curve: Curves.easeOut),
  );
  late final Animation<Offset> _titleSlide = Tween(
    begin: const Offset(0, 0.25),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _entrance,
    curve: const Interval(0.4, 0.75, curve: Curves.easeOut),
  ));

  // Subtitle: fades + slides up right after title
  late final Animation<double> _subtitleFade = CurvedAnimation(
    parent: _entrance,
    curve: const Interval(0.55, 0.9, curve: Curves.easeOut),
  );
  late final Animation<Offset> _subtitleSlide = Tween(
    begin: const Offset(0, 0.25),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _entrance,
    curve: const Interval(0.55, 0.9, curve: Curves.easeOut),
  ));

  // Loader: fades in last
  late final Animation<double> _loaderFade = CurvedAnimation(
    parent: _entrance,
    curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
  );

  // Subtle continuous pulse scale for the logo ring (standard "breathing" effect)
  late final Animation<double> _ringPulse = Tween(begin: 1.0, end: 1.08).animate(
    CurvedAnimation(parent: _pulse, curve: Curves.easeInOut),
  );

  @override
  void initState() {
    super.initState();
    _entrance.forward();
    Future.delayed(const Duration(milliseconds: 9500), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _entrance.dispose();
    _pulse.dispose();
    _dots.dispose();
    _rotation.dispose();
    _shimmer.dispose();
    _particles.dispose();
    _bgShift.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _bgShift,
        builder: (context, child) {
          // Gently drift the gradient stops for a "living" background
          final t = _bgShift.value;
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.0 + t * 0.4, -1.0),
                end: Alignment(1.0 - t * 0.4, 1.0),
                colors: [AppColors.primary, AppColors.primaryDark],
              ),
            ),
            child: child,
          );
        },
        child: Stack(
          children: [
            // ── Floating particle hearts drifting upward ──
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _particles,
                builder: (context, _) {
                  return CustomPaint(
                    painter: _ParticlePainter(
                      progress: _particles.value,
                      seeds: _particleSeeds,
                    ),
                  );
                },
              ),
            ),

            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),

                  // ── Logo with breathing ring + slow rotating accent ring ──
                  FadeTransition(
                    opacity: _logoFade,
                    child: ScaleTransition(
                      scale: _logoScale,
                      child: AnimatedBuilder(
                        animation:
                            Listenable.merge([_ringPulse, _rotation]),
                        builder: (context, child) {
                          return Container(
                            height: 140,
                            width: 140,
                            alignment: Alignment.center,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Rotating dashed accent ring (outermost)
                                Transform.rotate(
                                  angle: _rotation.value * 2 * math.pi,
                                  child: CustomPaint(
                                    size: const Size(140, 140),
                                    painter: _DashedRingPainter(
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                // Breathing outer ring
                                Transform.scale(
                                  scale: _ringPulse.value,
                                  child: Container(
                                    height: 116,
                                    width: 116,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.35),
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                                // Static inner logo circle
                                Container(
                                  height: 96,
                                  width: 96,
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 20,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/image/logo.png",
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => const Icon(
                                        Icons.favorite_rounded,
                                        color: AppColors.primary,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ── Title with shimmer sweep ──
                  SlideTransition(
                    position: _titleSlide,
                    child: FadeTransition(
                      opacity: _titleFade,
                      child: AnimatedBuilder(
                        animation: _shimmer,
                        builder: (context, child) {
                          return ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) {
                              final dx = _shimmer.value * 2 - 1;
                              return LinearGradient(
                                begin: Alignment(-1.5 + dx * 2, 0),
                                end: Alignment(1.5 + dx * 2, 0),
                                colors: const [
                                  Colors.white,
                                  Color(0xFFFFF3D6),
                                  Colors.white,
                                ],
                                stops: const [0.35, 0.5, 0.65],
                              ).createShader(bounds);
                            },
                            child: Text(
                              "VivahBharath",
                              style: GoogleFonts.playfairDisplay(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.2,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ── Subtitle ──
                  SlideTransition(
                    position: _subtitleSlide,
                    child: FadeTransition(
                      opacity: _subtitleFade,
                      child: Text(
                        "FIND YOUR PERFECT LIFE PARTNER",
                        style: GoogleFonts.poppins(
                          color: Colors.white.withOpacity(0.85),
                          letterSpacing: 2,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  const Spacer(flex: 4),

                  // ── Standard animated loading dots ──
                  FadeTransition(
                    opacity: _loaderFade,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (i) => _loaderDot(i)),
                    ),
                  ),

                  const SizedBox(height: 48),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loaderDot(int index) {
    return AnimatedBuilder(
      animation: _dots,
      builder: (context, child) {
        final t = (_dots.value + index * 0.2) % 1.0;
        // Standard easeInOut bounce between 0.4 and 1.0 opacity/scale
        final wave = (math.sin(t * math.pi)).clamp(0.0, 1.0);
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Opacity(
            opacity: 0.4 + 0.6 * wave,
            child: Transform.scale(
              scale: 0.7 + 0.3 * wave,
              child: Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// A single drifting particle's random-but-fixed characteristics.
class _Particle {
  final double startX; // 0..1 fraction of width
  final double size;
  final double speed; // relative speed multiplier
  final double phase; // offset into the loop so they don't move in sync
  final double drift; // horizontal sway amount

  _Particle({required int seed})
      : startX = _rand(seed, 0),
        size = 6 + _rand(seed, 1) * 10,
        speed = 0.6 + _rand(seed, 2) * 0.8,
        phase = _rand(seed, 3),
        drift = (_rand(seed, 4) - 0.5) * 40;

  static double _rand(int seed, int salt) {
    final x = math.sin((seed + 1) * 12.9898 + salt * 78.233) * 43758.5453;
    return x - x.floorToDouble();
  }
}

/// Paints small translucent heart particles floating upward and fading,
/// looping seamlessly.
class _ParticlePainter extends CustomPainter {
  final double progress; // 0..1
  final List<_Particle> seeds;

  _ParticlePainter({required this.progress, required this.seeds});

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in seeds) {
      // Each particle loops independently using its own phase + speed.
      final t = (progress * p.speed + p.phase) % 1.0;

      final dy = size.height * (1 - t); // travels from bottom to top
      final sway = math.sin(t * 2 * math.pi) * p.drift;
      final dx = p.startX * size.width + sway;

      // Fade in near the bottom, fade out near the top.
      final opacity = (math.sin(t * math.pi)).clamp(0.0, 1.0) * 0.35;

      final paint = Paint()
        ..color = Colors.white.withOpacity(opacity)
        ..style = PaintingStyle.fill;

      _drawHeart(canvas, Offset(dx, dy), p.size, paint);
    }
  }

  void _drawHeart(Canvas canvas, Offset center, double size, Paint paint) {
    final path = Path();
    final s = size;
    path.moveTo(center.dx, center.dy + s * 0.3);
    path.cubicTo(
      center.dx - s, center.dy - s * 0.6,
      center.dx - s * 0.5, center.dy - s,
      center.dx, center.dy - s * 0.2,
    );
    path.cubicTo(
      center.dx + s * 0.5, center.dy - s,
      center.dx + s, center.dy - s * 0.6,
      center.dx, center.dy + s * 0.3,
    );
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) =>
      oldDelegate.progress != progress;
}

/// Paints a slowly rotating dashed ring behind the logo for extra motion.
class _DashedRingPainter extends CustomPainter {
  final Color color;
  _DashedRingPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 2;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;

    const dashCount = 18;
    const dashFraction = 0.55; // portion of each segment that is drawn
    final anglePerDash = (2 * math.pi) / dashCount;

    for (int i = 0; i < dashCount; i++) {
      final startAngle = i * anglePerDash;
      final sweep = anglePerDash * dashFraction;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweep,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _DashedRingPainter oldDelegate) =>
      oldDelegate.color != color;
}