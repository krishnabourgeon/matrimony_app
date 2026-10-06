// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:matrimony_app/provider/home_provider.dart';
// import 'package:matrimony_app/view/subscription_plan_screen.dart';
// import 'package:provider/provider.dart';
// import 'package:matrimony_app/model/dashboard_model.dart' as dashboard_model;
// import 'package:matrimony_app/provider/register_provider.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/custom_widgets/app_drawer.dart';

// /// Renders a profile photo from either a network URL (real API data) or a
// /// local asset path (fallback/sample data), with a person-icon fallback if
// /// the image is missing or fails to load.
// Widget _profileImage(
//   String image, {
//   double? width,
//   double? height,
//   required double errorIconSize,
// }) {
//   final errorFallback = Container(
//     width: width,
//     height: height,
//     color: AppColors.primaryLight,
//     child: Icon(Icons.person, size: errorIconSize, color: AppColors.primary),
//   );
//   if (image.startsWith('http')) {
//     return Image.network(
//       image,
//       width: width,
//       height: height,
//       fit: BoxFit.cover,
//       errorBuilder: (_, __, ___) => errorFallback,
//     );
//   }
//   return Image.asset(
//     image,
//     width: width,
//     height: height,
//     fit: BoxFit.cover,
//     errorBuilder: (_, __, ___) => errorFallback,
//   );
// }

// /// Simple data holder for a match profile card.
// class MatchProfile {
//   final String name;
//   final String subtitle;
//   final String image;

//   const MatchProfile({
//     required this.name,
//     required this.subtitle,
//     required this.image,
//   });
// }

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   bool _showProfileBanner = true;
//   int _selectedNavIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<HomeProvider>().getDashboard();
//     });
//   }

//   List<MatchProfile> _resolveMatches(
//     List<dashboard_model.DailyMatch>? apiMatches,
//     List<MatchProfile> fallback,
//   ) {
//     if (apiMatches == null || apiMatches.isEmpty) return fallback;
//     return apiMatches
//         .map(
//           (m) => MatchProfile(
//             name: m.name ?? '',
//             subtitle: _matchSubtitle(m),
//             image: m.imageUrl ?? '',
//           ),
//         )
//         .toList();
//   }

//   String _matchSubtitle(dashboard_model.DailyMatch m) {
//     final parts = <String>[
//       if (m.age != null) '${m.age} Yrs',
//       if (m.height != null && m.height!.isNotEmpty) m.height!,
//       if (m.motherTongue != null && m.motherTongue!.isNotEmpty) m.motherTongue!,
//     ];
//     final line2 = <String>[
//       if (m.community != null && m.community!.isNotEmpty) m.community!,
//     ];
//     final line3 = <String>[
//       if (m.location != null && m.location!.isNotEmpty) m.location!,
//     ];
//     return [
//       parts.join(', '),
//       if (line2.isNotEmpty) line2.join(', '),
//       if (line3.isNotEmpty) line3.join(', '),
//     ].where((s) => s.isNotEmpty).join('\n');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       drawer: Consumer<RegisterProvider>(
//         builder: (context, provider, _) {
//           final customer = provider.verifyOtpModel?.customer;
//           return AppDrawer(
//             name: customer?.name,
//             profileId: customer?.id.toString(),
//             // No backend source yet for these — surfaced as placeholders in
//             // the drawer UI until a "my profile"/subscription endpoint
//             // exists to back them.
//             // avatarUrl, profileCompletion, isVerified, activePlan, planValidTill
//           );
//         },
//       ),
//       body: SafeArea(
//         child: Consumer<HomeProvider>(
//           builder: (context, provider, _) {
//             final dm = provider.dashboardModel;
//             // No local sample fallback — a section only renders when the API
//             // actually returns matches for it.
//             final resolvedDaily = _resolveMatches(dm?.dailyMatches, const []);
//             final resolvedNew = _resolveMatches(dm?.newMatches, const []);
//             final resolvedPremium = _resolveMatches(dm?.premiumMatches, const []);
//             final resolvedRecent = _resolveMatches(dm?.recentVisited, const []);
//             final unreadCount = dm?.notifications?.unreadCount ?? 0;
//             final interestReceived = dm?.stats?.interestReceived ?? 0;
//             final interestAccepted = dm?.stats?.interestAccepted ?? 0;
//             final contactsViewed = dm?.stats?.contactsViewed ?? 0;
//             final completionPercentage = dm?.profileCompletion?.percentage;

