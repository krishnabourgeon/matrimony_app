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
//  Standard pattern: vertical selectable plan list + sticky bottom CTA
// ═══════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
import 'package:matrimony_app/view/main_screen.dart';

class SubscriptionPlan {
  final String title;
  final String price;
  final String duration;
  final List<String> features;
  final String badge; // '' if none
  const SubscriptionPlan({
    required this.title,
    required this.price,
    required this.duration,
    required this.features,
    this.badge = '',
  });
}

class SubscriptionPlanScreen extends StatefulWidget {
  const SubscriptionPlanScreen({super.key});

  static const _plans = [
    SubscriptionPlan(
      title: 'Premium',
      price: '₹245.00',
      duration: '2 days',
      features: [
        'Send interests to 5 profiles',
        'View detailed profiles for up to 10 members',
        'Chat with unlimited profiles',
      ],
      badge: 'BEST VALUE',
    ),
    SubscriptionPlan(
      title: 'Launching Offer',
      price: '₹199.00',
      duration: 'Unlimited',
      features: [
        'Send interests to 5 profiles',
        'View detailed profiles for up to 10 members',
        'Chat with unlimited profiles',
      ],
    ),
    SubscriptionPlan(
      title: 'Free Member',
      price: '₹0.00',
      duration: 'Unlimited',
      features: [
        'Send interests to 5 profiles',
        'View detailed profiles for up to 5 members',
        'Chat with unlimited profiles',
      ],
    ),
  ];

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    final defaultIndex =
        SubscriptionPlanScreen._plans.indexWhere((p) => p.badge.isNotEmpty);
    _selectedIndex = defaultIndex == -1 ? 0 : defaultIndex;
  }

  void _confirmPlan(BuildContext context) {
    // TODO: hook up real payment / plan-selection API call here.
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const MainShell()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final plans = SubscriptionPlanScreen._plans;
    final selectedPlan = plans[_selectedIndex];
    final isFree = selectedPlan.price.trim() == '₹0.00';

    return BlushScaffold(
      child: Column(
        children: [
          const TopBar(showBack: false),
          const SizedBox(height: 4),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Choose Your Plan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.kDarkSlate,
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Unlock more matches with a plan that fits you',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.kSlate,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
              itemCount: plans.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final plan = plans[index];
                final selected = index == _selectedIndex;
                return _PlanTile(
                  plan: plan,
                  selected: selected,
                  onTap: () => setState(() => _selectedIndex = index),
                );
              },
            ),
          ),
          _BottomCta(
            plan: selectedPlan,
            isFree: isFree,
            onPressed: () => _confirmPlan(context),
          ),
        ],
      ),
    );
  }
}

class _PlanTile extends StatelessWidget {
  final SubscriptionPlan plan;
  final bool selected;
  final VoidCallback onTap;
  const _PlanTile({
    required this.plan,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppColors.r16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppColors.r16),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.kBorder,
            width: selected ? 1.6 : 1,
          ),
          boxShadow: selected ? AppColors.shadowSm : AppColors.shadowXs,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _SelectionDot(selected: selected),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    plan.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: AppColors.kDarkSlate,
                    ),
                  ),
                ),
                if (plan.badge.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      gradient: AppColors.gradGold,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      plan.badge,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  plan.price,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: AppColors.kDarkSlate,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '/ ${plan.duration}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...plan.features.map(
              (f) => Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle, color: AppColors.primary, size: 14),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        f,
                        style: const TextStyle(
                          color: AppColors.kSlate,
                          fontSize: 12,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectionDot extends StatelessWidget {
  final bool selected;
  const _SelectionDot({required this.selected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? AppColors.primary : Colors.transparent,
        border: Border.all(
          color: selected ? AppColors.primary : AppColors.kBorder,
          width: 1.6,
        ),
      ),
      child: selected
          ? const Icon(Icons.check, size: 13, color: Colors.white)
          : null,
    );
  }
}

class _BottomCta extends StatelessWidget {
  final SubscriptionPlan plan;
  final bool isFree;
  final VoidCallback onPressed;
  const _BottomCta({
    required this.plan,
    required this.isFree,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          boxShadow: AppColors.shadowXs,
        ),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppColors.r12),
              ),
              elevation: 0,
            ),
            child: Text(
              isFree ? 'Continue as Free Member' : 'Continue with ${plan.title}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}