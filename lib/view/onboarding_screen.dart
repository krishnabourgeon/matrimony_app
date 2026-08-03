// // import 'package:flutter/material.dart';
// // import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// // import 'package:matrimony_app/view/initial_info_screen.dart';

// // class OnboardingPage {
// //   final String imagePath;
// //   final String tag;
// //   final String title;
// //   final String subtitle;
// //   final Color accentColor;
// //   final Color bgTop;
// //   final Color bgBottom;

// //   const OnboardingPage({
// //     required this.imagePath,
// //     required this.tag,
// //     required this.title,
// //     required this.subtitle,
// //     required this.accentColor,
// //     required this.bgTop,
// //     required this.bgBottom,
// //   });
// // }

// // final List<OnboardingPage> onboardingPages = [
// //   const OnboardingPage(
// //     imagePath: 'assets/image/undraw_missed-chances_5vme.png',
// //     tag: 'STEP 1',
// //     title: 'Register for Free',
// //     subtitle:
// //         'Create your profile in just a few minutes and start discovering compatible matches.',
// //     accentColor: AppColors.primary,
// //     bgTop: Color(0xFFFFF5F2),
// //     bgBottom: Color(0xFFFFEDE8),
// //   ),
// //   const OnboardingPage(
// //     imagePath: 'assets/image/Chat-amico.png',
// //     tag: 'STEP 2',
// //     title: 'Discover Matches',
// //     subtitle:
// //         'Easily filter profiles by age, community, education, profession and location to find exactly what you are looking for.',
// //     accentColor: AppColors.primary,
// //     bgTop: Color(0xFFFFF5F2),
// //     bgBottom: Color(0xFFFFEDE8),
// //   ),
// //   const OnboardingPage(
// //     imagePath: 'assets/image/undraw_couple-photo_vr7f.png',
// //     tag: 'STEP 3',
// //     title: 'Upgrade Membership',
// //     subtitle:
// //         'Upgrade your subscription plan to unlock premium communication features and boost your profile visibility.',
// //     accentColor: AppColors.primary,
// //     bgTop: Color(0xFFFFF0EC),
// //     bgBottom: Color(0xFFFFE4DC),
// //   ),
// //   const OnboardingPage(
// //     imagePath: 'assets/image/chat_bot.png',
// //     tag: 'STEP 4',
// //     title: 'Connect & Converse',
// //     subtitle:
// //         'Express interest, initiate secure conversations and take the next meaningful step towards your future.',
// //     accentColor: AppColors.primary,
// //     bgTop: Color(0xFFFFF0EC),
// //     bgBottom: Color(0xFFFFE4DC),
// //   ),
// // ];

// // // ─── Onboarding Screen ────────────────────────────────────────────────────────

// // class OnboardingScreen extends StatefulWidget {
// //   const OnboardingScreen({super.key});

// //   @override
// //   State<OnboardingScreen> createState() => _OnboardingScreenState();
// // }

// // class _OnboardingScreenState extends State<OnboardingScreen>
// //     with TickerProviderStateMixin {
// //   final PageController _pageController = PageController();
// //   int _currentPage = 0;

// //   late AnimationController _fadeController;
// //   late AnimationController _slideController;
// //   late Animation<double> _fadeAnimation;
// //   late Animation<Offset> _slideAnimation;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _fadeController = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 600),
// //     );
// //     _slideController = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 500),
// //     );
// //     _fadeAnimation =
// //         CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);
// //     _slideAnimation = Tween<Offset>(
// //       begin: const Offset(0, 0.15),
// //       end: Offset.zero,
// //     ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

// //     _playAnimations();
// //   }

// //   void _playAnimations() {
// //     _fadeController.forward(from: 0);
// //     _slideController.forward(from: 0);
// //   }

// //   @override
// //   void dispose() {
// //     _pageController.dispose();
// //     _fadeController.dispose();
// //     _slideController.dispose();
// //     super.dispose();
// //   }

// //   void _onPageChanged(int index) {
// //     setState(() => _currentPage = index);
// //     _playAnimations();
// //   }

