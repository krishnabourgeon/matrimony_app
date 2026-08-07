// import 'package:flutter/material.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';

// class SafeMatrimony extends StatelessWidget {
//   const SafeMatrimony({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           'Safe Matrimony',
//           style: TextStyle(
//             fontFamily: 'Georgia',
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//             color: AppColors.kDarkSlate,
//           ),
//         ),
//         leading: InkWell(
//           onTap: () => Navigator.pop(context),
//           child: Icon(
//             Icons.arrow_back_ios,
//             color: AppColors.kDarkSlate,
//             size: 17,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 20),
//               height: 200,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 gradient: LinearGradient(
//                   colors: [
//                     const Color.fromARGB(255, 245, 136, 165),
//                     const Color.fromARGB(255, 245, 208, 218),
//                     //Colors.white,
//                     //AppColors.primaryMid,
//                   ],
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           "Safe Matrimony",
//                           style: TextStyle(
//                             fontFamily: 'Georgia',
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 15),
//                         Text(
//                           "Your safety is our priority. To ensure a secure and positive experience, please follow these guidelines",
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontFamily: 'tasaOrbiter',
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Image.asset(
//                     "assets/image/Chat-amico.png",
//                     height: 180,
//                     width: 130,
//                     fit: BoxFit.cover,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             _buildTextCard(title: "Protect Your Personal Information",
//             text: "Do not share sensitive personal information such as your home address, phone number, financial details, or work location until you are comfortable", text1: "Avoid sending money or sharing financial details with anyone, even if the request seems urgent or emotional."),
//             SizedBox(height: 20),

//             _buildTextCard(title: "Communication & Verification",
//             text: "Use the website's messaging system for initial communication. Avoid sharing your personal contact information too soon.",
//             text1: "Verify the identity of the person you are communicating with. Consider using video calls before meeting in person."),
//             SizedBox(height: 20),

//             _buildTextCard(title: "Be Cautious of Scams",
//             text: "Beware of too-good-to-be-true profiles or those who avoid personal meetings.",
//             text1: "Report suspicious behavior immediately to our support team. We take all reports seriously and will take appropriate action."),
//             SizedBox(height: 20),

//             _buildTextCard(title: "Meeting in Person",
//             text: "Choose a public place for your first meeting.",
//             text1: "Inform a friend or family member about your meeting plans, including details about the person you're meeting.",
//             boldText: "Arrange your own transportation to and from the meeting location."),
//             SizedBox(height: 20),
//             _buildTextCard(title: "Trust your instincts",
//             text: "Listen to your gut feelings. If something feels off, take a step back.",
//             text1: "End communication with anyone who pressures you into something uncomfortable or makes you feel uneasy."),
//             SizedBox(height: 20),
//             _buildTextCard(title: "Report and block",
//             text: "Use the block feature if you feel uncomfortable or harassed by another user.",
//             text1: "Report any concerns directly to our support team through the “Report User” feature available on every profile. Your safety is paramount. Please remember that while we strive to provide a safe platform, your vigilance and caution are essential in protecting yourself."),
//              SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget _bulletLine(String text) {
//   return Row(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         "- ",
//         style: TextStyle(
//           fontSize: 14,
//           fontFamily: 'tasaOrbiter',
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       Expanded(
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 14,
//             fontFamily: 'tasaOrbiter',
//             color: Colors.black,
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Widget _buildTextCard({
//   required String title,
//   required String text,
//   required String text1,
//    String? boldText,
// }) {
//   return Container(
//     padding: EdgeInsets.all(20),
//     width: double.infinity,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(20),
//       color: Colors.white,
//       border: Border.all(color: Colors.grey.shade400),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontFamily: 'Georgia',
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         SizedBox(height: 15),
//         _bulletLine(text),
//         SizedBox(height: 8),
//         _bulletLine(text1),
//         if (boldText != null) ...[
//           SizedBox(height: 8),
//           _bulletLine(boldText),
//         ],
//       ],
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

class SafeMatrimony extends StatelessWidget {
  const SafeMatrimony({super.key});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: _appBar(context, top)),
          SliverToBoxAdapter(child: _heroBanner()),
          const SliverToBoxAdapter(
            child: _SafetyCard(
              icon: Icons.shield_outlined,
              iconColor: AppColors.primary,
              iconBg: AppColors.primaryLight,
              title: "Protect Your Personal Information",
              points: [
                "Do not share sensitive personal information such as your home address, phone number, financial details, or work location until you are comfortable",
                "Avoid sending money or sharing financial details with anyone, even if the request seems urgent or emotional.",
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: _SafetyCard(
              icon: Icons.chat_bubble_outline_rounded,
              iconColor: AppColors.blue,
              iconBg: AppColors.blueLight,
              title: "Communication & Verification",
              points: [
                "Use the website's messaging system for initial communication. Avoid sharing your personal contact information too soon.",
                "Verify the identity of the person you are communicating with. Consider using video calls before meeting in person.",
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: _SafetyCard(
              icon: Icons.warning_amber_rounded,
              iconColor: AppColors.gold,
              iconBg: AppColors.goldLight,
              title: "Be Cautious of Scams",
              points: [
                "Beware of too-good-to-be-true profiles or those who avoid personal meetings.",
                "Report suspicious behavior immediately to our support team. We take all reports seriously and will take appropriate action.",
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: _SafetyCard(
              icon: Icons.location_on_outlined,
              iconColor: AppColors.success,
              iconBg: AppColors.successLight,
              title: "Meeting in Person",
              points: [
                "Choose a public place for your first meeting.",
                "Inform a friend or family member about your meeting plans, including details about the person you're meeting.",
                "Arrange your own transportation to and from the meeting location.",
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: _SafetyCard(
              icon: Icons.favorite_border_rounded,
              iconColor: AppColors.roseGold,
              iconBg: AppColors.roseGoldLight,
              title: "Trust Your Instincts",
              points: [
                "Listen to your gut feelings. If something feels off, take a step back.",
                "End communication with anyone who pressures you into something uncomfortable or makes you feel uneasy.",
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: _SafetyCard(
              icon: Icons.block_rounded,
              iconColor: AppColors.primary,
              iconBg: AppColors.primaryLight,
              title: "Report and Block",
              points: [
                "Use the block feature if you feel uncomfortable or harassed by another user.",
                "Report any concerns directly to our support team through the \u201cReport User\u201d feature available on every profile. Your safety is paramount \u2014 your vigilance and caution are essential in protecting yourself.",
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context, double top) => Container(
    color: AppColors.surface,
    padding: EdgeInsets.fromLTRB(16, top + 14, 16, 14),
    child: Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Safe Matrimony',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
            letterSpacing: -0.3,
          ),
        ),
      ],
    ),
  );

  Widget _heroBanner() => Container(
    margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
    padding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
    decoration: BoxDecoration(
      gradient: AppColors.gradHero,
      borderRadius: BorderRadius.circular(AppColors.r24),
      boxShadow: AppColors.shadowPrimary,
    ),
    child: Stack(
      children: [
        Positioned(
          top: -20,
          right: -20,
          child: Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.06),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: const Icon(
                Icons.verified_user_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Safe Matrimony",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Your safety is our priority. Follow these guidelines for a secure experience.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.85),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

/// A titled, icon-badged card listing safety guidelines — matches the
/// app's standard surface-card styling (radius, border, shadow).
class _SafetyCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final List<String> points;

  const _SafetyCard({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppColors.r20),
        boxShadow: AppColors.shadowSm,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          for (int i = 0; i < points.length; i++) ...[
            if (i > 0) const SizedBox(height: 10),
            _BulletLine(text: points[i], color: iconColor),
          ],
        ],
      ),
    );
  }
}

/// A single guideline row with a small colored check icon.
class _BulletLine extends StatelessWidget {
  final String text;
  final Color color;

  const _BulletLine({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.check_circle_rounded, color: color, size: 14),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12.5,
              color: AppColors.textHint,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
