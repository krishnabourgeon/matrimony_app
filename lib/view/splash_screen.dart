// // // import 'dart:math' as math;
// // // import 'package:flutter/material.dart';
// // // import 'package:google_fonts/google_fonts.dart';
// // // import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// // // import 'package:matrimony_app/view/onboarding_screen.dart';

// // // class SplashScreen extends StatefulWidget {
// // //   const SplashScreen({super.key});

// // //   @override
// // //   State<SplashScreen> createState() => _SplashScreenState();
// // // }

// // // class _SplashScreenState extends State<SplashScreen>
// // //     with TickerProviderStateMixin {
// // //   // ── Entrance: plays once ──
// // //   late final AnimationController _entrance = AnimationController(
// // //     vsync: this,
// // //     duration: const Duration(milliseconds: 1400),
// // //   );

// // //   // ── Loop: subtle continuous pulse + progress dots ──
// // //   late final AnimationController _pulse = AnimationController(
// // //     vsync: this,
// // //     duration: const Duration(milliseconds: 1800),
// // //   )..repeat(reverse: true);

// // //   late final AnimationController _dots = AnimationController(
// // //     vsync: this,
// // //     duration: const Duration(milliseconds: 1200),
// // //   )..repeat();

// // //   // Logo: scale + fade in first
// // //   late final Animation<double> _logoScale = CurvedAnimation(
// // //     parent: _entrance,
// // //     curve: const Interval(0.0, 0.55, curve: Curves.easeOutBack),
// // //   );
// // //   late final Animation<double> _logoFade = CurvedAnimation(
// // //     parent: _entrance,
// // //     curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
// // //   );

// // //   // Title: fades + slides up after logo
// // //   late final Animation<double> _titleFade = CurvedAnimation(
// // //     parent: _entrance,
// // //     curve: const Interval(0.4, 0.75, curve: Curves.easeOut),
// // //   );
// // //   late final Animation<Offset> _titleSlide = Tween(
// // //     begin: const Offset(0, 0.25),
// // //     end: Offset.zero,
// // //   ).animate(CurvedAnimation(
// // //     parent: _entrance,
// // //     curve: const Interval(0.4, 0.75, curve: Curves.easeOut),
// // //   ));

// // //   // Subtitle: fades + slides up right after title
// // //   late final Animation<double> _subtitleFade = CurvedAnimation(
// // //     parent: _entrance,
// // //     curve: const Interval(0.55, 0.9, curve: Curves.easeOut),
// // //   );
// // //   late final Animation<Offset> _subtitleSlide = Tween(
// // //     begin: const Offset(0, 0.25),
// // //     end: Offset.zero,
// // //   ).animate(CurvedAnimation(
// // //     parent: _entrance,
// // //     curve: const Interval(0.55, 0.9, curve: Curves.easeOut),
// // //   ));

// // //   // Loader: fades in last
// // //   late final Animation<double> _loaderFade = CurvedAnimation(
// // //     parent: _entrance,
// // //     curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
// // //   );

// // //   // Subtle continuous pulse scale for the logo ring (standard "breathing" effect)
// // //   late final Animation<double> _ringPulse = Tween(begin: 1.0, end: 1.08).animate(
// // //     CurvedAnimation(parent: _pulse, curve: Curves.easeInOut),
// // //   );

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _entrance.forward();
// // //     Future.delayed(const Duration(milliseconds: 9500), () {
// // //       if (mounted) {
// // //         Navigator.pushReplacement(
// // //           context,
// // //           MaterialPageRoute(builder: (_) => const OnboardingScreen()),
// // //         );
// // //       }
// // //     });
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _entrance.dispose();
// // //     _pulse.dispose();
// // //     _dots.dispose();
// // //     super.dispose();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Container(
// // //         width: double.infinity,
// // //         height: double.infinity,
// // //         decoration: const BoxDecoration(
// // //           gradient: LinearGradient(
// // //             begin: Alignment.topCenter,
// // //             end: Alignment.bottomCenter,
// // //             colors: [AppColors.primary, AppColors.primaryDark],
// // //           ),
// // //         ),
// // //         child: SafeArea(
// // //           child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             crossAxisAlignment: CrossAxisAlignment.center,
// // //             children: [
// // //               const Spacer(flex: 3),

// // //               // ── Logo with subtle breathing ring ──
// // //               FadeTransition(
// // //                 opacity: _logoFade,
// // //                 child: ScaleTransition(
// // //                   scale: _logoScale,
// // //                   child: AnimatedBuilder(
// // //                     animation: _ringPulse,
// // //                     builder: (context, child) {
// // //                       return Container(
// // //                         height: 116,
// // //                         width: 116,
// // //                         alignment: Alignment.center,
// // //                         child: Stack(
// // //                           alignment: Alignment.center,
// // //                           children: [
// // //                             // Breathing outer ring
// // //                             Transform.scale(
// // //                               scale: _ringPulse.value,
// // //                               child: Container(
// // //                                 height: 116,
// // //                                 width: 116,
// // //                                 decoration: BoxDecoration(
// // //                                   shape: BoxShape.circle,
// // //                                   border: Border.all(
// // //                                     color: Colors.white.withOpacity(0.35),
// // //                                     width: 1.5,
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                             // Static inner logo circle
// // //                             Container(
// // //                               height: 96,
// // //                               width: 96,
// // //                               padding: const EdgeInsets.all(14),
// // //                               decoration: BoxDecoration(
// // //                                 shape: BoxShape.circle,
// // //                                 color: Colors.white,
// // //                                 boxShadow: [
// // //                                   BoxShadow(
// // //                                     color: Colors.black.withOpacity(0.15),
// // //                                     blurRadius: 20,
// // //                                     offset: const Offset(0, 8),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                               child: ClipOval(
// // //                                 child: Image.asset(
// // //                                   "assets/image/logo.png",
// // //                                   fit: BoxFit.cover,
// // //                                   errorBuilder: (_, __, ___) => const Icon(
// // //                                     Icons.favorite_rounded,
// // //                                     color: AppColors.primary,
// // //                                     size: 40,
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       );
// // //                     },
// // //                   ),
// // //                 ),
// // //               ),