//             return SingleChildScrollView(
//               padding: EdgeInsets.only(bottom: 24.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildTopBar(unreadCount: unreadCount),
//                   SizedBox(height: 25.h),
//                   _buildQuickActions(
//                     interestReceived: interestReceived,
//                     interestAccepted: interestAccepted,
//                     contactsViewed: contactsViewed,
//                   ),
//                   SizedBox(height: 10.h),
//                   Divider(thickness: 4, color: Colors.black.withOpacity(0.05)),
//                   SizedBox(height: 15.h),

//                   if (resolvedDaily.isNotEmpty) ...[
//                     _buildSectionHeader('All Matches'),
//                     SizedBox(height: 10.h),
//                     _buildDailyMatchesRow(resolvedDaily),
//                     SizedBox(height: 10.h),
//                     Divider(thickness: 4, color: Colors.black.withOpacity(0.05)),
//                     SizedBox(height: 10.h),
//                   ],
//                   if (_showProfileBanner) ...[
//                     _buildProfileCompletionBanner(completionPercentage),
//                     SizedBox(height:10.h),
//                     Divider(
//                       thickness: 4,
//                       color: Colors.black.withOpacity(0.05),
//                     ),
//                     SizedBox(height: 10.h),
//                   ],
//                   if (resolvedNew.isNotEmpty) ...[
//                     _buildSectionHeader('New Matches'),
//                     SizedBox(height: 10.h),
//                     _buildMatchesRow(resolvedNew),
//                     SizedBox(height: 10.h),
//                     Divider(thickness: 4, color: Colors.black.withOpacity(0.05)),
//                     SizedBox(height: 10.h),
//                   ],
//                   if (resolvedPremium.isNotEmpty) ...[
//                     _buildSectionHeader('Premium Matches'),
//                     SizedBox(height: 10.h),
//                     _buildMatchesRow(resolvedPremium),
//                     SizedBox(height: 10.h),
//                     Divider(thickness: 4, color: Colors.black.withOpacity(0.05)),
//                     SizedBox(height: 10.h),
//                   ],
//                   _buildPromoBanner(),
//                   SizedBox(height: 10.h),
//                   if (resolvedRecent.isNotEmpty) ...[
//                     Divider(thickness: 4, color: Colors.black.withOpacity(0.05)),
//                     SizedBox(height: 10.h),
//                     _buildSectionHeader('Recent Visited'),
//                     SizedBox(height: 10.h),
//                     _buildMatchGrid(resolvedRecent),
//                     SizedBox(height: 10.h),
//                   ],
//                   Divider(thickness: 4, color: Colors.black.withOpacity(0.05)),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   // ---------------- Top bar ----------------
//   Widget _buildTopBar({int unreadCount = 0}) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w),
//       child: Row(
//         //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Builder(
//             builder: (ctx) => GestureDetector(
//               onTap: () => Scaffold.of(ctx).openDrawer(),
//               child: Icon(Icons.menu, size: 24.sp, color: Colors.black87),
//             ),
//           ),
//           SizedBox(width: 10.w),
//           Text(
//             'Vivah',
//             style: GoogleFonts.tasaOrbiter(
//               fontSize: 22.sp,
//               fontWeight: FontWeight.w700,
//               color: AppColors.coral,
//             ),
//           ),
//           Spacer(),
//           Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Icon(
//                 Icons.notifications_none,
//                 size: 24.sp,
//                 color: Colors.black87,
//               ),
//               if (unreadCount > 0)
//                 Positioned(
//                   right: -1.w,
//                   top: -1.w,
//                   child: Container(
//                     width: 8.w,
//                     height: 8.w,
//                     decoration: const BoxDecoration(
//                       color: AppColors.coral,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ---------------- Quick action cards ----------------
//   Widget _buildQuickActions({
//     int interestReceived = 0,
//     int interestAccepted = 0,
//     int contactsViewed = 0,
//   }) {
//     final actions = [
//       _QuickAction(
//         icon: 'assets/image/supervisor_account.png',
//         label: 'Interest\nReceived',
//         showBadge: interestReceived > 0,
//         badgeCount: interestReceived,
//       ),
//       _QuickAction(
//         icon: 'assets/image/heart_check.png',
//         label: 'Interest\nAccepted',
//         showBadge: false,
//         badgeCount: interestAccepted,
//       ),
//       _QuickAction(
//         icon: 'assets/image/supervisor_account (1).png',
//         label: 'Contacts\nViewed',
//         showBadge: false,
//         badgeCount: contactsViewed,
//       ),
//     ];

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w),
//       child: Row(
//         children: actions
//             .map(
//               (a) => Expanded(
//                 child: Container(
//                   height: 90.h,
//                   width: 113.w,
//                   margin: EdgeInsets.only(right: a == actions.last ? 0 : 10.w),
//                   padding: EdgeInsets.symmetric(
//                     vertical: 14.h,
//                     horizontal: 10.w,
//                   ),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFFFE8EC),
//                     borderRadius: BorderRadius.circular(14.r),
//                   ),
//                   child: Stack(
//                     clipBehavior: Clip.none,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image.asset(a.icon, width: 32.w, height: 32.w),
//                           SizedBox(height: 10.h),
//                           Text(
//                             a.label,
//                             style: GoogleFonts.tasaOrbiter(
//                               fontSize: 11.sp,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87,
//                               height: 1.25,
//                             ),
//                           ),
//                         ],
//                       ),
//                       if (a.showBadge)
//                         Positioned(
//                           top: -6.h,
//                           right: -2.w,
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 6.w,
//                               vertical: 2.h,
//                             ),
//                             decoration: BoxDecoration(
//                               color: AppColors.coral,
//                               shape: BoxShape.circle,
//                             ),
//                             child: Text(
//                               '${a.badgeCount}',
//                               style: GoogleFonts.tasaOrbiter(
//                                 fontSize: 9.sp,
//                                 fontWeight: FontWeight.w700,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }

