// import 'package:flutter/material.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/edit_partner_preference_screen.dart';
// import 'package:matrimony_app/view/interest_screen.dart';
// import 'package:matrimony_app/view/login_screen.dart';
// import 'package:matrimony_app/view/manage_photo_screen.dart';
// import 'package:matrimony_app/view/manage_request_screen.dart';
// import 'package:matrimony_app/view/message_list_screen.dart';
// import 'package:matrimony_app/services/shared_preference_helper.dart';
// import 'package:matrimony_app/view/privacy_setting_screen.dart';
// import 'package:matrimony_app/view/safe_matrimony.dart';
// import 'package:matrimony_app/view/subscription_plan_screen.dart';
// import 'package:matrimony_app/view/trust_badge_screen.dart';
// import 'package:matrimony_app/view/verify_profile_screen.dart';

// class AppDrawer extends StatelessWidget {

//   final String? activePlan;
//   const AppDrawer({super.key, this.activePlan});

//   static const _menuItems = [
//     //_DrawerMenuItem('Edit Profile', Icons.edit_outlined),
//     _DrawerMenuItem('Manage photos', Icons.photo_library_outlined),
//     _DrawerMenuItem('Add trust badge', Icons.shield_outlined),
//     _DrawerMenuItem('Edit partner preference', Icons.favorite_border_rounded),
//     _DrawerMenuItem('Verify your profile', Icons.fact_check_outlined),
//     _DrawerMenuItem('Manage request', Icons.tune_rounded),
//     _DrawerMenuItem('Manage interest', Icons.tune_rounded),
//     _DrawerMenuItem('Message', Icons.chat_bubble_outline_rounded),
//     _DrawerMenuItem('Manage Password',Icons.lock_outlined),
//     _DrawerMenuItem('Privacy Settings', Icons.tune_rounded),
//     _DrawerMenuItem('View subscriptions', Icons.thumb_up_outlined),
//     _DrawerMenuItem('Safe matrimony', Icons.favorite_border_rounded),
//   ];

//   void _onMenuTap(BuildContext context, String label) {
//     Navigator.pop(context);
//     switch (label) {
//       case 'Manage photos':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => ManagePhotosScreen()),
//         );
//         break;
//       case 'Add trust badge':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const TrustBadgeScreen()),
//         );
//         break;
//       case 'Verify your profile':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const VerifyProfileScreen()),
//         );
//         break;
//       case 'Edit partner preference':
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             // TODO: wire up real partner-preference sections data here.
//             builder: (_) => const PartnerPreferencesScreen(sections: []),
//           ),
//         );
//         break;
//       case 'Manage interest':
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => const InterestsScreen(initialTabIndex: 0),
//           ),
//         );
//         break;
//       case 'Manage request':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const ManageRequestScreen()),
//         );
//         break;
//       case 'Message':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const MessagesListScreen()),
//         );
//         break;
//       case 'Privacy Settings':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const PrivacySettingsScreen()),
//         );
//         break;
//       case 'View subscriptions':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const SubscriptionPlanScreen()),
//         );
//         break;
//       case 'Safe matrimony':
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => SafeMatrimony()),
//         );
//       default:
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text('$label — coming soon')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final hasActivePlan = activePlan != null && activePlan!.isNotEmpty;
//     return Drawer(
//       backgroundColor: Colors.transparent,
//       width: (MediaQuery.of(context).size.width * 0.78).clamp(260.0, 360.0),
//       child: Container(
//         decoration: const BoxDecoration(gradient: AppColors.gradPrimary),
//         child: SafeArea(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(18, 18, 18, 10),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(AppColors.r32),
//                       ),
//                       child: Text(
//                         hasActivePlan
//                             ? '$activePlan Member'
//                             : 'No active subscription.',
//                         style: const TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w700,
//                           color: AppColors.kDarkSlate,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const SubscriptionPlanScreen(),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(AppColors.r32),
//                           border: Border.all(color: AppColors.gold, width: 1.2),
//                         ),
//                         child: Text(
//                           hasActivePlan
//                               ? 'Manage Subscription'
//                               : 'Subscribe Now',
//                           style: const TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w800,
//                             color: AppColors.primary,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 6),
//               Expanded(
//                 child: ListView.builder(
//                   padding: const EdgeInsets.symmetric(horizontal: 18),
//                   itemCount: _menuItems.length,
//                   itemBuilder: (ctx, i) {
//                     final item = _menuItems[i];
//                     return _DrawerTile(
//                       item: item,
//                       onTap: () => _onMenuTap(context, item.label),
//                     );
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(18, 8, 18, 18),
//                 child: GestureDetector(
//                   onTap: () async {
//                     await SharedPreferenceHelper.logout();
//                     if (!context.mounted) return;
//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(builder: (_) => const SignInScreen()),
//                       (route) => false,
//                     );
//                   },
//                   child: Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.symmetric(vertical: 13),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       color: Colors.transparent,
//                       borderRadius: BorderRadius.circular(AppColors.r32),
//                       border: Border.all(color: Colors.white.withOpacity(0.6)),
//                     ),
//                     child: const Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.logout_rounded,
//                           color: Colors.white,
//                           size: 16,
//                         ),
//                         SizedBox(width: 8),
//                         Text(
//                           'Logout',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _DrawerMenuItem {
//   final String label;
//   final IconData icon;
//   const _DrawerMenuItem(this.label, this.icon);
// }