// // //               const SizedBox(height: 28),

// // //               // ── Title ──
// // //               SlideTransition(
// // //                 position: _titleSlide,
// // //                 child: FadeTransition(
// // //                   opacity: _titleFade,
// // //                   child: Text(
// // //                     "VivahBharath",
// // //                     style: GoogleFonts.playfairDisplay(
// // //                       color: Colors.white,
// // //                       fontSize: 36,
// // //                       fontWeight: FontWeight.bold,
// // //                       letterSpacing: 0.2,
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),

// // //               const SizedBox(height: 10),

// // //               // ── Subtitle ──
// // //               SlideTransition(
// // //                 position: _subtitleSlide,
// // //                 child: FadeTransition(
// // //                   opacity: _subtitleFade,
// // //                   child: Text(
// // //                     "FIND YOUR PERFECT LIFE PARTNER",
// // //                     style: GoogleFonts.poppins(
// // //                       color: Colors.white.withOpacity(0.85),
// // //                       letterSpacing: 2,
// // //                       fontSize: 12,
// // //                       fontWeight: FontWeight.w500,
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),

// // //               const Spacer(flex: 4),

// // //               // ── Standard animated loading dots ──
// // //               FadeTransition(
// // //                 opacity: _loaderFade,
// // //                 child: Row(
// // //                   mainAxisAlignment: MainAxisAlignment.center,
// // //                   children: List.generate(3, (i) => _loaderDot(i)),
// // //                 ),
// // //               ),

// // //               const SizedBox(height: 48),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _loaderDot(int index) {
// // //     return AnimatedBuilder(
// // //       animation: _dots,
// // //       builder: (context, child) {
// // //         final t = (_dots.value + index * 0.2) % 1.0;
// // //         // Standard easeInOut bounce between 0.4 and 1.0 opacity/scale
// // //         final wave = (math.sin(t * math.pi)).clamp(0.0, 1.0);
// // //         return Container(
// // //           margin: const EdgeInsets.symmetric(horizontal: 4),
// // //           child: Opacity(
// // //             opacity: 0.4 + 0.6 * wave,
// // //             child: Transform.scale(
// // //               scale: 0.7 + 0.3 * wave,
// // //               child: Container(
// // //                 width: 9,
// // //                 height: 9,
// // //                 decoration: const BoxDecoration(
// // //                   color: Colors.white,
// // //                   shape: BoxShape.circle,
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }
// // // }














// // import 'dart:math' as math;
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// // import 'package:matrimony_app/view/onboarding_screen.dart';

// // class SplashScreen extends StatefulWidget {
// //   const SplashScreen({super.key});

// //   @override
// //   State<SplashScreen> createState() => _SplashScreenState();
// // }

// // class _SplashScreenState extends State<SplashScreen>
// //     with TickerProviderStateMixin {
// //   // ── Entrance: plays once ──
// //   late final AnimationController _entrance = AnimationController(
// //     vsync: this,
// //     duration: const Duration(milliseconds: 1400),
// //   );

// //   // ── Loop: subtle continuous pulse + progress dots ──
// //   late final AnimationController _pulse = AnimationController(
// //     vsync: this,
// //     duration: const Duration(milliseconds: 1800),
// //   )..repeat(reverse: true);

// //   late final AnimationController _dots = AnimationController(
// //     vsync: this,
// //     duration: const Duration(milliseconds: 1200),
// //   )..repeat();

// //   // ── New: slow rotating accent ring around the logo ──
// //   late final AnimationController _rotation = AnimationController(
// //     vsync: this,
// //     duration: const Duration(seconds: 6),
// //   )..repeat();

// //   // ── New: shimmer sweep across the title text ──
// //   late final AnimationController _shimmer = AnimationController(
// //     vsync: this,
// //     duration: const Duration(milliseconds: 2200),
// //   )..repeat();

// //   // ── New: floating background particles (hearts) ──
// //   late final AnimationController _particles = AnimationController(
// //     vsync: this,
// //     duration: const Duration(seconds: 8),
// //   )..repeat();

// //   // ── New: slow background gradient color drift ──
// //   late final AnimationController _bgShift = AnimationController(
// //     vsync: this,
// //     duration: const Duration(seconds: 5),
// //   )..repeat(reverse: true);

// //   final List<_Particle> _particleSeeds =
// //       List.generate(14, (i) => _Particle(seed: i));

// //   // Logo: scale + fade in first
// //   late final Animation<double> _logoScale = CurvedAnimation(
// //     parent: _entrance,
// //     curve: const Interval(0.0, 0.55, curve: Curves.easeOutBack),
// //   );
// //   late final Animation<double> _logoFade = CurvedAnimation(
// //     parent: _entrance,
// //     curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
// //   );

// //   // Title: fades + slides up after logo
// //   late final Animation<double> _titleFade = CurvedAnimation(
// //     parent: _entrance,
// //     curve: const Interval(0.4, 0.75, curve: Curves.easeOut),
// //   );
// //   late final Animation<Offset> _titleSlide = Tween(
// //     begin: const Offset(0, 0.25),
// //     end: Offset.zero,
// //   ).animate(CurvedAnimation(
// //     parent: _entrance,
// //     curve: const Interval(0.4, 0.75, curve: Curves.easeOut),
// //   ));