// //   void _nextPage() {
// //     if (_currentPage < onboardingPages.length - 1) {
// //       _pageController.nextPage(
// //         duration: const Duration(milliseconds: 500),
// //         curve: Curves.easeInOut,
// //       );
// //     } else {
// //       _navigateToHome();
// //     }
// //   }

// //   void _navigateToHome() {
// //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const InitialInfoScreen()));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final page = onboardingPages[_currentPage];
// //     final isDark = false;

// //     return Scaffold(
// //       body: AnimatedContainer(
// //         duration: const Duration(milliseconds: 600),
// //         curve: Curves.easeInOut,
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             colors: [page.bgTop, page.bgBottom],
// //             begin: Alignment.topCenter,
// //             end: Alignment.bottomCenter,
// //           ),
// //         ),
// //         child: SafeArea(
// //           child: Column(
// //             children: [
// //               // ── Top Bar ──────────────────────────────────────────────
// //               _TopBar(isDark: isDark, onSkip: _navigateToHome),

// //               // ── Page View ────────────────────────────────────────────
// //               Expanded(
// //                 child: PageView.builder(
// //                   controller: _pageController,
// //                   onPageChanged: _onPageChanged,
// //                   itemCount: onboardingPages.length,
// //                   itemBuilder: (context, index) {
// //                     return _OnboardingPageView(
// //                       page: onboardingPages[index],
// //                       fadeAnimation: _fadeAnimation,
// //                       slideAnimation: _slideAnimation,
// //                       isActive: index == _currentPage,
// //                     );
// //                   },
// //                 ),
// //               ),

// //               // ── Bottom Controls ───────────────────────────────────────
// //               _BottomControls(
// //                 currentPage: _currentPage,
// //                 totalPages: onboardingPages.length,
// //                 isDark: isDark,
// //                 accentColor: page.accentColor,
// //                 onNext: _nextPage,
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // ─── Top Bar ──────────────────────────────────────────────────────────────────

// // class _TopBar extends StatelessWidget {
// //   final bool isDark;
// //   final VoidCallback onSkip;

// //   const _TopBar({required this.isDark, required this.onSkip});

// //   @override
// //   Widget build(BuildContext context) {
// //     final textColor = isDark ? Colors.white70 : const Color(0xFF5A3E36);

// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           // Logo / Brand
// //           Row(
// //             children: [
// //               Icon(Icons.favorite_rounded,
// //                   color: isDark ? AppColors.primary :  AppColors.primary,
// //                   size: 22),
// //               const SizedBox(width: 8),
// //               Text(
// //                 'VivahBharath',
// //                 style: TextStyle(
// //                   fontFamily: 'Georgia',
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.bold,
// //                   color:  const Color(0xFF2D1810),
// //                   letterSpacing: 0.5,
// //                 ),
// //               ),
// //             ],
// //           ),
// //           // Skip button
// //           TextButton(
// //             onPressed: onSkip,
// //             style: TextButton.styleFrom(
// //               foregroundColor: textColor,
// //               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// //             ),
// //             child: Text(
// //               'Skip',
// //               style: TextStyle(
// //                 fontSize: 14,
// //                 fontWeight: FontWeight.w500,
// //                 letterSpacing: 0.8,
// //                 color: textColor,
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ─── Single Page View ─────────────────────────────────────────────────────────

// // class _OnboardingPageView extends StatelessWidget {
// //   final OnboardingPage page;
// //   final Animation<double> fadeAnimation;
// //   final Animation<Offset> slideAnimation;
// //   final bool isActive;

// //   const _OnboardingPageView({
// //     required this.page,
// //     required this.fadeAnimation,
// //     required this.slideAnimation,
// //     required this.isActive,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final isDark = page.bgTop == const Color(0xFF1A202C);
// //     final titleColor = isDark ? Colors.white : const Color(0xFF2D1810);
// //     final subtitleColor =
// //         isDark ? Colors.white60 : const Color(0xFF7A5C54);
// //     final tagColor = page.accentColor;

// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 28),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           // ── Illustration ──────────────────────────────────────────
// //           Expanded(
// //             flex: 5,
// //             child: FadeTransition(
// //               opacity: fadeAnimation,
// //               child: Container(
// //                 margin: const EdgeInsets.only(top: 8, bottom: 16),
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(32),
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: page.accentColor.withOpacity(0.15),
// //                       blurRadius: 40,
// //                       offset: const Offset(0, 16),
// //                       spreadRadius: 4,
// //                     ),
// //                   ],
// //                 ),
// //                 child: ClipRRect(
// //                   borderRadius: BorderRadius.circular(32),
// //                   child: Image.asset(
// //                     page.imagePath,
// //                     fit: BoxFit.contain,
// //                     // Fallback placeholder while assets aren't set up
// //                     errorBuilder: (context, error, stackTrace) =>
// //                         _IllustrationPlaceholder(page: page),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),

// //           // ── Text Content ──────────────────────────────────────────
// //           Expanded(
// //             flex: 3,
// //             child: SlideTransition(
// //               position: slideAnimation,
// //               child: FadeTransition(
// //                 opacity: fadeAnimation,
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     // Tag
// //                     Container(
// //                       padding: const EdgeInsets.symmetric(
// //                           horizontal: 14, vertical: 5),
// //                       decoration: BoxDecoration(
// //                         color: tagColor.withOpacity(isDark ? 0.2 : 0.12),
// //                         borderRadius: BorderRadius.circular(20),
// //                         border: Border.all(
// //                           color: tagColor.withOpacity(0.3),
// //                           width: 1,
// //                         ),
// //                       ),
// //                       child: Text(
// //                         page.tag,
// //                         style: TextStyle(
// //                           fontSize: 11,
// //                           fontWeight: FontWeight.w700,
// //                           letterSpacing: 2.5,
// //                           color: tagColor,
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 16),

// //                     // Title
// //                     Text(
// //                       page.title,
// //                       textAlign: TextAlign.center,
// //                       style: TextStyle(
// //                         fontFamily: 'Georgia',
// //                         fontSize: 28,
// //                         fontWeight: FontWeight.bold,
// //                         color: titleColor,
// //                         height: 1.25,
// //                         letterSpacing: -0.3,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 14),

// //                     // Subtitle
// //                     Text(
// //                       page.subtitle,
// //                       textAlign: TextAlign.center,
// //                       style: TextStyle(
// //                         fontSize: 14.5,
// //                         color: subtitleColor,
// //                         height: 1.65,
// //                         letterSpacing: 0.1,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 8),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ─── Illustration Placeholder (shown when asset isn't available) ──────────────

// // class _IllustrationPlaceholder extends StatelessWidget {
// //   final OnboardingPage page;
// //   const _IllustrationPlaceholder({required this.page});

// //   @override
// //   Widget build(BuildContext context) {
// //     final isDark = page.bgTop == const Color(0xFF1A202C);
// //     return Container(
// //       decoration: BoxDecoration(
// //         color: isDark
// //             ? Colors.white.withOpacity(0.05)
// //             : page.accentColor.withOpacity(0.07),
// //         borderRadius: BorderRadius.circular(32),
// //       ),
// //       child: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(
// //               Icons.image_rounded,
// //               size: 80,
// //               color: page.accentColor.withOpacity(0.3),
// //             ),
// //             const SizedBox(height: 12),
// //             Text(
// //               'Place your illustration here',
// //               style: TextStyle(
// //                 color: page.accentColor.withOpacity(0.4),
// //                 fontSize: 13,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // ─── Bottom Controls ──────────────────────────────────────────────────────────

// // class _BottomControls extends StatelessWidget {
// //   final int currentPage;
// //   final int totalPages;
// //   final bool isDark;
// //   final Color accentColor;
// //   final VoidCallback onNext;

// //   const _BottomControls({
// //     required this.currentPage,
// //     required this.totalPages,
// //     required this.isDark,
// //     required this.accentColor,
// //     required this.onNext,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final isLast = currentPage == totalPages - 1;