//   // ---------------- Section header ----------------
//   Widget _buildSectionHeader(String title) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: GoogleFonts.tasaOrbiter(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w700,
//               color: Colors.black87,
//             ),
//           ),
//           Row(
//             children: [
//               Text(
//                 'See All',
//                 style: GoogleFonts.tasaOrbiter(
//                   fontSize: 12.sp,
//                   fontWeight: FontWeight.w600,
//                   color: const Color(0xFF5A6ACF),
//                 ),
//               ),
//               Icon(
//                 Icons.chevron_right,
//                 size: 16.sp,
//                 color: const Color(0xFF5A6ACF),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ---------------- Daily matches (horizontal small cards) ----------------
//   Widget _buildDailyMatchesRow(List<MatchProfile> matches) {
//     return SizedBox(
//       height: 150.h,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         padding: EdgeInsets.symmetric(horizontal: 16.w),
//         itemCount: matches.length,
//         separatorBuilder: (_, __) => SizedBox(width: 12.w),
//         itemBuilder: (context, index) {
//           final m = matches[index];
//           return SizedBox(
//             width: 100.w,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12.r),
//                   child: _profileImage(
//                     m.image,
//                     width: 111.w,
//                     height: 111.w,
//                     errorIconSize: 40.sp,
//                   ),
//                 ),
//                 SizedBox(height: 6.h),
//                 Text(
//                   m.name,
//                   style: GoogleFonts.tasaOrbiter(
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black87,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 Text(
//                   m.subtitle,
//                   style: GoogleFonts.tasaOrbiter(
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black54,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }


//   Widget _buildProfileCompletionBanner(int? percentage) {
//     final pct = percentage ?? 75;
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w),
//       child: Container(
//         padding: EdgeInsets.fromLTRB(14.w, 14.h, 30.w, 14.h),
//         decoration: BoxDecoration(
//           gradient: const LinearGradient(
//             colors: [Color(0xFFFFF1CD), Color(0xFFFFEAEC)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(14.r),
//         ),
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 _buildProfileCompletionAvatar(pct),
//                 SizedBox(width: 14.w),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Your profile is $pct% complete',
//                         style: GoogleFonts.tasaOrbiter(
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       SizedBox(height: 4.h),
//                       Text(
//                         'Add a few more details to get the\nbest matches!',
//                         style: GoogleFonts.tasaOrbiter(
//                           fontSize: 11.sp,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFF4F3F17),
//                           height: 1.35,
//                         ),
//                       ),
//                       SizedBox(height: 8.h),
//                       Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             'Complete My Profile',
//                             style: GoogleFonts.tasaOrbiter(
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w700,
//                               color: AppColors.coral,
//                             ),
//                           ),
//                           Icon(
//                             Icons.chevron_right,
//                             size: 15.sp,
//                             color: AppColors.coral,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Positioned(
//               top: -4.h,
//               right: -20.w,
//               child: InkWell(
//                 onTap: () => setState(() => _showProfileBanner = false),
//                 child: Icon(Icons.close, size: 16.sp, color: Colors.black45),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Avatar illustration with an overlapping percentage pill, matching the
//   // profile-completion banner design.
//   Widget _buildProfileCompletionAvatar(int percentage) {
//     final width = 58.w;
//     return SizedBox(
//       width: width,
//       height: width * 51 / 42 + 8.h,
//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.topCenter,
//         children: [
//           Image.asset(
//             'assets/image/Group 1000006498.png',
//             width: width,
//             fit: BoxFit.contain,
//           ),
//           Positioned(
//             bottom: 0,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
//               decoration: BoxDecoration(
//                 color: AppColors.coral,
//                 borderRadius: BorderRadius.circular(12.r),
//                 border: Border.all(color: Colors.white, width: 1.5),
//               ),
//               child: Text(
//                 '$percentage%',
//                 style: GoogleFonts.tasaOrbiter(
//                   fontSize: 10.sp,
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