// //   // Subtitle: fades + slides up right after title
// //   late final Animation<double> _subtitleFade = CurvedAnimation(
// //     parent: _entrance,
// //     curve: const Interval(0.55, 0.9, curve: Curves.easeOut),
// //   );
// //   late final Animation<Offset> _subtitleSlide = Tween(
// //     begin: const Offset(0, 0.25),
// //     end: Offset.zero,
// //   ).animate(CurvedAnimation(
// //     parent: _entrance,
// //     curve: const Interval(0.55, 0.9, curve: Curves.easeOut),
// //   ));

// //   // Loader: fades in last
// //   late final Animation<double> _loaderFade = CurvedAnimation(
// //     parent: _entrance,
// //     curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
// //   );

// //   // Subtle continuous pulse scale for the logo ring (standard "breathing" effect)
// //   late final Animation<double> _ringPulse = Tween(begin: 1.0, end: 1.08).animate(
// //     CurvedAnimation(parent: _pulse, curve: Curves.easeInOut),
// //   );

// //   @override
// //   void initState() {
// //     super.initState();
// //     _entrance.forward();
// //     Future.delayed(const Duration(milliseconds: 9500), () {
// //       if (mounted) {
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(builder: (_) => const OnboardingScreen()),
// //         );
// //       }
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _entrance.dispose();
// //     _pulse.dispose();
// //     _dots.dispose();
// //     _rotation.dispose();
// //     _shimmer.dispose();
// //     _particles.dispose();
// //     _bgShift.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: AnimatedBuilder(
// //         animation: _bgShift,
// //         builder: (context, child) {
// //           // Gently drift the gradient stops for a "living" background
// //           final t = _bgShift.value;
// //           return Container(
// //             width: double.infinity,
// //             height: double.infinity,
// //             decoration: BoxDecoration(
// //               gradient: LinearGradient(
// //                 begin: Alignment(-1.0 + t * 0.4, -1.0),
// //                 end: Alignment(1.0 - t * 0.4, 1.0),
// //                 colors: [AppColors.primary, AppColors.primaryDark],
// //               ),
// //             ),
// //             child: child,
// //           );
// //         },
// //         child: Stack(
// //           children: [
// //             // ── Floating particle hearts drifting upward ──
// //             Positioned.fill(
// //               child: AnimatedBuilder(
// //                 animation: _particles,
// //                 builder: (context, _) {
// //                   return CustomPaint(
// //                     painter: _ParticlePainter(
// //                       progress: _particles.value,
// //                       seeds: _particleSeeds,
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),

// //             SafeArea(
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   const Spacer(flex: 3),

// //                   // ── Logo with breathing ring + slow rotating accent ring ──
// //                   FadeTransition(
// //                     opacity: _logoFade,
// //                     child: ScaleTransition(
// //                       scale: _logoScale,
// //                       child: AnimatedBuilder(
// //                         animation:
// //                             Listenable.merge([_ringPulse, _rotation]),
// //                         builder: (context, child) {
// //                           return Container(
// //                             height: 140,
// //                             width: 140,
// //                             alignment: Alignment.center,
// //                             child: Stack(
// //                               alignment: Alignment.center,
// //                               children: [
// //                                 // Rotating dashed accent ring (outermost)
// //                                 Transform.rotate(
// //                                   angle: _rotation.value * 2 * math.pi,
// //                                   child: CustomPaint(
// //                                     size: const Size(140, 140),
// //                                     painter: _DashedRingPainter(
// //                                       color: Colors.white.withOpacity(0.5),
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 // Breathing outer ring
// //                                 Transform.scale(
// //                                   scale: _ringPulse.value,
// //                                   child: Container(
// //                                     height: 116,
// //                                     width: 116,
// //                                     decoration: BoxDecoration(
// //                                       shape: BoxShape.circle,
// //                                       border: Border.all(
// //                                         color: Colors.white.withOpacity(0.35),
// //                                         width: 1.5,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 // Static inner logo circle
// //                                 Container(
// //                                   height: 96,
// //                                   width: 96,
// //                                   padding: const EdgeInsets.all(14),
// //                                   decoration: BoxDecoration(
// //                                     shape: BoxShape.circle,
// //                                     color: Colors.white,
// //                                     boxShadow: [
// //                                       BoxShadow(
// //                                         color: Colors.black.withOpacity(0.15),
// //                                         blurRadius: 20,
// //                                         offset: const Offset(0, 8),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   child: ClipOval(
// //                                     child: Image.asset(
// //                                       "assets/image/logo.png",
// //                                       fit: BoxFit.cover,
// //                                       errorBuilder: (_, __, ___) => const Icon(
// //                                         Icons.favorite_rounded,
// //                                         color: AppColors.primary,
// //                                         size: 40,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           );
// //                         },
// //                       ),
// //                     ),
// //                   ),

// //                   const SizedBox(height: 28),

// //                   // ── Title with shimmer sweep ──
// //                   SlideTransition(
// //                     position: _titleSlide,
// //                     child: FadeTransition(
// //                       opacity: _titleFade,
// //                       child: AnimatedBuilder(
// //                         animation: _shimmer,
// //                         builder: (context, child) {
// //                           return ShaderMask(
// //                             blendMode: BlendMode.srcIn,
// //                             shaderCallback: (bounds) {
// //                               final dx = _shimmer.value * 2 - 1;
// //                               return LinearGradient(
// //                                 begin: Alignment(-1.5 + dx * 2, 0),
// //                                 end: Alignment(1.5 + dx * 2, 0),
// //                                 colors: const [
// //                                   Colors.white,
// //                                   Color(0xFFFFF3D6),
// //                                   Colors.white,
// //                                 ],
// //                                 stops: const [0.35, 0.5, 0.65],
// //                               ).createShader(bounds);
// //                             },
// //                             child: Text(
// //                               "VivahBharath",
// //                               style: GoogleFonts.playfairDisplay(
// //                                 color: Colors.white,
// //                                 fontSize: 36,
// //                                 fontWeight: FontWeight.bold,
// //                                 letterSpacing: 0.2,
// //                               ),
// //                             ),
// //                           );
// //                         },
// //                       ),
// //                     ),
// //                   ),

