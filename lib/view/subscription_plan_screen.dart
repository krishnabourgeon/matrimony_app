// // ═══════════════════════════════════════════════════════════════
// //  SUBSCRIPTION PLAN SCREEN — shown right after login
// // ═══════════════════════════════════════════════════════════════
// import 'package:flutter/material.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
// import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
// import 'package:matrimony_app/view/main_screen.dart';

// class SubscriptionPlan {
//   final String title;
//   final String price;
//   final String duration;
//   final List<String> features;
//   final String ctaLabel;
//   final bool highlighted;
//   const SubscriptionPlan({
//     required this.title,
//     required this.price,
//     required this.duration,
//     required this.features,
//     required this.ctaLabel,
//     this.highlighted = false,
//   });
// }

// class SubscriptionPlanScreen extends StatefulWidget {
//   const SubscriptionPlanScreen({super.key});

//   static const _plans = [
//     SubscriptionPlan(
//       title: 'Premium',
//       price: '₹245.00',
//       duration: '2 days',
//       features: [
//         'Send interests to 5 profiles',
//         'View detailed profiles for up to 10 members',
//         'Chat with unlimited profiles',
//       ],
//       ctaLabel: 'Choose Plan',
//       highlighted: true,
//     ),
//     SubscriptionPlan(
//       title: 'Launching offer package',
//       price: '₹199.00',
//       duration: 'Unlimited',
//       features: [
//         'Send interests to 5 profiles',
//         'View detailed profiles for up to 10 members',
//         'Chat with unlimited profiles',
//       ],
//       ctaLabel: 'Choose Plan',
//     ),
//     SubscriptionPlan(
//       title: 'Free Member',
//       price: '₹0.00',
//       duration: 'Unlimited',
//       features: [
//         'Send interests to 5 profiles',
//         'View detailed profiles for up to 5 members',
//         'Chat with unlimited profiles',
//       ],
//       ctaLabel: 'Continue as Free Member',
//     ),
//   ];

//   @override
//   State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
// }

// class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {
//   late final PageController _pageController;
//   int _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     final initialPage = SubscriptionPlanScreen._plans.indexWhere((p) => p.highlighted);
//     _currentPage = initialPage == -1 ? 0 : initialPage;
//     _pageController = PageController(
//       viewportFraction: 0.86,
//       initialPage: _currentPage,
//     );
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _selectPlan(BuildContext context, SubscriptionPlan plan) {
//     // TODO: hook up real payment / plan-selection API call here.
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (_) => const MainShell()),
//       (route) => false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final plans = SubscriptionPlanScreen._plans;
//     return BlushScaffold(
//       child: Column(
//         children: [
//           const TopBar(showBack: false),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
//               decoration: BoxDecoration(
//                 color: AppColors.surface,
//                 borderRadius: BorderRadius.circular(AppColors.r20),
//                 border: Border.all(color: AppColors.kBorder),
//                 boxShadow: AppColors.shadowXs,
//               ),
//               child: const Text(
//                 'Choose Your Subscription & Make Payment Securely',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w800,
//                   color: AppColors.kDarkSlate,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 22),
//           Expanded(
//             child: PageView.builder(
//               controller: _pageController,
//               itemCount: plans.length,
//               onPageChanged: (i) => setState(() => _currentPage = i),
//               itemBuilder: (context, index) {
//                 final plan = plans[index];
//                 return AnimatedBuilder(
//                   animation: _pageController,
//                   builder: (context, child) {
//                     double scale = 1.0;
//                     if (_pageController.position.haveDimensions) {
//                       final page = _pageController.page ?? _currentPage.toDouble();
//                       scale = (1 - ((page - index).abs() * 0.08)).clamp(0.92, 1.0);
//                     }
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                       child: Transform.scale(scale: scale, child: child),
//                     );
//                   },
//                   child: _PlanCard(plan: plan, onTap: () => _selectPlan(context, plan)),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 18),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               for (int i = 0; i < plans.length; i++)
//                 AnimatedContainer(
//                   duration: const Duration(milliseconds: 200),
//                   margin: const EdgeInsets.symmetric(horizontal: 4),
//                   width: _currentPage == i ? 20 : 7,
//                   height: 7,
//                   decoration: BoxDecoration(
//                     color: _currentPage == i ? AppColors.primary : AppColors.kBorder,
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                 ),
//             ],
//           ),
//           const SizedBox(height: 28),
//         ],
//       ),
//     );
//   }
// }