//   // ---------------- New / Premium matches horizontal row ----------------
//   Widget _buildMatchesRow(List<MatchProfile> matches) {
//     if (matches.isEmpty) return const SizedBox.shrink();
//     return SizedBox(
//       height: 270.h,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         padding: EdgeInsets.symmetric(horizontal: 16.w),
//         itemCount: matches.length,
//         separatorBuilder: (_, __) => SizedBox(width: 12.w),
//         itemBuilder: (context, index) => SizedBox(
//           width: 170.w,
//           child: _MatchCard(profile: matches[index]),
//         ),
//       ),
//     );
//   }

//   // ---------------- 2-column match grid with Connect Now button ----------------
//   // Always laid out two-per-row regardless of how many matches the API
//   // returns, so a 1/3/5-length list doesn't stretch cards across the full
//   // width or squeeze them into extra columns.
//   Widget _buildMatchGrid(List<MatchProfile> matches) {
//     if (matches.isEmpty) return const SizedBox.shrink();
//     final rows = <Widget>[];
//     for (int i = 0; i < matches.length; i += 2) {
//       final hasSecond = i + 1 < matches.length;
//       rows.add(
//         Padding(
//           padding: EdgeInsets.only(bottom: i + 2 < matches.length ? 14.h : 0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(child: _MatchCard(profile: matches[i])),
//               SizedBox(width: 10.w),
//               Expanded(
//                 child: hasSecond
//                     ? _MatchCard(profile: matches[i + 1])
//                     : const SizedBox.shrink(),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w),
//       child: Column(children: rows),
//     );
//   }

//   // ---------------- Promo banner ----------------
//   Widget _buildPromoBanner() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(14.r),
//         child: Container(
//           width: double.infinity,
//           height: 150.h,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: const AssetImage(
//                 'assets/image/9c5335c2be9db6cb3b227f3be7e3357e07f8750f.jpg',
//               ),
//               fit: BoxFit.cover,
//               colorFilter: ColorFilter.mode(
//                 Colors.black.withOpacity(0.15),
//                 BlendMode.darken,
//               ),
//             ),
//           ),
//           child: Container(
//             padding: EdgeInsets.all(16.w),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [AppColors.coral.withOpacity(0.40), Colors.transparent],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//                 stops: const [0.0, 0.85],
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: 160.w,
//                   child: Text(
//                     'Get closer to your perfect match',
//                     style: GoogleFonts.tasaOrbiter(
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       height: 1.25,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10.h),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const SubscriptionPlanScreen(),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 16.w,
//                       vertical: 8.h,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20.r),
//                     ),
//                     child: Text(
//                       'Upgrade Now',
//                       style: GoogleFonts.tasaOrbiter(
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// // class _MatchCard extends StatelessWidget {
// //   final MatchProfile profile;