// //                   const SizedBox(height: 10),

// //                   // ── Subtitle ──
// //                   SlideTransition(
// //                     position: _subtitleSlide,
// //                     child: FadeTransition(
// //                       opacity: _subtitleFade,
// //                       child: Text(
// //                         "FIND YOUR PERFECT LIFE PARTNER",
// //                         style: GoogleFonts.poppins(
// //                           color: Colors.white.withOpacity(0.85),
// //                           letterSpacing: 2,
// //                           fontSize: 12,
// //                           fontWeight: FontWeight.w500,
// //                         ),
// //                       ),
// //                     ),
// //                   ),

// //                   const Spacer(flex: 4),

// //                   // ── Standard animated loading dots ──
// //                   FadeTransition(
// //                     opacity: _loaderFade,
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: List.generate(3, (i) => _loaderDot(i)),
// //                     ),
// //                   ),

// //                   const SizedBox(height: 48),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _loaderDot(int index) {
// //     return AnimatedBuilder(
// //       animation: _dots,
// //       builder: (context, child) {
// //         final t = (_dots.value + index * 0.2) % 1.0;
// //         // Standard easeInOut bounce between 0.4 and 1.0 opacity/scale
// //         final wave = (math.sin(t * math.pi)).clamp(0.0, 1.0);
// //         return Container(
// //           margin: const EdgeInsets.symmetric(horizontal: 4),
// //           child: Opacity(
// //             opacity: 0.4 + 0.6 * wave,
// //             child: Transform.scale(
// //               scale: 0.7 + 0.3 * wave,
// //               child: Container(
// //                 width: 9,
// //                 height: 9,
// //                 decoration: const BoxDecoration(
// //                   color: Colors.white,
// //                   shape: BoxShape.circle,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // /// A single drifting particle's random-but-fixed characteristics.
// // class _Particle {
// //   final double startX; // 0..1 fraction of width
// //   final double size;
// //   final double speed; // relative speed multiplier
// //   final double phase; // offset into the loop so they don't move in sync
// //   final double drift; // horizontal sway amount

// //   _Particle({required int seed})
// //       : startX = _rand(seed, 0),
// //         size = 6 + _rand(seed, 1) * 10,
// //         speed = 0.6 + _rand(seed, 2) * 0.8,
// //         phase = _rand(seed, 3),
// //         drift = (_rand(seed, 4) - 0.5) * 40;

// //   static double _rand(int seed, int salt) {
// //     final x = math.sin((seed + 1) * 12.9898 + salt * 78.233) * 43758.5453;
// //     return x - x.floorToDouble();
// //   }
// // }

// // /// Paints small translucent heart particles floating upward and fading,
// // /// looping seamlessly.
// // class _ParticlePainter extends CustomPainter {
// //   final double progress; // 0..1
// //   final List<_Particle> seeds;

// //   _ParticlePainter({required this.progress, required this.seeds});

// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     for (final p in seeds) {
// //       // Each particle loops independently using its own phase + speed.
// //       final t = (progress * p.speed + p.phase) % 1.0;

// //       final dy = size.height * (1 - t); // travels from bottom to top
// //       final sway = math.sin(t * 2 * math.pi) * p.drift;
// //       final dx = p.startX * size.width + sway;

// //       // Fade in near the bottom, fade out near the top.
// //       final opacity = (math.sin(t * math.pi)).clamp(0.0, 1.0) * 0.35;

// //       final paint = Paint()
// //         ..color = Colors.white.withOpacity(opacity)
// //         ..style = PaintingStyle.fill;

// //       _drawHeart(canvas, Offset(dx, dy), p.size, paint);
// //     }
// //   }

// //   void _drawHeart(Canvas canvas, Offset center, double size, Paint paint) {
// //     final path = Path();
// //     final s = size;
// //     path.moveTo(center.dx, center.dy + s * 0.3);
// //     path.cubicTo(
// //       center.dx - s, center.dy - s * 0.6,
// //       center.dx - s * 0.5, center.dy - s,
// //       center.dx, center.dy - s * 0.2,
// //     );
// //     path.cubicTo(
// //       center.dx + s * 0.5, center.dy - s,
// //       center.dx + s, center.dy - s * 0.6,
// //       center.dx, center.dy + s * 0.3,
// //     );
// //     path.close();
// //     canvas.drawPath(path, paint);
// //   }

// //   @override
// //   bool shouldRepaint(covariant _ParticlePainter oldDelegate) =>
// //       oldDelegate.progress != progress;
// // }

// // /// Paints a slowly rotating dashed ring behind the logo for extra motion.
// // class _DashedRingPainter extends CustomPainter {
// //   final Color color;
// //   _DashedRingPainter({required this.color});

// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     final center = Offset(size.width / 2, size.height / 2);
// //     final radius = size.width / 2 - 2;
// //     final paint = Paint()
// //       ..color = color
// //       ..style = PaintingStyle.stroke
// //       ..strokeWidth = 1.4
// //       ..strokeCap = StrokeCap.round;