// class _DrawerTile extends StatelessWidget {
//   final _DrawerMenuItem item;
//   final VoidCallback onTap;
//   const _DrawerTile({required this.item, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 11),
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 item.label,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 14.5,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             Icon(item.icon, color: Colors.white, size: 19),
//           ],
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/edit_partner_preference_screen.dart';
import 'package:matrimony_app/view/edit_profile_screen.dart';
import 'package:matrimony_app/view/login_screen.dart';
import 'package:matrimony_app/services/shared_preference_helper.dart';


class AppDrawer extends StatelessWidget {
  final String? name;
  final String? profileId;
  final String? avatarUrl;
  final int profileCompletion; // 0 - 100
  final bool isVerified;
  final String? activePlan;
  final String? planValidTill;

  const AppDrawer({
    super.key,
    this.name,
    this.profileId,
    this.avatarUrl,
    this.profileCompletion = 0,
    this.isVerified = false,
    this.activePlan,
    this.planValidTill,
  });

  static const _menuItems = [
    _DrawerMenuItem('View & Edit your Profile', Icons.person_outline_rounded),
    _DrawerMenuItem('Partner Preference', Icons.favorite_border_rounded),
    _DrawerMenuItem('Help Centre', Icons.headset_mic_outlined),
    _DrawerMenuItem('Privacy Policy', Icons.shield_outlined),
    _DrawerMenuItem('Terms & Conditions', Icons.description_outlined),
  ];