// //     return Padding(
// //       padding: const EdgeInsets.fromLTRB(28, 8, 28, 32),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           // Dot Indicators
// //           Row(
// //             children: List.generate(totalPages, (index) {
// //               final isActive = index == currentPage;
// //               return AnimatedContainer(
// //                 duration: const Duration(milliseconds: 350),
// //                 curve: Curves.easeInOut,
// //                 margin: const EdgeInsets.only(right: 7),
// //                 width: isActive ? 28 : 8,
// //                 height: 8,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(4),
// //                   color: isActive
// //                       ? accentColor
// //                       : (isDark
// //                           ? Colors.white24
// //                           : accentColor.withOpacity(0.25)),
// //                 ),
// //               );
// //             }),
// //           ),

// //           // Next / Get Started Button
// //           GestureDetector(
// //             onTap: onNext,
// //             child: AnimatedContainer(
// //               duration: const Duration(milliseconds: 400),
// //               curve: Curves.easeInOut,
// //               padding: EdgeInsets.symmetric(
// //                 horizontal: isLast ? 24 : 0,
// //                 vertical: isLast ? 14 : 0,
// //               ),
// //               width: isLast ? null : 58,
// //               height: isLast ? null : 58,
// //               decoration: BoxDecoration(
// //                 color: accentColor,
// //                 borderRadius: BorderRadius.circular(isLast ? 16 : 29),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: accentColor.withOpacity(0.35),
// //                     blurRadius: 20,
// //                     offset: const Offset(0, 8),
// //                   ),
// //                 ],
// //               ),
// //               child: isLast
// //                   ? Row(
// //                       mainAxisSize: MainAxisSize.min,
// //                       children: const [
// //                         Text(
// //                           'Get Started',
// //                           style: TextStyle(
// //                             color: Colors.white,
// //                             fontWeight: FontWeight.w700,
// //                             fontSize: 15,
// //                             letterSpacing: 0.5,
// //                           ),
// //                         ),
// //                         SizedBox(width: 8),
// //                         Icon(Icons.favorite_rounded,
// //                             color: Colors.white, size: 18),
// //                       ],
// //                     )
// //                   : const Icon(
// //                       Icons.arrow_forward_rounded,
// //                       color: Colors.white,
// //                       size: 24,
// //                     ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }





import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/initial_info_screen.dart';

/// Single-screen welcome/onboarding: a full-bleed photo up top, a bold
/// headline with the brand name picked out in coral, a short subtitle,
/// and a pill-shaped "Get Started" CTA. Fully responsive via
/// flutter_screenutil so spacing, radii, and type scale correctly
/// across phone sizes.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  )..forward();

  late final Animation<double> _fade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
  );

  late final Animation<Offset> _rise = Tween(
    begin: const Offset(0, 0.08),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _getStarted() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const InitialInfoScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ── Hero photo ──────────────────────────────────────────
          SizedBox(
            height: 0.52.sh,
            width: double.infinity,
            child: Image.asset(
              'assets/image/onboarding.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const _HeroPlaceholder(),
            ),
          ),

          // ── Content ──────────────────────────────────────────────
          Expanded(
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.fromLTRB(28.w, 28.h, 28.w, 20.h),
                child: FadeTransition(
                  opacity: _fade,
                  child: SlideTransition(
                    position: _rise,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.tasaOrbiter(
                              color: AppColors.ink,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w800,
                              height: 1.2,
                            ),
                            children: [
                              const TextSpan(text: 'Find Your Perfect '),
                              const TextSpan(text: 'Match with '),
                              TextSpan(
                                text: 'Vivah',
                                style: TextStyle(color: AppColors.coral),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Text(
                          'Join thousands who\'ve found love through '
                          'our trusted matrimony platform.',
                          style: GoogleFonts.tasaOrbiter(
                            color: Colors.black,
                            fontSize: 16.sp,
                            height: 1.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),

                        // ── Get Started button ──────────────────────
                        SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: _getStarted,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.coral,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                            ),
                            child: Text(
                              'Get Started',
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 14.h),

                        // ── Simple page indicator ───────────────────
                        Center(
                          child: Container(
                            width: 134.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroPlaceholder extends StatelessWidget {
  const _HeroPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.coral.withOpacity(0.85),
            AppColors.coralDark,
          ],
        ),
      ),
      child: Center(
        child: Icon(
          Icons.favorite_rounded,
          size: 64.sp,
          color: Colors.white70,
        ),
      ),
    );
  }
}