// //     const dashCount = 18;
// //     const dashFraction = 0.55; // portion of each segment that is drawn
// //     final anglePerDash = (2 * math.pi) / dashCount;

// //     for (int i = 0; i < dashCount; i++) {
// //       final startAngle = i * anglePerDash;
// //       final sweep = anglePerDash * dashFraction;
// //       canvas.drawArc(
// //         Rect.fromCircle(center: center, radius: radius),
// //         startAngle,
// //         sweep,
// //         false,
// //         paint,
// //       );
// //     }
// //   }

// //   @override
// //   bool shouldRepaint(covariant _DashedRingPainter oldDelegate) =>
// //       oldDelegate.color != color;
// // }











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

//   // ── Replaces rotation: expanding ripple rings around the logo ──
//   late final AnimationController _ripple = AnimationController(
//     vsync: this,
//     duration: const Duration(milliseconds: 2600),
//   )..repeat();

//   // ── Shimmer sweep across the title text ──
//   late final AnimationController _shimmer = AnimationController(
//     vsync: this,
//     duration: const Duration(milliseconds: 2200),
//   )..repeat();

//   // ── Floating background particles (hearts) ──
//   late final AnimationController _particles = AnimationController(
//     vsync: this,
//     duration: const Duration(seconds: 8),
//   )..repeat();

//   // ── Slow background gradient color drift ──
//   late final AnimationController _bgShift = AnimationController(
//     vsync: this,
//     duration: const Duration(seconds: 5),
//   )..repeat(reverse: true);

//   final List<_Particle> _particleSeeds =
//       List.generate(14, (i) => _Particle(seed: i));

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
//     _ripple.dispose();
//     _shimmer.dispose();
//     _particles.dispose();
//     _bgShift.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedBuilder(
//         animation: _bgShift,
//         builder: (context, child) {
//           // Gently drift the gradient stops for a "living" background
//           final t = _bgShift.value;
//           return Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment(-1.0 + t * 0.4, -1.0),
//                 end: Alignment(1.0 - t * 0.4, 1.0),
//                 colors: [AppColors.primary, AppColors.primaryDark],
//               ),
//             ),
//             child: child,
//           );
//         },
//         child: Stack(
//           children: [
//             // ── Floating particle hearts drifting upward ──
//             Positioned.fill(
//               child: AnimatedBuilder(
//                 animation: _particles,
//                 builder: (context, _) {
//                   return CustomPaint(
//                     painter: _ParticlePainter(
//                       progress: _particles.value,
//                       seeds: _particleSeeds,
//                     ),
//                   );
//                 },
//               ),
//             ),

//             SafeArea(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const Spacer(flex: 3),

//                   // ── Logo with breathing ring + expanding ripple pulses ──
//                   FadeTransition(
//                     opacity: _logoFade,
//                     child: ScaleTransition(
//                       scale: _logoScale,
//                       child: AnimatedBuilder(
//                         animation:
//                             Listenable.merge([_ringPulse, _ripple]),
//                         builder: (context, child) {
//                           return Container(
//                             height: 160,
//                             width: 160,
//                             alignment: Alignment.center,
//                             child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 // Expanding ripple rings (radar-ping style, no rotation)
//                                 CustomPaint(
//                                   size: const Size(160, 160),
//                                   painter: _RipplePainter(
//                                     progress: _ripple.value,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 // Breathing outer ring
//                                 Transform.scale(
//                                   scale: _ringPulse.value,
//                                   child: Container(
//                                     height: 116,
//                                     width: 116,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: Colors.white.withOpacity(0.35),
//                                         width: 1.5,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 // Static inner logo circle
//                                 Container(
//                                   height: 96,
//                                   width: 96,
//                                   padding: const EdgeInsets.all(14),
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.white,
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black.withOpacity(0.15),
//                                         blurRadius: 20,
//                                         offset: const Offset(0, 8),
//                                       ),
//                                     ],
//                                   ),
//                                   child: ClipOval(
//                                     child: Image.asset(
//                                       "assets/image/logo.png",
//                                       fit: BoxFit.cover,
//                                       errorBuilder: (_, __, ___) => const Icon(
//                                         Icons.favorite_rounded,
//                                         color: AppColors.primary,
//                                         size: 40,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 28),

//                   // ── Title with shimmer sweep ──
//                   SlideTransition(
//                     position: _titleSlide,
//                     child: FadeTransition(
//                       opacity: _titleFade,
//                       child: AnimatedBuilder(
//                         animation: _shimmer,
//                         builder: (context, child) {
//                           return ShaderMask(
//                             blendMode: BlendMode.srcIn,
//                             shaderCallback: (bounds) {
//                               final dx = _shimmer.value * 2 - 1;
//                               return LinearGradient(
//                                 begin: Alignment(-1.5 + dx * 2, 0),
//                                 end: Alignment(1.5 + dx * 2, 0),
//                                 colors: const [
//                                   Colors.white,
//                                   Color(0xFFFFF3D6),
//                                   Colors.white,
//                                 ],
//                                 stops: const [0.35, 0.5, 0.65],
//                               ).createShader(bounds);
//                             },
//                             child: Text(
//                               "VivahBharath",
//                               style: GoogleFonts.playfairDisplay(
//                                 color: Colors.white,
//                                 fontSize: 36,
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 0.2,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 10),

//                   // ── Subtitle ──
//                   SlideTransition(
//                     position: _subtitleSlide,
//                     child: FadeTransition(
//                       opacity: _subtitleFade,
//                       child: Text(
//                         "FIND YOUR PERFECT LIFE PARTNER",
//                         style: GoogleFonts.poppins(
//                           color: Colors.white.withOpacity(0.85),
//                           letterSpacing: 2,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),