// //   const _MatchCard({required this.profile});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(14.r),
// //         boxShadow: [
// //           BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 2)),
// //         ],
// //       ),
// //       clipBehavior: Clip.antiAlias,
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           AspectRatio(
// //            height:250.h,
// //             child: Image.asset(profile.image, fit: BoxFit.cover),
// //           ),
// //           Padding(
// //             padding: EdgeInsets.all(10.w),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   profile.name,
// //                   style: GoogleFonts.tasaOrbiter(
// //                     fontSize: 13.sp,
// //                     fontWeight: FontWeight.w700,
// //                     color: Colors.black87,
// //                   ),
// //                   maxLines: 1,
// //                   overflow: TextOverflow.ellipsis,
// //                 ),
// //                 SizedBox(height: 4.h),
// //                 Text(
// //                   profile.subtitle,
// //                   style: GoogleFonts.tasaOrbiter(
// //                     fontSize: 10.sp,
// //                     fontWeight: FontWeight.w400,
// //                     color: Colors.black54,
// //                     height: 1.3,
// //                   ),
// //                   maxLines: 3,
// //                   overflow: TextOverflow.ellipsis,
// //                 ),
// //                 SizedBox(height: 8.h),
// //                 SizedBox(
// //                   width: double.infinity,
// //                   child: OutlinedButton(
// //                     onPressed: () {},
// //                     style: OutlinedButton.styleFrom(
// //                       backgroundColor: const Color(0xFFFCE1E6),
// //                       side: BorderSide.none,
// //                       padding: EdgeInsets.symmetric(vertical: 8.h),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(20.r),
// //                       ),
// //                     ),
// //                     child: Text(
// //                       'Connect Now',
// //                       style: GoogleFonts.tasaOrbiter(
// //                         fontSize: 11.sp,
// //                         fontWeight: FontWeight.w700,
// //                         color: AppColors.coral,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// class _MatchCard extends StatelessWidget {
//   final MatchProfile profile;

//   const _MatchCard({required this.profile});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(14.r),
//         border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
//         // boxShadow: [
//         //   BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 2)),
//         // ],
//       ),
//       clipBehavior: Clip.antiAlias,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: double.infinity,
//             height: 140.h,
//             child: _profileImage(
//               profile.image,
//               width: double.infinity,
//               height: 140.h,
//               errorIconSize: 44.sp,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(10.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   profile.name,
//                   style: GoogleFonts.tasaOrbiter(
//                     fontSize: 13.sp,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.black87,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 SizedBox(height: 4.h),
//                 Text(
//                   profile.subtitle,
//                   style: GoogleFonts.tasaOrbiter(
//                     fontSize: 10.sp,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black54,
//                     height: 1.3,
//                   ),
//                   maxLines: 3,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 SizedBox(height: 8.h),
//                 SizedBox(
//                   width: double.infinity,
//                   child: OutlinedButton(
//                     onPressed: () {},
//                     style: OutlinedButton.styleFrom(
//                       backgroundColor: AppColors.coralLight,
//                       side: BorderSide.none,
//                       padding: EdgeInsets.symmetric(vertical: 8.h),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20.r),
//                       ),
//                     ),
//                     child: Text(
//                       'Connect Now',
//                       style: GoogleFonts.tasaOrbiter(
//                         fontSize: 11.sp,
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.coral,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _QuickAction {
//   final String icon;
//   final String label;
//   final bool showBadge;
//   final int badgeCount;

//   const _QuickAction({
//     required this.icon,
//     required this.label,
//     this.showBadge = false,
//     this.badgeCount = 0,
//   });
// }

// class _NavItem {
//   final IconData icon;
//   final String label;

//   const _NavItem({required this.icon, required this.label});
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/provider/home_provider.dart';
import 'package:matrimony_app/view/subscription_plan_screen.dart';
import 'package:provider/provider.dart';
import 'package:matrimony_app/model/dashboard_model.dart' as dashboard_model;
import 'package:matrimony_app/provider/register_provider.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/app_drawer.dart';
// TODO: replace this with the actual import for your search screen
// import 'package:matrimony_app/view/search_screen.dart';

/// Renders a profile photo from either a network URL (real API data) or a
/// local asset path (fallback/sample data), with a person-icon fallback if
/// the image is missing or fails to load.
Widget _profileImage(
  String image, {
  double? width,
  double? height,
  required double errorIconSize,
  BoxFit fit = BoxFit.cover,
}) {
  final errorFallback = Container(
    width: width,
    height: height,
    color: AppColors.primaryLight,
    child: Icon(Icons.person, size: errorIconSize, color: AppColors.primary),
  );
  if (image.isEmpty) return errorFallback;
  if (image.startsWith('http')) {
    return Image.network(
      image,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => errorFallback,
    );
  }
  return Image.asset(
    image,
    width: width,
    height: height,
    fit: fit,
    errorBuilder: (_, __, ___) => errorFallback,
  );
}

/// Simple data holder for a match profile card.
class MatchProfile {
  final String name;
  final String subtitle;
  final String image;
  final String? tag; // 'NEW' / 'PREMIUM' / null

  const MatchProfile({
    required this.name,
    required this.subtitle,
    required this.image,
    this.tag,
  });
}

/// Data holder for one _buildStatsRow tile.
class _QuickAction {
  final String icon;
  final String label;
  final bool showBadge;
  final int badgeCount;

  const _QuickAction({
    required this.icon,
    required this.label,
    this.showBadge = false,
    this.badgeCount = 0,
  });
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _showProfileBanner = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().getDashboard();
    });
  }

  // ---------------- Data helpers ----------------

  List<MatchProfile> _resolveMatches(
    List<dashboard_model.DailyMatch>? apiMatches, {
    String? tag,
  }) {
    if (apiMatches == null || apiMatches.isEmpty) return const [];
    return apiMatches
        .map(
          (m) => MatchProfile(
            name: m.name ?? '',
            subtitle: _shortSubtitle(m),
            image: m.imageUrl ?? '',
            tag: tag,
          ),
        )
        .toList();
  }

  // Single-line "23 yrs · Kozhikode" style subtitle for grid/list cards.
  String _shortSubtitle(dashboard_model.DailyMatch m) {
    final parts = <String>[
      if (m.age != null) '${m.age} yrs',
      if (m.location != null && m.location!.isNotEmpty) m.location!,
    ];
    return parts.join(' · ');
  }

  // Fuller subtitle for the hero "Match of the Day" card.
  String _heroSubtitle(dashboard_model.DailyMatch m) {
    final parts = <String>[
      if (m.height != null && m.height!.isNotEmpty) m.height!,
      if (m.motherTongue != null && m.motherTongue!.isNotEmpty) m.motherTongue!,
      if (m.location != null && m.location!.isNotEmpty) m.location!,
    ];
    return parts.join(' · ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Consumer<RegisterProvider>(
        builder: (context, provider, _) {
          final customer = provider.verifyOtpModel?.customer;
          return AppDrawer(
            name: customer?.name,
            profileId: customer?.id.toString(),
            // No backend source yet for these — surfaced as placeholders in
            // the drawer UI until a "my profile"/subscription endpoint
            // exists to back them.
            // avatarUrl, profileCompletion, isVerified, activePlan, planValidTill
          );
        },
      ),
      body: SafeArea(
        child: Consumer<HomeProvider>(
          builder: (context, provider, _) {
            final dm = provider.dashboardModel;

            // "Match of the Day" carousel — swipes through New Matches.
            final newMatches = dm?.newMatches ?? const [];

            // "Suggestions for you" — sourced from Daily Matches.
            final matchesForYou = _resolveMatches(dm?.dailyMatches);

            final resolvedRecent = _resolveMatches(dm?.recentVisited);

            final unreadCount = dm?.notifications?.unreadCount ?? 0;
            final interestReceived = dm?.stats?.interestReceived ?? 0;
            final interestAccepted = dm?.stats?.interestAccepted ?? 0;
            final contactsViewed = dm?.stats?.contactsViewed ?? 0;
            final completionPercentage = dm?.profileCompletion?.percentage;

            return SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopBar(unreadCount: unreadCount),
                  SizedBox(height: 10.h,),
                  _buildProfileBar(
                    interestReceived: interestReceived,
                    interestAccepted: interestAccepted,
                    contactsViewed: contactsViewed,
                  ),
                  if (_showProfileBanner && completionPercentage != null) ...[
                    _buildProfileCompletionBanner(completionPercentage),
                    SizedBox(height: 18.h),
                  ],
                  //SizedBox(height: 16.h),

                  if (newMatches.isNotEmpty) ...[
                    _buildMatchOfTheDayCarousel(newMatches),
                    SizedBox(height: 18.h),
                  ],

                  // _buildStatsRow(
                  //   interestReceived: interestReceived,
                  //   interestAccepted: interestAccepted,
                  //   contactsViewed: contactsViewed,
                  // ),
                  //SizedBox(height: 16.h),

                  // if (_showProfileBanner && completionPercentage != null) ...[
                  //   _buildProfileCompletionBanner(completionPercentage),
                  //   SizedBox(height: 18.h),
                  // ],

                  if (matchesForYou.isNotEmpty) ...[
                    _buildSectionHeader(
                      'Suggestions for you',
                      onSeeAll: matchesForYou.length > 4
                          ? () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => _SuggestionsListScreen(
                                    matches: matchesForYou.skip(4).toList(),
                                  ),
                                ),
                              )
                          : null,
                    ),
                    SizedBox(height: 12.h),
                    _buildMatchGrid(matchesForYou.take(4).toList()),
                    SizedBox(height: 18.h),
                  ],

                  _buildPromoBanner(),
                  SizedBox(height: 18.h),

                  if (resolvedRecent.isNotEmpty) ...[
                    _buildSectionHeader('Recently visited'),
                    SizedBox(height: 8.h),
                    _buildRecentlyVisitedList(resolvedRecent),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ---------------- Top bar ----------------
  // Menu icon opens the drawer (unchanged from original), then app name,
  // then a tappable search bar that navigates to the search screen. No
  // profile icon here — that lives in the drawer instead.
  Widget _buildTopBar({int unreadCount = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Builder(
            builder: (ctx) => GestureDetector(
              onTap: () => Scaffold.of(ctx).openDrawer(),
              child: Icon(Icons.menu, size: 24.sp, color: Colors.black87),
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            'Vivah',
            style: GoogleFonts.tasaOrbiter(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.coral,
            ),
          ),
          //SizedBox(width: 12.w),
          // Expanded(
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => SearchPreferencesScreen(),
          //         ),
          //       );
          //     },
          //     child: Container(
          //       height: 38.h,
          //       padding: EdgeInsets.symmetric(horizontal: 12.w),
          //       decoration: BoxDecoration(
          //         color: const Color(0xFFF5F5F5),
          //         borderRadius: BorderRadius.circular(20.r),
          //       ),
          //       child: Row(
          //         children: [
          //           Icon(Icons.search, size: 18.sp, color: Colors.black45),
          //           SizedBox(width: 6.w),
          //           Text(
          //             'Search match',
          //             style: GoogleFonts.tasaOrbiter(
          //               fontSize: 13.sp,
          //               fontWeight: FontWeight.w400,
          //               color: Colors.black45,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // if (unreadCount > 0) SizedBox(width: 12.w),
          // if (unreadCount > 0)
          //   Stack(
          //     clipBehavior: Clip.none,
          //     children: [
          //       Icon(Icons.notifications_none, size: 24.sp, color: Colors.black87),
          //       Positioned(
          //         right: -1.w,
          //         top: -1.w,
          //         child: Container(
          //           width: 8.w,
          //           height: 8.w,
          //           decoration: const BoxDecoration(
          //             color: AppColors.coral,
          //             shape: BoxShape.circle,
          //           ),
          //         ),
          //       ),
          //     ],
            // ),
                    Spacer(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                Icons.notifications_none,
                size: 24.sp,
                color: Colors.black87,
              ),
              if (unreadCount > 0)
                Positioned(
                  right: -1.w,
                  top: -1.w,
                  child: Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: const BoxDecoration(
                      color: AppColors.coral,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

Widget _buildProfileBar({
    int interestReceived = 0,
    int interestAccepted = 0,
    int contactsViewed = 0,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.coralLight,
            // child: Icon(
            //   Icons.person,color: AppColors.coral,
            // ),
            child: Image.asset("assets/image/person2.png"),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Arun",
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                "Free Member",
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          Spacer(),
          _profileBarIcon("assets/image/supervisor_account.png", interestReceived),
          SizedBox(width: 6.w),
          _profileBarIcon("assets/image/heart_check.png", interestAccepted),
          SizedBox(width: 6.w),
          _profileBarIcon("assets/image/supervisor_account (1).png", contactsViewed),
        ],
      ),
    );
  }

  // Icon with a coral count badge overlapping its top-right corner, matching
  // the notification-style badge used elsewhere on the dashboard. Hidden
  // when the count is 0.
  Widget _profileBarIcon(String asset, int count) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(asset, height: 30),
        if (count > 0)
          Positioned(
            top: -6,
            right: -6,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              constraints: BoxConstraints(minWidth: 16.w),
              decoration: const BoxDecoration(
                color: AppColors.coral,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                '$count',
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }


  // ---------------- Match of the Day carousel ----------------
  Widget _buildMatchOfTheDayCarousel(List<dashboard_model.DailyMatch> matches) {
    return SizedBox(
      height: 250.h,
      child: PageView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) => _buildMatchOfTheDayCard(matches[index]),
      ),
    );
  }

  // ---------------- Match of the Day hero card ----------------
  Widget _buildMatchOfTheDayCard(dashboard_model.DailyMatch m) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ClipRRect(
        //borderRadius: BorderRadius.circular(20.r),
        child: SizedBox(
          height: 250.h,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              _profileImage(
                m.imageUrl ?? '',
                width: double.infinity,
                height: 250.h,
                errorIconSize: 60.sp,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.65),
                    ],
                    stops: const [0.45, 1.0],
                  ),
                ),
              ),
              Positioned(
                left: 14.w,
                right: 14.w,
                bottom: 14.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        'MATCH OF THE DAY',
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '${m.name ?? ''}${m.age != null ? ', ${m.age}' : ''}',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      _heroSubtitle(m),
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide.none,
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                            ),
                            child: Text(
                              'View profile',
                              style: GoogleFonts.tasaOrbiter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.coral,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                            ),
                            child: Text(
                              'Connect now',
                              style: GoogleFonts.tasaOrbiter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- Stats row (Interest / Accepted / Contacts) ----------------
  Widget _buildStatsRow({
    int interestReceived = 0,
    int interestAccepted = 0,
    int contactsViewed = 0,
  }) {
    final actions = [
      _QuickAction(
        icon: 'assets/image/supervisor_account.png',
        label: 'Interest\nReceived',
        showBadge: interestReceived > 0,
        badgeCount: interestReceived,
      ),
      _QuickAction(
        icon: 'assets/image/heart_check.png',
        label: 'Interest\nAccepted',
        showBadge: false,
        badgeCount: interestAccepted,
      ),
      _QuickAction(
        icon: 'assets/image/supervisor_account (1).png',
        label: 'Contacts\nViewed',
        showBadge: false,
        badgeCount: contactsViewed,
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: actions
            .map(
              (a) => Expanded(
                child: Container(
                  height: 100.h,
                  width: 113.w,
                  margin: EdgeInsets.only(right: a == actions.last ? 0 : 10.w),
                  padding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE8EC),
                    border: Border.all(color: AppColors.coral),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(a.icon, width: 32.w, height: 30.w),
                          SizedBox(height: 10.h),
                          Text(
                            a.label,
                            style: GoogleFonts.tasaOrbiter(
                              fontSize: 12.sp,
                              //fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              height: 1.25,
                            ),
                          ),
                        ],
                      ),
                      if (a.showBadge)
                        Positioned(
                          top: -6.h,
                          right: -2.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.coral,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${a.badgeCount}',
                              style: GoogleFonts.tasaOrbiter(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  // ---------------- Slim profile completion banner ----------------
  Widget _buildProfileCompletionBanner(int percentage) {
    final pct = percentage.clamp(0, 100);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: 10.w,
        ),
        decoration: BoxDecoration(

         // border: Border.all(color: AppColors.coral),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: LinearProgressIndicator(
                value: pct / 100,
                minHeight: 5.h,
                backgroundColor: AppColors.coralLight,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.coral),
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Profile $percentage% complete',
                          style: GoogleFonts.tasaOrbiter(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: ' — finish for better matches',
                          style: GoogleFonts.tasaOrbiter(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => _showProfileBanner = false),
                  child: Icon(Icons.close, size: 16.sp, color: Colors.black38),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- Section header ----------------
  Widget _buildSectionHeader(String title, {VoidCallback? onSeeAll}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.tasaOrbiter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          InkWell(
            onTap: onSeeAll,
            child: Row(
              children: [
                Text(
                  'See all',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.coral,
                  ),
                ),
                Icon(Icons.chevron_right, size: 16.sp, color: AppColors.coral),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- 2-column "Matches for you" grid ----------------
  Widget _buildMatchGrid(List<MatchProfile> matches) {
    final rows = <Widget>[];
    for (int i = 0; i < matches.length; i += 2) {
      final hasSecond = i + 1 < matches.length;
      rows.add(
        Padding(
          padding: EdgeInsets.only(bottom: i + 2 < matches.length ? 12.h : 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _MatchGridCard(profile: matches[i])),
              SizedBox(width: 10.w),
              Expanded(
                child: hasSecond
                    ? _MatchGridCard(profile: matches[i + 1])
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(children: rows),
    );
  }

  // ---------------- Promo banner ----------------
  Widget _buildPromoBanner() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.coral,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get closer to your perfect match',
                    style: GoogleFonts.tasaOrbiter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.25,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Upgrade for unlimited connections',
                    style: GoogleFonts.tasaOrbiter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SubscriptionPlanScreen()),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'Upgrade',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.coral,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- Recently visited list ----------------
  Widget _buildRecentlyVisitedList(List<MatchProfile> matches) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: matches
            .map(
              (m) => Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Container(
                  height: 60.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                  decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                  child: Row(
                    children: [
                      Container(
                        height: 40.h,
                        //clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: _profileImage(
                          m.image,
                          width: 44.w,
                          height: 44.w,
                          errorIconSize: 20.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              m.name,
                              style: GoogleFonts.tasaOrbiter(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              m.subtitle,
                              style: GoogleFonts.tasaOrbiter(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

/// Full list of "Suggestions for you" profiles beyond the 4 shown on the
/// dashboard — reached via the section header's "See all" link.
class _SuggestionsListScreen extends StatelessWidget {
  final List<MatchProfile> matches;

  const _SuggestionsListScreen({required this.matches});

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (int i = 0; i < matches.length; i += 2) {
      final hasSecond = i + 1 < matches.length;
      rows.add(
        Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _MatchGridCard(profile: matches[i])),
              SizedBox(width: 10.w),
              Expanded(
                child: hasSecond
                    ? _MatchGridCard(profile: matches[i + 1])
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: Text(
          'Suggestions for you',
          style: GoogleFonts.tasaOrbiter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(children: rows),
        ),
      ),
    );
  }
}

class _MatchGridCard extends StatelessWidget {
  final MatchProfile profile;

  const _MatchGridCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 130.h,
                child: _profileImage(
                  profile.image,
                  width: double.infinity,
                  height: 130.h,
                  errorIconSize: 40.sp,
                ),
              ),
              if (profile.tag != null)
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: AppColors.coral,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      profile.tag!,
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  profile.subtitle,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// TODO: delete this placeholder once you swap in your real search screen
// import + MaterialPageRoute builder above.
class _SearchScreenPlaceholder extends StatelessWidget {
  const _SearchScreenPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: const Center(child: Text('Search screen goes here')),
    );
  }
}