// class _PlanCard extends StatelessWidget {
//   final SubscriptionPlan plan;
//   final VoidCallback onTap;
//   const _PlanCard({required this.plan, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     final bool isFree = plan.price == '₹0.00';
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [AppColors.primaryMid, AppColors.primaryLight],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(AppColors.r20),
//         boxShadow: plan.highlighted ? AppColors.shadowSm : AppColors.shadowXs,
//         border: plan.highlighted
//             ? Border.all(color: AppColors.gold, width: 1.5)
//             : Border.all(color: AppColors.kBorder),
//       ),
//       padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   plan.title,
//                   style: const TextStyle(
//                     color: AppColors.kDarkSlate,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//               ),
//               if (plan.highlighted)
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
//                   decoration: BoxDecoration(
//                     gradient: AppColors.gradGold,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: const Text(
//                     'BEST VALUE',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 9,
//                       fontWeight: FontWeight.w900,
//                       letterSpacing: 0.6,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(AppColors.r16),
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.baseline,
//               textBaseline: TextBaseline.alphabetic,
//               children: [
//                 Text(
//                   plan.price,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w900,
//                     color: AppColors.kDarkSlate,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Text(
//                   plan.duration,
//                   style: const TextStyle(
//                     fontSize: 13,
//                     fontWeight: FontWeight.w700,
//                     color: AppColors.primary,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 10),
//           ...plan.features.map(
//             (f) => Padding(
//               padding: const EdgeInsets.only(bottom: 6),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Icon(Icons.auto_awesome, color: AppColors.primary, size: 12),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       f,
//                       style: const TextStyle(
//                         color: AppColors.kSlate,
//                         fontSize: 12,
//                         height: 1.35,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 6),
//           GestureDetector(
//             onTap: onTap,
//             child: Container(
//               width: double.infinity,
//               height: 40,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 gradient: AppColors.gradPrimary,
//                 borderRadius: BorderRadius.circular(AppColors.r12),
//               ),
//               child: Text(
//                 plan.ctaLabel,
//                 style: TextStyle(
//                   fontSize: 13,
//                   fontWeight: FontWeight.w800,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




// ═══════════════════════════════════════════════════════════════
//  SUBSCRIPTION PLAN SCREEN — shown right after login
//  3 gradient plan cards in a swipeable carousel + sticky page dots
// ═══════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/success_screen.dart';

class _Palette {
  _Palette._();
  static const Color coral = Color(0xFFFF3356);
  static const Color coralDark = Color(0xFFE01F42);
  static const Color coralLight = Color(0xFFFFEEF1);
  static const Color ink = Color(0xFF1A1A1A);
  static const Color subtleWhite = Color(0xFFFFFFFF);
  static const Color fieldBg = Color(0xFFF5F5F7);
  static const Color hintText = Color(0xFF8A8A8E);
}

class SubscriptionPlan {
  final String title;
  final String price;
  final String duration;
  final List<String> features;
  final String ctaLabel;
  final bool isFree;
  const SubscriptionPlan({
    required this.title,
    required this.price,
    required this.duration,
    required this.features,
    required this.ctaLabel,
    this.isFree = false,
  });
}

class SubscriptionPlanScreen extends StatefulWidget {
  const SubscriptionPlanScreen({super.key});

  static const _plans = [
    SubscriptionPlan(
      title: 'Premium',
      price: '₹245.00',
      duration: '30 days',
      features: [
        'Send interests to 5 profiles',
        'View detailed profiles for up to 10 members',
        'Chat with unlimited profiles',
      ],
      ctaLabel: 'Choose Plan',
    ),
    SubscriptionPlan(
      title: 'Launching offer package',
      price: '₹199.00',
      duration: '30 days',
      features: [
        'Send interests to 5 profiles',
        'View detailed profiles for up to 10 members',
        'Chat with unlimited profiles',
      ],
      ctaLabel: 'Choose Plan',
    ),
    SubscriptionPlan(
      title: 'Free Member',
      price: '₹0.00',
      duration: '30 days',
      features: [
        'Send interests to 5 profiles',
        'View detailed profiles for up to 5 members',
        'Chat with unlimited profiles',
      ],
      ctaLabel: 'Continue as Free Member',
      isFree: true,
    ),
  ];

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.86);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectPlan(SubscriptionPlan plan) {
    // TODO: hook up real payment / plan-selection API call here.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AllSetScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final plans = SubscriptionPlanScreen._plans;
    return Scaffold(
      backgroundColor: _Palette.subtleWhite,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            SizedBox(height: 18.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: _Palette.fieldBg,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Text(
                  'Choose Your Subscription & Make Payment Securely',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: _Palette.ink,
                  ),
                ),
              ),
            ),
            SizedBox(height: 22.h),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: plans.length,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (context, index) {
                  final plan = plans[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                    child: Center(
                      child: _PlanCard(plan: plan, onTap: () => _selectPlan(plan)),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < plans.length; i++)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    width: _currentPage == i ? 20.w : 7.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      color: _currentPage == i ? _Palette.coral : _Palette.fieldBg,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).maybePop(),
            child: Container(
              width: 36.w,
              height: 36.w,
              decoration: const BoxDecoration(
                color: _Palette.fieldBg,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_back_rounded, color: _Palette.ink, size: 18.sp),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final SubscriptionPlan plan;
  final VoidCallback onTap;
  const _PlanCard({required this.plan, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 25.h),
      decoration: BoxDecoration(
        // gradient: const LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   colors: [_Palette.coral, _Palette.coralLight],
        // ),
        color: AppColors.coral,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: _Palette.coral.withOpacity(0.25),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            plan.title,
            style: GoogleFonts.tasaOrbiter(
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              color: _Palette.subtleWhite,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.h),
            decoration: BoxDecoration(
              color: _Palette.subtleWhite,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  plan.price,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: _Palette.ink,
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  plan.duration,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: _Palette.coral,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          ...plan.features.map(
            (f) => Padding(
              padding: EdgeInsets.only(bottom: 7.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '✦',
                    style: TextStyle(fontSize: 15.sp, color: _Palette.subtleWhite),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      f,
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 17.5.sp,
                        fontWeight: FontWeight.w500,
                        color: _Palette.subtleWhite,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 6.h),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _Palette.coralLight,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                plan.ctaLabel,
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 19.5.sp,
                  fontWeight: FontWeight.w700,
                  color: _Palette.ink,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}