//                   const Spacer(flex: 4),

//                   // ── Standard animated loading dots ──
//                   FadeTransition(
//                     opacity: _loaderFade,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: List.generate(3, (i) => _loaderDot(i)),
//                     ),
//                   ),

//                   const SizedBox(height: 48),
//                 ],
//               ),
//             ),
//           ],
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

// /// A single drifting particle's random-but-fixed characteristics.
// class _Particle {
//   final double startX; // 0..1 fraction of width
//   final double size;
//   final double speed; // relative speed multiplier
//   final double phase; // offset into the loop so they don't move in sync
//   final double drift; // horizontal sway amount

//   _Particle({required int seed})
//       : startX = _rand(seed, 0),
//         size = 6 + _rand(seed, 1) * 10,
//         speed = 0.6 + _rand(seed, 2) * 0.8,
//         phase = _rand(seed, 3),
//         drift = (_rand(seed, 4) - 0.5) * 40;

//   static double _rand(int seed, int salt) {
//     final x = math.sin((seed + 1) * 12.9898 + salt * 78.233) * 43758.5453;
//     return x - x.floorToDouble();
//   }
// }

// /// Paints small translucent heart particles floating upward and fading,
// /// looping seamlessly.
// class _ParticlePainter extends CustomPainter {
//   final double progress; // 0..1
//   final List<_Particle> seeds;

//   _ParticlePainter({required this.progress, required this.seeds});

//   @override
//   void paint(Canvas canvas, Size size) {
//     for (final p in seeds) {
//       // Each particle loops independently using its own phase + speed.
//       final t = (progress * p.speed + p.phase) % 1.0;

//       final dy = size.height * (1 - t); // travels from bottom to top
//       final sway = math.sin(t * 2 * math.pi) * p.drift;
//       final dx = p.startX * size.width + sway;

//       // Fade in near the bottom, fade out near the top.
//       final opacity = (math.sin(t * math.pi)).clamp(0.0, 1.0) * 0.35;

//       final paint = Paint()
//         ..color = Colors.white.withOpacity(opacity)
//         ..style = PaintingStyle.fill;

//       _drawHeart(canvas, Offset(dx, dy), p.size, paint);
//     }
//   }

//   void _drawHeart(Canvas canvas, Offset center, double size, Paint paint) {
//     final path = Path();
//     final s = size;
//     path.moveTo(center.dx, center.dy + s * 0.3);
//     path.cubicTo(
//       center.dx - s, center.dy - s * 0.6,
//       center.dx - s * 0.5, center.dy - s,
//       center.dx, center.dy - s * 0.2,
//     );
//     path.cubicTo(
//       center.dx + s * 0.5, center.dy - s,
//       center.dx + s, center.dy - s * 0.6,
//       center.dx, center.dy + s * 0.3,
//     );
//     path.close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant _ParticlePainter oldDelegate) =>
//       oldDelegate.progress != progress;
// }

// /// Paints 3 staggered expanding+fading rings around the logo — a soft
// /// "radar ping" / breathing halo effect with no rotation involved.
// class _RipplePainter extends CustomPainter {
//   final double progress; // 0..1, looping
//   final Color color;

//   _RipplePainter({required this.progress, required this.color});

//   static const int _ringCount = 3;
//   static const double _minRadiusFraction = 0.34; // starts near the inner logo
//   static const double _maxRadiusFraction = 0.5; // expands to container edge

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final base = size.width;

//     for (int i = 0; i < _ringCount; i++) {
//       // Stagger each ring's phase evenly across the loop.
//       final t = (progress + i / _ringCount) % 1.0;

//       final radius =
//           base * (_minRadiusFraction + (_maxRadiusFraction - _minRadiusFraction) * t);

//       // Fade in quickly, then fade out as it expands.
//       final opacity = (1 - t) * 0.55;

//       final paint = Paint()
//         ..color = color.withOpacity(opacity.clamp(0.0, 1.0))
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 1.6;

//       canvas.drawCircle(center, radius, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant _RipplePainter oldDelegate) =>
//       oldDelegate.progress != progress || oldDelegate.color != color;
// }















import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/onboarding_screen.dart';

/// ── VivahBharath brand palette ──
class _SplashColors {
  static const Color burgundy = Color(0xFF8B1E3F);
  static const Color rosePink = Color(0xFFE85D75);
  static const Color gold = Color(0xFFD4AF37);
  static const Color ivory = Color(0xFFFFF8F3);
  static const Color blush = Color(0xFFFFECEF);
}