  void _onMenuTap(BuildContext context, String label) {
    Navigator.pop(context);
    switch (label) {
      case 'View & Edit your Profile':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const EditProfileScreen()),
        );
        break;
      case 'Partner Preference':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const EditPartnerPreferenceScreen(
             
            ),
          ),
        );
        break;
      case 'Help Centre':
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (_) => const HelpCentreScreen()),
        // );
        break;
      case 'Privacy Policy':
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen()),
        // );
        break;
      case 'Terms & Conditions':
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (_) => const TermsConditionsScreen()),
        // );
        break;
      default:
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$label — coming soon')));
    }
  }

  Future<void> _logout(BuildContext context) async {
    await SharedPreferenceHelper.logout();
    if (!context.mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const SignInScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasActivePlan = activePlan != null && activePlan!.isNotEmpty;

    return Drawer(
      backgroundColor: Colors.white,
      width: (MediaQuery.of(context).size.width * 0.85).clamp(280.0, 380.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            // Close button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.close_rounded,
                  size: 24,
                  color: AppColors.kDarkSlate,
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Profile + plan card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: _buildProfileCard(hasActivePlan),
            ),

            const SizedBox(height: 20),

            // Menu list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                children: [
                  for (final item in _menuItems) ...[
                    _DrawerTile(
                      item: item,
                      onTap: () => _onMenuTap(context, item.label),
                    ),
                    const SizedBox(height: 12),
                  ],
                ],
              ),
            ),

            // Logout
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 18),
              child: GestureDetector(
                onTap: () => _logout(context),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(AppColors.r32),
                    border: Border.all(color: AppColors.primary.withOpacity(0.5)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_rounded, color: AppColors.primary, size: 16),
                      SizedBox(width: 8),
                      Text(
                        'Logout',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(bool hasActivePlan) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top pink gradient section: avatar, name, id, download icon
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                
                colors: [Color(0xFFFFD9E0), Color(0xFFFFF3F0)],
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAvatarWithBadge(),
                const SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                name ?? 'Your Name',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.kDarkSlate,
                                ),
                              ),
                            ),
                            if (isVerified) ...[
                              const SizedBox(width: 5),
                              Image.asset('assets/image/verified.png')
                            ],
                          ],
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'ID: ${profileId ?? '—'}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.kDarkSlate,
                                ),
                              ),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: () {
                                  if (profileId != null) {
                                    Clipboard.setData(
                                      ClipboardData(text: profileId!),
                                    );
                                  }
                                },
                                child: const Icon(
                                  Icons.copy_rounded,
                                  size: 16,
                                  color: AppColors.kDarkSlate,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: download / share profile card
                  },
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.file_download_outlined,
                      size: 16,
                      color: AppColors.kDarkSlate,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Curved seam between the pink header and the cream plan strip.
          SizedBox(
            height: 18,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(color: const Color(0xFFFFE9B8)),
                ),
                Positioned.fill(
                  child: ClipPath(
                    clipper: _CardCurveClipper(),
                    child: Container(color: const Color(0xFFFFF3F0)),
                  ),
                ),
              ],
            ),
          ),

          // Bottom yellow strip: premium plan info
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFE9B8), Color(0xFFFFF6E0)],
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              hasActivePlan
                  ? '$activePlan Plan  |  Valid till ${planValidTill ?? '—'}'
                  : 'No active subscription',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.kDarkSlate,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarWithBadge() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 58,
          height: 58,
          padding: const EdgeInsets.all(2.5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary, width: 2),
          ),
          child: ClipOval(
            child: (avatarUrl != null && avatarUrl!.isNotEmpty)
                ? Image.network(avatarUrl!, fit: BoxFit.cover)
                : Container(
                    color: const Color(0xFFEFEFEF),
                    child: const Icon(
                      Icons.person,
                      color: Colors.black26,
                      size: 26,
                    ),
                  ),
          ),
        ),
        Positioned(
          bottom: -6,
          left: 6,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: Text(
              '$profileCompletion%',
              style: const TextStyle(
                fontSize: 9.5,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DrawerMenuItem {
  final String label;
  final IconData icon;
  const _DrawerMenuItem(this.label, this.icon);
}

class _DrawerTile extends StatelessWidget {
  final _DrawerMenuItem item;
  final VoidCallback onTap;
  const _DrawerTile({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFEDEDED)),
        ),
        child: Row(
          children: [
            Icon(item.icon, size: 19, color: AppColors.kDarkSlate),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                item.label,
                style: const TextStyle(
                  color: AppColors.kDarkSlate,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.kDarkSlate,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

/// Clips a smooth single dip curving down toward the bottom-center — used to
/// draw the pink header's color as a curved (not flat) seam against the
/// cream plan strip below it.
class _CardCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.3)
      ..quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        size.height * 0.3,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}