/// A distinctive splash screen built around a mandap-style pointed arch
/// (a classic Indian wedding motif) instead of a generic circular logo
/// badge. The arch draws itself in like an ink stroke, small gold corner
/// flourishes fade in, the heart+rings mark appears inside the arch with a
/// soft glow (no hard circle), and a few petals drift slowly in the
/// background for quiet motion.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen>
    with TickerProviderStateMixin {
  // ── One-shot entrance: arch draw-in, corner flourishes, mark, text ──
  late final AnimationController _entrance = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2200),
  );

  // ── Continuous loop: petals drifting down ──
  late final AnimationController _petals = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 9),
  )..repeat();

  final List<_Petal> _petalSeeds = List.generate(7, (i) => _Petal(seed: i));

  // Arch outline: draws in like an ink stroke
  late final Animation<double> _archDraw = CurvedAnimation(
    parent: _entrance,
    curve: const Interval(0.0, 0.45, curve: Curves.easeInOut),
  );

  // Corner flourishes: fade + gentle scale
  late final Animation<double> _cornerFade = CurvedAnimation(
    parent: _entrance,
    curve: const Interval(0.3, 0.6, curve: Curves.easeOut),
  );

  // Heart+rings mark inside the arch: fade + soft scale, appears after the
  // arch has mostly drawn itself
  late final Animation<double> _markFade = CurvedAnimation(
    parent: _entrance,
    curve: const Interval(0.42, 0.72, curve: Curves.easeOut),
  );
  late final Animation<double> _markScale = Tween(begin: 0.85, end: 1.0).animate(
    CurvedAnimation(
      parent: _entrance,
      curve: const Interval(0.42, 0.72, curve: Curves.easeOutCubic),
    ),
  );

  // App name: fade + rise
  late final Animation<double> _nameFade = CurvedAnimation(
    parent: _entrance,
    curve: const Interval(0.6, 0.92, curve: Curves.easeOut),
  );
  late final Animation<Offset> _nameRise = Tween(
    begin: const Offset(0, 0.2),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _entrance,
    curve: const Interval(0.6, 0.92, curve: Curves.easeOut),
  ));

  // Tagline: fades in last
  late final Animation<double> _taglineFade = CurvedAnimation(
    parent: _entrance,
    curve: const Interval(0.78, 1.0, curve: Curves.easeOut),
  );

  bool _exiting = false;

  @override
  void initState() {
    super.initState();
    _entrance.forward();

    Future.delayed(const Duration(milliseconds: 2900), () {
      if (mounted) setState(() => _exiting = true);
    });
    Future.delayed(const Duration(milliseconds: 3300), () {
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
    _petals.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _SplashColors.ivory,
      body: AnimatedOpacity(
        opacity: _exiting ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 400),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_SplashColors.ivory, _SplashColors.blush],
            ),
          ),
          child: Stack(
            children: [
              // ── Slowly drifting petals ──
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: _petals,
                  builder: (context, _) {
                    return CustomPaint(
                      painter: _PetalPainter(
                        progress: _petals.value,
                        seeds: _petalSeeds,
                      ),
                    );
                  },
                ),
              ),

              // ── Corner flourishes ──
              FadeTransition(
                opacity: _cornerFade,
                child: const Stack(
                  children: [
                    Positioned(top: 28, left: 24, child: _CornerFlourish(rotation: 0)),
                    Positioned(
                      top: 28,
                      right: 24,
                      child: _CornerFlourish(rotation: math.pi / 2),
                    ),
                    Positioned(
                      bottom: 28,
                      left: 24,
                      child: _CornerFlourish(rotation: -math.pi / 2),
                    ),
                    Positioned(
                      bottom: 28,
                      right: 24,
                      child: _CornerFlourish(rotation: math.pi),
                    ),
                  ],
                ),
              ),

              // ── Center content ──
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(flex: 4),

                    // ── Mandap-style arch frame with the mark inside ──
                    SizedBox(
                      height: 200,
                      width: 190,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Arch outline, drawing itself in
                          AnimatedBuilder(
                            animation: _archDraw,
                            builder: (context, _) {
                              return CustomPaint(
                                size: const Size(190, 200),
                                painter: _ArchPainter(
                                  progress: _archDraw.value,
                                  color: _SplashColors.gold,
                                ),
                              );
                            },
                          ),

                          // Soft glow behind the mark (no hard circle)
                          FadeTransition(
                            opacity: _markFade,
                            child: Container(
                              height: 92,
                              width: 92,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.9),
                                    Colors.white.withOpacity(0.0),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Heart+rings placeholder mark
                          FadeTransition(
                            opacity: _markFade,
                            child: ScaleTransition(
                              scale: _markScale,
                              child: SizedBox(
                                height: 74,
                                width: 74,
                                // Replace this CustomPaint with
                                // Image.asset("assets/image/logo.png")
                                // once the real logo is ready.
                                child: CustomPaint(
                                  painter: _HeartRingsPainter(
                                    burgundy: _SplashColors.burgundy,
                                    gold: _SplashColors.gold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // ── App name ──
                    SlideTransition(
                      position: _nameRise,
                      child: FadeTransition(
                        opacity: _nameFade,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Vivah",
                                style: GoogleFonts.playfairDisplay(
                                  color: _SplashColors.burgundy,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              TextSpan(
                                text: "Bharath",
                                style: GoogleFonts.poppins(
                                  color: _SplashColors.burgundy,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // ── Tagline ──
                    FadeTransition(
                      opacity: _taglineFade,
                      child: Text(
                        "FIND YOUR PERFECT LIFE PARTNER",
                        style: GoogleFonts.poppins(
                          color: _SplashColors.burgundy.withOpacity(0.6),
                          letterSpacing: 2,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const Spacer(flex: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A small quarter-mandala style flourish for the four screen corners —
/// two nested arcs and a dot, simple enough to read as ornamental rather
/// than busy.
class _CornerFlourish extends StatelessWidget {
  final double rotation;
  const _CornerFlourish({required this.rotation});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation,
      child: CustomPaint(
        size: const Size(46, 46),
        painter: _FlourishPainter(color: _SplashColors.gold.withOpacity(0.55)),
      ),
    );
  }
}

class _FlourishPainter extends CustomPainter {
  final Color color;
  _FlourishPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;

    final rect1 = Rect.fromCircle(center: Offset.zero, radius: size.width * 0.9);
    final rect2 = Rect.fromCircle(center: Offset.zero, radius: size.width * 0.6);

    canvas.drawArc(rect1, math.pi, math.pi / 2, false, paint);
    canvas.drawArc(rect2, math.pi, math.pi / 2, false, paint);

    canvas.drawCircle(
      Offset(-size.width * 0.6, 0),
      2.2,
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(covariant _FlourishPainter oldDelegate) => false;
}

/// Paints a mandap-style pointed arch outline (two curved sides meeting in
/// a soft point at the top), animated to draw itself in over `progress`.
class _ArchPainter extends CustomPainter {
  final double progress; // 0..1, one-shot
  final Color color;

  _ArchPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;

    // Start bottom-left, curve up to a soft point at top-center, curve
    // back down to bottom-right.
    path.moveTo(w * 0.06, h * 0.98);
    path.cubicTo(
      w * 0.02, h * 0.45,
      w * 0.18, h * 0.05,
      w * 0.5, h * 0.02,
    );
    path.cubicTo(
      w * 0.82, h * 0.05,
      w * 0.98, h * 0.45,
      w * 0.94, h * 0.98,
    );

    final metrics = path.computeMetrics().toList();
    final drawPath = Path();
    for (final metric in metrics) {
      drawPath.addPath(
        metric.extractPath(0, metric.length * progress),
        Offset.zero,
      );
    }

    final paint = Paint()
      ..color = color.withOpacity(0.85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(drawPath, paint);

    // A thin inner echo line for a little extra elegance once mostly drawn.
    if (progress > 0.5) {
      final innerOpacity = ((progress - 0.5) / 0.5).clamp(0.0, 1.0) * 0.35;
      final innerPaint = Paint()
        ..color = color.withOpacity(innerOpacity)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0;
      final innerPath = Path();
      innerPath.moveTo(w * 0.14, h * 0.95);
      innerPath.cubicTo(
        w * 0.1, h * 0.5,
        w * 0.24, h * 0.14,
        w * 0.5, h * 0.11,
      );
      innerPath.cubicTo(
        w * 0.76, h * 0.14,
        w * 0.9, h * 0.5,
        w * 0.86, h * 0.95,
      );
      canvas.drawPath(innerPath, innerPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _ArchPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

/// Placeholder brand mark: a small burgundy heart at the intersection of
/// two interlocking gold wedding-band rings. Swap for the real logo asset
/// later — replace the CustomPaint above with an Image.asset.
class _HeartRingsPainter extends CustomPainter {
  final Color burgundy;
  final Color gold;

  _HeartRingsPainter({required this.burgundy, required this.gold});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final ringRadius = size.width * 0.26;
    final ringPaint = Paint()
      ..color = gold
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.05;

    canvas.drawCircle(
      center.translate(-ringRadius * 0.55, ringRadius * 0.1),
      ringRadius,
      ringPaint,
    );
    canvas.drawCircle(
      center.translate(ringRadius * 0.55, ringRadius * 0.1),
      ringRadius,
      ringPaint,
    );

    final heartPaint = Paint()
      ..color = burgundy
      ..style = PaintingStyle.fill;
    final s = size.width * 0.24;
    final heartCenter = center.translate(0, -ringRadius * 0.55);

    final path = Path();
    path.moveTo(heartCenter.dx, heartCenter.dy + s * 0.32);
    path.cubicTo(
      heartCenter.dx - s, heartCenter.dy - s * 0.55,
      heartCenter.dx - s * 0.5, heartCenter.dy - s,
      heartCenter.dx, heartCenter.dy - s * 0.22,
    );
    path.cubicTo(
      heartCenter.dx + s * 0.5, heartCenter.dy - s,
      heartCenter.dx + s, heartCenter.dy - s * 0.55,
      heartCenter.dx, heartCenter.dy + s * 0.32,
    );
    path.close();
    canvas.drawPath(path, heartPaint);
  }

  @override
  bool shouldRepaint(covariant _HeartRingsPainter oldDelegate) => false;
}

/// A single drifting petal's random-but-fixed characteristics.
class _Petal {
  final double startX;
  final double size;
  final double speed;
  final double phase;
  final double sway;
  final double rotationSpeed;

  _Petal({required int seed})
      : startX = _rand(seed, 0),
        size = 8 + _rand(seed, 1) * 6,
        speed = 0.5 + _rand(seed, 2) * 0.5,
        phase = _rand(seed, 3),
        sway = 20 + _rand(seed, 4) * 30,
        rotationSpeed = 0.6 + _rand(seed, 5) * 0.8;

  static double _rand(int seed, int salt) {
    final x = math.sin((seed + 1) * 12.9898 + salt * 78.233) * 43758.5453;
    return x - x.floorToDouble();
  }
}

/// Paints a handful of small petal shapes drifting slowly downward with a
/// gentle sway and rotation — quiet background motion, not confetti.
class _PetalPainter extends CustomPainter {
  final double progress; // 0..1, loops
  final List<_Petal> seeds;

  _PetalPainter({required this.progress, required this.seeds});

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in seeds) {
      final t = (progress * p.speed + p.phase) % 1.0;

      final dy = size.height * t - size.height * 0.1;
      final swayX = math.sin(t * 2 * math.pi) * p.sway;
      final dx = p.startX * size.width + swayX;

      final opacity = (math.sin(t * math.pi)).clamp(0.0, 1.0) * 0.4;
      final angle = t * 2 * math.pi * p.rotationSpeed;

      canvas.save();
      canvas.translate(dx, dy);
      canvas.rotate(angle);

      final paint = Paint()
        ..color = _SplashColors.rosePink.withOpacity(opacity)
        ..style = PaintingStyle.fill;

      final petalPath = Path();
      petalPath.moveTo(0, -p.size / 2);
      petalPath.quadraticBezierTo(p.size / 2, 0, 0, p.size / 2);
      petalPath.quadraticBezierTo(-p.size / 2, 0, 0, -p.size / 2);
      petalPath.close();

      canvas.drawPath(petalPath, paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _PetalPainter oldDelegate) =>
      oldDelegate.progress != progress;
}