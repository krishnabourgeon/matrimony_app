// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // // import 'package:google_fonts/google_fonts.dart';
// // // import 'package:matrimony_app/provider/home_provider.dart';
// // // import 'package:matrimony_app/view/subscription_plan_screen.dart';
// // // import 'package:provider/provider.dart';
// // // import 'package:matrimony_app/model/dashboard_model.dart' as dashboard_model;
// // // import 'package:matrimony_app/provider/register_provider.dart';
// // // import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// // // import 'package:matrimony_app/view/custom_widgets/app_drawer.dart';
// // // // TODO: replace this with the actual import for your search screen
// // // // import 'package:matrimony_app/view/search_screen.dart';

// // // /// Renders a profile photo from either a network URL (real API data) or a
// // // /// local asset path (fallback/sample data), with a person-icon fallback if
// // // /// the image is missing or fails to load.
// // // Widget _profileImage(
// // //   String image, {
// // //   double? width,
// // //   double? height,
// // //   required double errorIconSize,
// // //   BoxFit fit = BoxFit.cover,
// // // }) {
// // //   final errorFallback = Container(
// // //     width: width,
// // //     height: height,
// // //     color: AppColors.primaryLight,
// // //     child: Icon(Icons.person, size: errorIconSize, color: AppColors.primary),
// // //   );
// // //   if (image.isEmpty) return errorFallback;
// // //   if (image.startsWith('http')) {
// // //     return Image.network(
// // //       image,
// // //       width: width,
// // //       height: height,
// // //       fit: fit,
// // //       errorBuilder: (_, __, ___) => errorFallback,
// // //     );
// // //   }
// // //   return Image.asset(
// // //     image,
// // //     width: width,
// // //     height: height,
// // //     fit: fit,
// // //     errorBuilder: (_, __, ___) => errorFallback,
// // //   );
// // // }

// // // /// Simple data holder for a match profile card.
// // // class MatchProfile {
// // //   final String name;
// // //   final String subtitle;
// // //   final String image;
// // //   final String? tag; // 'NEW' / 'PREMIUM' / null

// // //   const MatchProfile({
// // //     required this.name,
// // //     required this.subtitle,
// // //     required this.image,
// // //     this.tag,
// // //   });
// // // }

// // // /// Data holder for one _buildStatsRow tile.
// // // class _QuickAction {
// // //   final String icon;
// // //   final String label;
// // //   final bool showBadge;
// // //   final int badgeCount;

// // //   const _QuickAction({
// // //     required this.icon,
// // //     required this.label,
// // //     this.showBadge = false,
// // //     this.badgeCount = 0,
// // //   });
// // // }

// // // class DashboardScreen extends StatefulWidget {
// // //   const DashboardScreen({super.key});

// // //   @override
// // //   State<DashboardScreen> createState() => _DashboardScreenState();
// // // }

// // // class _DashboardScreenState extends State<DashboardScreen> {
// // //   bool _showProfileBanner = true;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // //       context.read<HomeProvider>().getDashboard();
// // //     });
// // //   }

// // //   // ---------------- Data helpers ----------------

// // //   List<MatchProfile> _resolveMatches(
// // //     List<dashboard_model.DailyMatch>? apiMatches, {
// // //     String? tag,
// // //   }) {
// // //     if (apiMatches == null || apiMatches.isEmpty) return const [];
// // //     return apiMatches
// // //         .map(
// // //           (m) => MatchProfile(
// // //             name: m.name ?? '',
// // //             subtitle: _shortSubtitle(m),
// // //             image: m.imageUrl ?? '',
// // //             tag: tag,
// // //           ),
// // //         )
// // //         .toList();
// // //   }

// // //   // Single-line "23 yrs · Kozhikode" style subtitle for grid/list cards.
// // //   String _shortSubtitle(dashboard_model.DailyMatch m) {
// // //     final parts = <String>[
// // //       if (m.age != null) '${m.age} yrs',
// // //       if (m.location != null && m.location!.isNotEmpty) m.location!,
// // //     ];
// // //     return parts.join(' · ');
// // //   }

// // //   // Fuller subtitle for the hero "Match of the Day" card.
// // //   String _heroSubtitle(dashboard_model.DailyMatch m) {
// // //     final parts = <String>[
// // //       if (m.height != null && m.height!.isNotEmpty) m.height!,
// // //       if (m.motherTongue != null && m.motherTongue!.isNotEmpty) m.motherTongue!,
// // //       if (m.location != null && m.location!.isNotEmpty) m.location!,
// // //     ];
// // //     return parts.join(' · ');
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       drawer: Consumer<RegisterProvider>(
// // //         builder: (context, provider, _) {
// // //           final customer = provider.verifyOtpModel?.customer;
// // //           return AppDrawer(
// // //             name: customer?.name,
// // //             profileId: customer?.id.toString(),
// // //             // No backend source yet for these — surfaced as placeholders in
// // //             // the drawer UI until a "my profile"/subscription endpoint
// // //             // exists to back them.
// // //             // avatarUrl, profileCompletion, isVerified, activePlan, planValidTill
// // //           );
// // //         },
// // //       ),
// // //       body: SafeArea(
// // //         child: Consumer<HomeProvider>(
// // //           builder: (context, provider, _) {
// // //             final dm = provider.dashboardModel;

// // //             // "Match of the Day" carousel — swipes through New Matches.
// // //             final newMatches = dm?.newMatches ?? const [];

// // //             // "Suggestions for you" — sourced from Daily Matches.
// // //             final matchesForYou = _resolveMatches(dm?.dailyMatches);

// // //             final resolvedRecent = _resolveMatches(dm?.recentVisited);

// // //             final unreadCount = dm?.notifications?.unreadCount ?? 0;
// // //             final interestReceived = dm?.stats?.interestReceived ?? 0;
// // //             final interestAccepted = dm?.stats?.interestAccepted ?? 0;
// // //             final contactsViewed = dm?.stats?.contactsViewed ?? 0;
// // //             final completionPercentage = dm?.profileCompletion?.percentage;

// // //             return SingleChildScrollView(
// // //               padding: EdgeInsets.only(bottom: 24.h),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   _buildTopBar(unreadCount: unreadCount),
// // //                   SizedBox(height: 10.h,),
// // //                   _buildProfileBar(
// // //                     interestReceived: interestReceived,
// // //                     interestAccepted: interestAccepted,
// // //                     contactsViewed: contactsViewed,
// // //                   ),
// // //                   if (_showProfileBanner && completionPercentage != null) ...[
// // //                     _buildProfileCompletionBanner(completionPercentage),
// // //                     SizedBox(height: 18.h),
// // //                   ],
// // //                   //SizedBox(height: 16.h),

// // //                   if (newMatches.isNotEmpty) ...[
// // //                     _buildMatchOfTheDayCarousel(newMatches),
// // //                     SizedBox(height: 18.h),
// // //                   ],

// // //                   // _buildStatsRow(
// // //                   //   interestReceived: interestReceived,
// // //                   //   interestAccepted: interestAccepted,
// // //                   //   contactsViewed: contactsViewed,
// // //                   // ),
// // //                   //SizedBox(height: 16.h),

// // //                   // if (_showProfileBanner && completionPercentage != null) ...[
// // //                   //   _buildProfileCompletionBanner(completionPercentage),
// // //                   //   SizedBox(height: 18.h),
// // //                   // ],

// // //                   if (matchesForYou.isNotEmpty) ...[
// // //                     _buildSectionHeader(
// // //                       'Suggestions for you',
// // //                       onSeeAll: matchesForYou.length > 4
// // //                           ? () => Navigator.push(
// // //                                 context,
// // //                                 MaterialPageRoute(
// // //                                   builder: (_) => _SuggestionsListScreen(
// // //                                     matches: matchesForYou.skip(4).toList(),
// // //                                   ),
// // //                                 ),
// // //                               )
// // //                           : null,
// // //                     ),
// // //                     SizedBox(height: 12.h),
// // //                     _buildMatchGrid(matchesForYou.take(4).toList()),
// // //                     SizedBox(height: 18.h),
// // //                   ],

// // //                   _buildPromoBanner(),
// // //                   SizedBox(height: 18.h),

// // //                   if (resolvedRecent.isNotEmpty) ...[
// // //                     _buildSectionHeader('Recently visited'),
// // //                     SizedBox(height: 8.h),
// // //                     _buildRecentlyVisitedList(resolvedRecent),
// // //                   ],
// // //                 ],
// // //               ),
// // //             );
// // //           },
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   // ---------------- Top bar ----------------
// // //   // Menu icon opens the drawer (unchanged from original), then app name,
// // //   // then a tappable search bar that navigates to the search screen. No
// // //   // profile icon here — that lives in the drawer instead.
// // //   Widget _buildTopBar({int unreadCount = 0}) {
// // //     return Padding(
// // //       padding: EdgeInsets.symmetric(horizontal: 16.w),
// // //       child: Row(
// // //         children: [
// // //           Builder(
// // //             builder: (ctx) => GestureDetector(
// // //               onTap: () => Scaffold.of(ctx).openDrawer(),
// // //               child: Icon(Icons.menu, size: 24.sp, color: Colors.black87),
// // //             ),
// // //           ),
// // //           SizedBox(width: 10.w),
// // //           Text(
// // //             'Vivah',
// // //             style: GoogleFonts.tasaOrbiter(
// // //               fontSize: 22.sp,
// // //               fontWeight: FontWeight.w700,
// // //               color: AppColors.primary,
// // //             ),
// // //           ),
// // //           //SizedBox(width: 12.w),
// // //           // Expanded(
// // //           //   child: GestureDetector(
// // //           //     onTap: () {
// // //           //       Navigator.push(
// // //           //         context,
// // //           //         MaterialPageRoute(
// // //           //           builder: (context) => SearchPreferencesScreen(),
// // //           //         ),
// // //           //       );
// // //           //     },
// // //           //     child: Container(
// // //           //       height: 38.h,
// // //           //       padding: EdgeInsets.symmetric(horizontal: 12.w),
// // //           //       decoration: BoxDecoration(
// // //           //         color: const Color(0xFFF5F5F5),
// // //           //         borderRadius: BorderRadius.circular(20.r),
// // //           //       ),
// // //           //       child: Row(
// // //           //         children: [
// // //           //           Icon(Icons.search, size: 18.sp, color: Colors.black45),
// // //           //           SizedBox(width: 6.w),
// // //           //           Text(
// // //           //             'Search match',
// // //           //             style: GoogleFonts.tasaOrbiter(
// // //           //               fontSize: 13.sp,
// // //           //               fontWeight: FontWeight.w400,
// // //           //               color: Colors.black45,
// // //           //             ),
// // //           //           ),
// // //           //         ],
// // //           //       ),
// // //           //     ),
// // //           //   ),
// // //           // ),
// // //           // if (unreadCount > 0) SizedBox(width: 12.w),
// // //           // if (unreadCount > 0)
// // //           //   Stack(
// // //           //     clipBehavior: Clip.none,
// // //           //     children: [
// // //           //       Icon(Icons.notifications_none, size: 24.sp, color: Colors.black87),
// // //           //       Positioned(
// // //           //         right: -1.w,
// // //           //         top: -1.w,
// // //           //         child: Container(
// // //           //           width: 8.w,
// // //           //           height: 8.w,
// // //           //           decoration: const BoxDecoration(
// // //           //             color: AppColors.primary,
// // //           //             shape: BoxShape.circle,
// // //           //           ),
// // //           //         ),
// // //           //       ),
// // //           //     ],
// // //             // ),
// // //                     Spacer(),
// // //           Stack(
// // //             clipBehavior: Clip.none,
// // //             children: [
// // //               Icon(
// // //                 Icons.notifications_none,
// // //                 size: 24.sp,
// // //                 color: Colors.black87,
// // //               ),
// // //               if (unreadCount > 0)
// // //                 Positioned(
// // //                   right: -1.w,
// // //                   top: -1.w,
// // //                   child: Container(
// // //                     width: 8.w,
// // //                     height: 8.w,
// // //                     decoration: const BoxDecoration(
// // //                       color: AppColors.primary,
// // //                       shape: BoxShape.circle,
// // //                     ),
// // //                   ),
// // //                 ),
// // //             ],
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // // Widget _buildProfileBar({
// // //     int interestReceived = 0,
// // //     int interestAccepted = 0,
// // //     int contactsViewed = 0,
// // //   }) {
// // //     return Padding(
// // //       padding: EdgeInsets.symmetric(horizontal: 16.w),
// // //       child: Row(
// // //         children: [
// // //           CircleAvatar(
// // //             radius: 30,
// // //             backgroundColor: AppColors.primaryLight,
// // //             // child: Icon(
// // //             //   Icons.person,color: AppColors.primary,
// // //             // ),
// // //             child: Image.asset("assets/image/person2.png"),
// // //           ),
// // //           SizedBox(width: 8.w),
// // //           Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               Text(
// // //                 "Arun",
// // //                 style: GoogleFonts.tasaOrbiter(
// // //                   fontSize: 18.sp,
// // //                   fontWeight: FontWeight.w600,
// // //                   color: AppColors.textPrimary,
// // //                 ),
// // //               ),
// // //               Text(
// // //                 "Free Member",
// // //                 style: GoogleFonts.tasaOrbiter(
// // //                   fontSize: 14.sp,
// // //                   fontWeight: FontWeight.w500,
// // //                   color: AppColors.textPrimary,
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //           Spacer(),
// // //           _profileBarIcon("assets/image/supervisor_account.png", interestReceived),
// // //           SizedBox(width: 6.w),
// // //           _profileBarIcon("assets/image/heart_check.png", interestAccepted),
// // //           SizedBox(width: 6.w),
// // //           _profileBarIcon("assets/image/supervisor_account (1).png", contactsViewed),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   // Icon with a primary count badge overlapping its top-right corner, matching
// // //   // the notification-style badge used elsewhere on the dashboard. Hidden
// // //   // when the count is 0.
// // //   Widget _profileBarIcon(String asset, int count) {
// // //     return Stack(
// // //       clipBehavior: Clip.none,
// // //       children: [
// // //         Image.asset(asset, height: 30),
// // //         if (count > 0)
// // //           Positioned(
// // //             top: -6,
// // //             right: -6,
// // //             child: Container(
// // //               padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
// // //               constraints: BoxConstraints(minWidth: 16.w),
// // //               decoration: const BoxDecoration(
// // //                 color: AppColors.primary,
// // //                 shape: BoxShape.circle,
// // //               ),
// // //               alignment: Alignment.center,
// // //               child: Text(
// // //                 '$count',
// // //                 style: GoogleFonts.tasaOrbiter(
// // //                   fontSize: 9.sp,
// // //                   fontWeight: FontWeight.w700,
// // //                   color: Colors.white,
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //       ],
// // //     );
// // //   }

// // //   // ---------------- Match of the Day carousel ----------------
// // //   Widget _buildMatchOfTheDayCarousel(List<dashboard_model.DailyMatch> matches) {
// // //     return SizedBox(
// // //       height: 250.h,
// // //       child: PageView.builder(
// // //         itemCount: matches.length,
// // //         itemBuilder: (context, index) => _buildMatchOfTheDayCard(matches[index]),
// // //       ),
// // //     );
// // //   }

// // //   // ---------------- Match of the Day hero card ----------------
// // //   Widget _buildMatchOfTheDayCard(dashboard_model.DailyMatch m) {
// // //     return Padding(
// // //       padding: EdgeInsets.symmetric(horizontal: 16.w),
// // //       child: ClipRRect(
// // //         //borderRadius: BorderRadius.circular(20.r),
// // //         child: SizedBox(
// // //           height: 250.h,
// // //           width: double.infinity,
// // //           child: Stack(
// // //             fit: StackFit.expand,
// // //             children: [
// // //               _profileImage(
// // //                 m.imageUrl ?? '',
// // //                 width: double.infinity,
// // //                 height: 250.h,
// // //                 errorIconSize: 60.sp,
// // //               ),
// // //               Container(
// // //                 decoration: BoxDecoration(
// // //                   gradient: LinearGradient(
// // //                     begin: Alignment.topCenter,
// // //                     end: Alignment.bottomCenter,
// // //                     colors: [
// // //                       Colors.transparent,
// // //                       Colors.black.withOpacity(0.65),
// // //                     ],
// // //                     stops: const [0.45, 1.0],
// // //                   ),
// // //                 ),
// // //               ),
// // //               Positioned(
// // //                 left: 14.w,
// // //                 right: 14.w,
// // //                 bottom: 14.h,
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     Container(
// // //                       padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
// // //                       decoration: BoxDecoration(
// // //                         color: Colors.white.withOpacity(0.2),
// // //                         borderRadius: BorderRadius.circular(6.r),
// // //                       ),
// // //                       child: Text(
// // //                         'MATCH OF THE DAY',
// // //                         style: GoogleFonts.tasaOrbiter(
// // //                           fontSize: 10.sp,
// // //                           fontWeight: FontWeight.w700,
// // //                           color: Colors.white,
// // //                           letterSpacing: 0.5,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                     SizedBox(height: 8.h),
// // //                     Text(
// // //                       '${m.name ?? ''}${m.age != null ? ', ${m.age}' : ''}',
// // //                       style: GoogleFonts.tasaOrbiter(
// // //                         fontSize: 22.sp,
// // //                         fontWeight: FontWeight.w700,
// // //                         color: Colors.white,
// // //                       ),
// // //                     ),
// // //                     SizedBox(height: 2.h),
// // //                     Text(
// // //                       _heroSubtitle(m),
// // //                       style: GoogleFonts.tasaOrbiter(
// // //                         fontSize: 12.sp,
// // //                         fontWeight: FontWeight.w400,
// // //                         color: Colors.white.withOpacity(0.9),
// // //                       ),
// // //                     ),
// // //                     SizedBox(height: 12.h),
// // //                     Row(
// // //                       children: [
// // //                         Expanded(
// // //                           child: OutlinedButton(
// // //                             onPressed: () {},
// // //                             style: OutlinedButton.styleFrom(
// // //                               backgroundColor: Colors.white,
// // //                               side: BorderSide.none,
// // //                               padding: EdgeInsets.symmetric(vertical: 10.h),
// // //                               shape: RoundedRectangleBorder(
// // //                                 borderRadius: BorderRadius.circular(24.r),
// // //                               ),
// // //                             ),
// // //                             child: Text(
// // //                               'View profile',
// // //                               style: GoogleFonts.tasaOrbiter(
// // //                                 fontSize: 12.sp,
// // //                                 fontWeight: FontWeight.w700,
// // //                                 color: Colors.black87,
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         SizedBox(width: 10.w),
// // //                         Expanded(
// // //                           child: ElevatedButton(
// // //                             onPressed: () {

// // //                             },
// // //                             style: ElevatedButton.styleFrom(
// // //                               backgroundColor: AppColors.primary,
// // //                               elevation: 0,
// // //                               padding: EdgeInsets.symmetric(vertical: 10.h),
// // //                               shape: RoundedRectangleBorder(
// // //                                 borderRadius: BorderRadius.circular(24.r),
// // //                               ),
// // //                             ),
// // //                             child: Text(
// // //                               'Connect now',
// // //                               style: GoogleFonts.tasaOrbiter(
// // //                                 fontSize: 12.sp,
// // //                                 fontWeight: FontWeight.w700,
// // //                                 color: Colors.white,
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   // ---------------- Stats row (Interest / Accepted / Contacts) ----------------
// // //   Widget _buildStatsRow({
// // //     int interestReceived = 0,
// // //     int interestAccepted = 0,
// // //     int contactsViewed = 0,
// // //   }) {
// // //     final actions = [
// // //       _QuickAction(
// // //         icon: 'assets/image/supervisor_account.png',
// // //         label: 'Interest\nReceived',
// // //         showBadge: interestReceived > 0,
// // //         badgeCount: interestReceived,
// // //       ),
// // //       _QuickAction(
// // //         icon: 'assets/image/heart_check.png',
// // //         label: 'Interest\nAccepted',
// // //         showBadge: false,
// // //         badgeCount: interestAccepted,
// // //       ),
// // //       _QuickAction(
// // //         icon: 'assets/image/supervisor_account (1).png',
// // //         label: 'Contacts\nViewed',
// // //         showBadge: false,
// // //         badgeCount: contactsViewed,
// // //       ),
// // //     ];

// // //     return Padding(
// // //       padding: EdgeInsets.symmetric(horizontal: 16.w),
// // //       child: Row(
// // //         children: actions
// // //             .map(
// // //               (a) => Expanded(
// // //                 child: Container(
// // //                   height: 100.h,
// // //                   width: 113.w,
// // //                   margin: EdgeInsets.only(right: a == actions.last ? 0 : 10.w),
// // //                   padding: EdgeInsets.symmetric(
// // //                     vertical: 14.h,
// // //                     horizontal: 10.w,
// // //                   ),
// // //                   decoration: BoxDecoration(
// // //                     color: const Color(0xFFFFE8EC),
// // //                     border: Border.all(color: AppColors.primary),
// // //                     borderRadius: BorderRadius.circular(14.r),
// // //                   ),
// // //                   child: Stack(
// // //                     clipBehavior: Clip.none,
// // //                     children: [
// // //                       Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //                           Image.asset(a.icon, width: 32.w, height: 30.w),
// // //                           SizedBox(height: 10.h),
// // //                           Text(
// // //                             a.label,
// // //                             style: GoogleFonts.tasaOrbiter(
// // //                               fontSize: 12.sp,
// // //                               //fontWeight: FontWeight.w600,
// // //                               color: Colors.black87,
// // //                               height: 1.25,
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                       if (a.showBadge)
// // //                         Positioned(
// // //                           top: -6.h,
// // //                           right: -2.w,
// // //                           child: Container(
// // //                             padding: EdgeInsets.symmetric(
// // //                               horizontal: 6.w,
// // //                               vertical: 2.h,
// // //                             ),
// // //                             decoration: BoxDecoration(
// // //                               color: AppColors.primary,
// // //                               shape: BoxShape.circle,
// // //                             ),
// // //                             child: Text(
// // //                               '${a.badgeCount}',
// // //                               style: GoogleFonts.tasaOrbiter(
// // //                                 fontSize: 9.sp,
// // //                                 fontWeight: FontWeight.w700,
// // //                                 color: Colors.white,
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //             )
// // //             .toList(),
// // //       ),
// // //     );
// // //   }

// // //   // ---------------- Slim profile completion banner ----------------
// // //   Widget _buildProfileCompletionBanner(int percentage) {
// // //     final pct = percentage.clamp(0, 100);
// // //     return Padding(
// // //       padding: EdgeInsets.symmetric(horizontal: 16.w),
// // //       child: Container(
// // //         padding: EdgeInsets.symmetric(
// // //           vertical: 14.h,
// // //           horizontal: 10.w,
// // //         ),
// // //         decoration: BoxDecoration(

// // //          // border: Border.all(color: AppColors.primary),
// // //           borderRadius: BorderRadius.circular(14.r),
// // //         ),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             ClipRRect(
// // //               borderRadius: BorderRadius.circular(4.r),
// // //               child: LinearProgressIndicator(
// // //                 value: pct / 100,
// // //                 minHeight: 5.h,
// // //                 backgroundColor: AppColors.primaryLight,
// // //                 valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
// // //               ),
// // //             ),
// // //             SizedBox(height: 8.h),
// // //             Row(
// // //               children: [
// // //                 Expanded(
// // //                   child: Text.rich(
// // //                     TextSpan(
// // //                       children: [
// // //                         TextSpan(
// // //                           text: 'Profile $percentage% complete',
// // //                           style: GoogleFonts.tasaOrbiter(
// // //                             fontSize: 13.sp,
// // //                             fontWeight: FontWeight.w700,
// // //                             color: Colors.black87,
// // //                           ),
// // //                         ),
// // //                         TextSpan(
// // //                           text: ' — finish for better matches',
// // //                           style: GoogleFonts.tasaOrbiter(
// // //                             fontSize: 13.sp,
// // //                             fontWeight: FontWeight.w400,
// // //                             color: Colors.black54,
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 GestureDetector(
// // //                   onTap: () => setState(() => _showProfileBanner = false),
// // //                   child: Icon(Icons.close, size: 16.sp, color: Colors.black38),
// // //                 ),
// // //               ],
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   // ---------------- Section header ----------------
// // //   Widget _buildSectionHeader(String title, {VoidCallback? onSeeAll}) {
// // //     return Padding(
// // //       padding: EdgeInsets.symmetric(horizontal: 16.w),
// // //       child: Row(
// // //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //         children: [
// // //           Text(
// // //             title,
// // //             style: GoogleFonts.tasaOrbiter(
// // //               fontSize: 16.sp,
// // //               fontWeight: FontWeight.w700,
// // //               color: Colors.black87,
// // //             ),
// // //           ),
// // //           InkWell(
// // //             onTap: onSeeAll,
// // //             child: Row(
// // //               children: [
// // //                 Text(
// // //                   'See all',
// // //                   style: GoogleFonts.tasaOrbiter(
// // //                     fontSize: 12.sp,
// // //                     fontWeight: FontWeight.w600,
// // //                     color: AppColors.primary,
// // //                   ),
// // //                 ),
// // //                 Icon(Icons.chevron_right, size: 16.sp, color: AppColors.primary),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   // ---------------- 2-column "Matches for you" grid ----------------
// // //   Widget _buildMatchGrid(List<MatchProfile> matches) {
// // //     final rows = <Widget>[];
// // //     for (int i = 0; i < matches.length; i += 2) {
// // //       final hasSecond = i + 1 < matches.length;
// // //       rows.add(
// // //         Padding(
// // //           padding: EdgeInsets.only(bottom: i + 2 < matches.length ? 12.h : 0),
// // //           child: Row(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               Expanded(child: _MatchGridCard(profile: matches[i])),
// // //               SizedBox(width: 10.w),
// // //               Expanded(
// // //                 child: hasSecond
// // //                     ? _MatchGridCard(profile: matches[i + 1])
// // //                     : const SizedBox.shrink(),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       );
// // //     }
// // //     return Padding(
// // //       padding: EdgeInsets.symmetric(horizontal: 16.w),
// // //       child: Column(children: rows),
// // //     );
// // //   }

// // //   // ---------------- Promo banner ----------------
// // //   Widget _buildPromoBanner() {
// // //     return Padding(
// // //       padding: EdgeInsets.symmetric(horizontal: 16.w),
// // //       child: Container(
// // //         padding: EdgeInsets.all(16.w),
// // //         decoration: BoxDecoration(
// // //           color: AppColors.primary,
// // //           borderRadius: BorderRadius.circular(16.r),
// // //         ),
// // //         child: Row(
// // //           children: [
// // //             Expanded(
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   Text(
// // //                     'Get closer to your perfect match',
// // //                     style: GoogleFonts.tasaOrbiter(
// // //                       fontSize: 16.sp,
// // //                       fontWeight: FontWeight.w700,
// // //                       color: Colors.white,
// // //                       height: 1.25,
// // //                     ),
// // //                   ),
// // //                   SizedBox(height: 4.h),
// // //                   Text(
// // //                     'Upgrade for unlimited connections',
// // //                     style: GoogleFonts.tasaOrbiter(
// // //                       fontSize: 12.sp,
// // //                       fontWeight: FontWeight.w400,
// // //                       color: Colors.white.withOpacity(0.9),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //             SizedBox(width: 10.w),
// // //             InkWell(
// // //               onTap: () {
// // //                 Navigator.push(
// // //                   context,
// // //                   MaterialPageRoute(builder: (_) => const SubscriptionPlanScreen()),
// // //                 );
// // //               },
// // //               child: Container(
// // //                 padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
// // //                 decoration: BoxDecoration(
// // //                   color: Colors.white,
// // //                   borderRadius: BorderRadius.circular(20.r),
// // //                 ),
// // //                 child: Text(
// // //                   'Upgrade',
// // //                   style: GoogleFonts.tasaOrbiter(
// // //                     fontSize: 13.sp,
// // //                     fontWeight: FontWeight.w700,
// // //                     color: AppColors.primary,
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   // ---------------- Recently visited list ----------------
// // //   Widget _buildRecentlyVisitedList(List<MatchProfile> matches) {
// // //     return Padding(
// // //       padding: EdgeInsets.symmetric(horizontal: 16.w),
// // //       child: Column(
// // //         children: matches
// // //             .map(
// // //               (m) => Padding(
// // //                 padding: EdgeInsets.only(bottom: 10.h),
// // //                 child: Container(
// // //                   height: 60.h,
// // //                   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
// // //                   decoration: BoxDecoration(
// // //                   border: Border.all(color: Colors.black26),
// // //                   borderRadius: BorderRadius.circular(14.r),
// // //                 ),
// // //                   child: Row(
// // //                     children: [
// // //                       Container(
// // //                         height: 40.h,
// // //                         //clipBehavior: Clip.antiAlias,
// // //                         decoration: BoxDecoration(
// // //                                                     borderRadius: BorderRadius.circular(14.r),
// // //                         ),
// // //                         child: _profileImage(
// // //                           m.image,
// // //                           width: 44.w,
// // //                           height: 44.w,
// // //                           errorIconSize: 20.sp,
// // //                         ),
// // //                       ),
// // //                       SizedBox(width: 12.w),
// // //                       Expanded(
// // //                         child: Column(
// // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // //                           children: [
// // //                             Text(
// // //                               m.name,
// // //                               style: GoogleFonts.tasaOrbiter(
// // //                                 fontSize: 13.sp,
// // //                                 fontWeight: FontWeight.w600,
// // //                                 color: Colors.black87,
// // //                               ),
// // //                               maxLines: 1,
// // //                               overflow: TextOverflow.ellipsis,
// // //                             ),
// // //                             Text(
// // //                               m.subtitle,
// // //                               style: GoogleFonts.tasaOrbiter(
// // //                                 fontSize: 11.sp,
// // //                                 fontWeight: FontWeight.w400,
// // //                                 color: Colors.black54,
// // //                               ),
// // //                               maxLines: 1,
// // //                               overflow: TextOverflow.ellipsis,
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //             )
// // //             .toList(),
// // //       ),
// // //     );
// // //   }
// // // }

// // // /// Full list of "Suggestions for you" profiles beyond the 4 shown on the
// // // /// dashboard — reached via the section header's "See all" link.
// // // class _SuggestionsListScreen extends StatelessWidget {
// // //   final List<MatchProfile> matches;

// // //   const _SuggestionsListScreen({required this.matches});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final rows = <Widget>[];
// // //     for (int i = 0; i < matches.length; i += 2) {
// // //       final hasSecond = i + 1 < matches.length;
// // //       rows.add(
// // //         Padding(
// // //           padding: EdgeInsets.only(bottom: 12.h),
// // //           child: Row(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               Expanded(child: _MatchGridCard(profile: matches[i])),
// // //               SizedBox(width: 10.w),
// // //               Expanded(
// // //                 child: hasSecond
// // //                     ? _MatchGridCard(profile: matches[i + 1])
// // //                     : const SizedBox.shrink(),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       );
// // //     }
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.white,
// // //         elevation: 0,
// // //         iconTheme: const IconThemeData(color: Colors.black87),
// // //         title: Text(
// // //           'Suggestions for you',
// // //           style: GoogleFonts.tasaOrbiter(
// // //             fontSize: 16.sp,
// // //             fontWeight: FontWeight.w700,
// // //             color: Colors.black87,
// // //           ),
// // //         ),
// // //       ),
// // //       body: SafeArea(
// // //         child: SingleChildScrollView(
// // //           padding: EdgeInsets.all(16.w),
// // //           child: Column(children: rows),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _MatchGridCard extends StatelessWidget {
// // //   final MatchProfile profile;

// // //   const _MatchGridCard({required this.profile});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       decoration: BoxDecoration(
// // //         //borderRadius: BorderRadius.circular(14.r),
// // //         border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
// // //       ),
// // //       clipBehavior: Clip.antiAlias,
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Stack(
// // //             children: [
// // //               SizedBox(
// // //                 width: double.infinity,
// // //                 height: 130.h,
// // //                 child: _profileImage(
// // //                   profile.image,
// // //                   width: double.infinity,
// // //                   height: 130.h,
// // //                   errorIconSize: 40.sp,
// // //                 ),
// // //               ),
// // //               if (profile.tag != null)
// // //                 Positioned(
// // //                   top: 8.h,
// // //                   left: 8.w,
// // //                   child: Container(
// // //                     padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
// // //                     decoration: BoxDecoration(
// // //                       color: AppColors.primary,
// // //                       borderRadius: BorderRadius.circular(6.r),
// // //                     ),
// // //                     child: Text(
// // //                       profile.tag!,
// // //                       style: GoogleFonts.tasaOrbiter(
// // //                         fontSize: 9.sp,
// // //                         fontWeight: FontWeight.w700,
// // //                         color: Colors.white,
// // //                         letterSpacing: 0.4,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //             ],
// // //           ),
// // //           Padding(
// // //             padding: EdgeInsets.all(10.w),
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Text(
// // //                   profile.name,
// // //                   style: GoogleFonts.tasaOrbiter(
// // //                     fontSize: 13.sp,
// // //                     fontWeight: FontWeight.w700,
// // //                     color: Colors.black87,
// // //                   ),
// // //                   maxLines: 1,
// // //                   overflow: TextOverflow.ellipsis,
// // //                 ),
// // //                 SizedBox(height: 2.h),
// // //                 Text(
// // //                   profile.subtitle,
// // //                   style: GoogleFonts.tasaOrbiter(
// // //                     fontSize: 11.sp,
// // //                     fontWeight: FontWeight.w400,
// // //                     color: Colors.black54,
// // //                   ),
// // //                   maxLines: 1,
// // //                   overflow: TextOverflow.ellipsis,
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // // TODO: delete this placeholder once you swap in your real search screen
// // // // import + MaterialPageRoute builder above.
// // // class _SearchScreenPlaceholder extends StatelessWidget {
// // //   const _SearchScreenPlaceholder();

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: const Text('Search')),
// // //       body: const Center(child: Text('Search screen goes here')),
// // //     );
// // //   }
// // // }

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
import 'package:matrimony_app/view/custom_widgets/gender_avatar.dart';


const _pageBg = Color(0xFFF7F4EF);
const _greenNum = Color(0xFF2E8B57);
const _blueNum = Color(0xFF1E6FE0);
const _redNum = Color(0xFF9B2C2C);


String? _genderOf(dynamic obj) {
  try {
    return obj?.gender?.toString();
  } catch (_) {
    return null;
  }
}


Widget _profileImage(
  String image, {
  double? width,
  double? height,
  required double errorIconSize,
  BoxFit fit = BoxFit.cover,
  String? gender,
}) {
  final errorFallback = genderAvatarFallback(
    gender: gender ?? UserGender.matchGender,
    width: width,
    height: height,
    fit: fit,
    iconSize: errorIconSize,
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

/// Data holder for a profile card.
class MatchProfile {
  final String name;
  final String age; // e.g. "26 years"
  final String height; // e.g. "height5'4"
  final String image;
  final String? gender;

  const MatchProfile({
    required this.name,
    required this.age,
    required this.height,
    required this.image,
    this.gender,
  });
}

/// Data holder for one activity tile.
class _ActivityItem {
  final int value;
  final String label;
  final String hint;
  final Color color;
  final bool showStar;
  final VoidCallback? onTap;

  const _ActivityItem({
    required this.value,
    required this.label,
    required this.hint,
    required this.color,
    this.showStar = false,
    this.onTap,
  });
}

/// Optional background photo for the "Enrich your profile" cards.
/// If the asset doesn't exist, a dark gradient is shown instead.
const _enrichBgAsset = 'assets/image/edit.jpeg';

/// One card in the "Enrich your profile" carousel.
class _EnrichItem {
  final String text;
  final String buttonLabel;
  final VoidCallback? onTap;

  const _EnrichItem({
    required this.text,
    required this.buttonLabel,
    this.onTap,
  });
}

/// One card in the "Discover Matches" carousel.
class _DiscoverItem {
  final String imageicon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const _DiscoverItem({
    required this.imageicon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // ---------------- Static content (no API — dummy data) ----------------
  // Edit these lists to change the "Enrich your profile" and
  // "Discover Matches" carousels. Add an onTap to navigate somewhere.
  static const List<_EnrichItem> _enrichItems = [
    _EnrichItem(
      text: 'Your photos is the first thing your matches look',
      buttonLabel: 'Add More photos',
    ),
    _EnrichItem(
      text: 'Write more about you to get your perfect match',
      buttonLabel: 'Edit About Me',
    ),
    _EnrichItem(
      text: 'Add your partner preferences to get your ideal match.',
      buttonLabel: 'Add Preferences',
    ),
    _EnrichItem(
      text: 'Have you earned Trust Badges.',
      buttonLabel: 'Add trust badge',
    ),
  ];

  static const List<_DiscoverItem> _discoverItems = [
    _DiscoverItem(
      imageicon: 'assets/image/profession.jpeg',
      title: 'Profession',
      subtitle: 'Find a partner who shares your ambition',
    ),
    _DiscoverItem(
      imageicon: 'assets/image/education.jpeg',
      title: 'Education',
      subtitle: 'Connect with someone who values learning.',
    ),
    _DiscoverItem(
      imageicon: 'assets/image/family.jpeg',
      title: 'Family',
      subtitle: 'Matches that fit your family traditions',
    ),
    _DiscoverItem(
      imageicon: 'assets/image/religion.jpeg',
      title: 'Religion',
      subtitle: 'Build a future on shared beliefs',
    ),
  ];

  final PageController _enrichController =
      PageController(viewportFraction: 0.84);
  final PageController _discoverController =
      PageController(viewportFraction: 0.47);

  @override
  void dispose() {
    _enrichController.dispose();
    _discoverController.dispose();
    super.dispose();
  }

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
    String? fallbackGender,
  }) {
    if (apiMatches == null || apiMatches.isEmpty) return const [];
    return apiMatches
        .map(
          (m) => MatchProfile(
            name: m.name ?? '',
            age: m.age != null ? '${m.age} years' : '',
            height: (m.height != null && m.height!.isNotEmpty)
                ? 'height${m.height}'
                : '',
            image: m.imageUrl ?? '',
            // Use the match's own gender if the API sends it, otherwise
            // assume opposite of the logged-in user.
            gender: _genderOf(m) ?? fallbackGender,
          ),
        )
        .toList();
  }

  void _openSearch() {
    // TODO: Navigator.push(context, MaterialPageRoute(
    //   builder: (_) => SearchPreferencesScreen()));
  }

  void _openSubscription() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SubscriptionPlanScreen()),
    );
  }

  void _openList(String title, List<MatchProfile> profiles) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _ProfilesListScreen(title: title, profiles: profiles),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBg,
      drawer: Consumer<RegisterProvider>(
        builder: (context, provider, _) {
          final customer = provider.verifyOtpModel?.customer;
          return AppDrawer(
            name: customer?.name,
            profileId: customer?.id.toString(),
          );
        },
      ),
      body: SafeArea(
        child: Consumer2<HomeProvider, RegisterProvider>(
          builder: (context, provider, register, _) {
            final dm = provider.dashboardModel;
            final customer = register.verifyOtpModel?.customer;
            final completion = dm?.profileCompletion?.percentage;

            final userGender = normGender(_genderOf(customer)) ?? UserGender.current;
            final matchGender = oppositeGender(userGender);

            final allMatches = _resolveMatches(
              dm?.dailyMatches,
              fallbackGender: matchGender,
            );
            final newProfiles = _resolveMatches(
              dm?.newMatches,
              fallbackGender: matchGender,
            );
            final recent = _resolveMatches(
              dm?.recentVisited,
              fallbackGender: matchGender,
            );

            final unreadCount = dm?.notifications?.unreadCount ?? 0;
            final interestReceived = dm?.stats?.interestReceived ?? 0;
            final interestAccepted = dm?.stats?.interestAccepted ?? 0;
            final contactsViewed = dm?.stats?.contactsViewed ?? 0;

            // TODO: viewedMe / shortlistedMe / viewedByMe / shortlistedByMe /
            // requestReceived have no field in dashboard_model yet — showing 0
            // until the API returns them.
            final profileActivities = <_ActivityItem>[
              const _ActivityItem(
                value: 0,
                label: 'Who Viewed Me',
                hint: "See who's curious about you",
                color: _greenNum,
                showStar: true,
              ),
              const _ActivityItem(
                value: 0,
                label: 'Shortlisted Me',
                hint: "You're on their favorite list!",
                color: _blueNum,
                showStar: true,
              ),
              _ActivityItem(
                value: interestAccepted,
                label: 'My Interest Accepted',
                hint: "Great news! It's a mutual match",
                color: _redNum,
              ),
              _ActivityItem(
                value: contactsViewed,
                label: 'My Request Approved',
                hint: 'You can now view their info',
                color: _redNum,
              ),
            ];

            final myActivities = <_ActivityItem>[
              const _ActivityItem(
                value: 0,
                label: 'Viewed By Me',
                hint: "Profiles you've checked out",
                color: _greenNum,
              ),
              const _ActivityItem(
                value: 0,
                label: 'Shortlisted By Me',
                hint: 'Your saved favorites',
                color: _blueNum,
              ),
              _ActivityItem(
                value: interestReceived,
                label: 'Interest You Received',
                hint: 'They showed interest in you',
                color: _redNum,
              ),
              const _ActivityItem(
                value: 0,
                label: 'Request You Received',
                hint: 'Pending requests from others',
                color: _redNum,
              ),
            ];

            return Column(
              children: [
                _buildHeader(
                  name: customer?.name ?? '',
                  gender: userGender,
                  unreadCount: unreadCount,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 28.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        // if (completion != null && completion < 100) ...[
                        //   _buildCompletionCard(completion),
                        //   SizedBox(height: 22.h),
                        // ],

                        // 1. All Matches (horizontal)
                        if (allMatches.isNotEmpty) ...[
                          _buildSectionHeader(
                            'All Matches',
                            count: allMatches.length,
                            onSeeAll: () =>
                                _openList('All Matches', allMatches),
                          ),
                          SizedBox(height: 12.h),
                          _buildHorizontalProfiles(allMatches),
                          //SizedBox(height: 26.h),
                        ],

                        // 2. Activities
                        _buildActivityCard(
                            'Profile Activities', profileActivities),
                        SizedBox(height: 14.h),
                        _buildActivityCard('My Activities', myActivities),

                        // 3. New Profiles (horizontal)
                        if (newProfiles.isNotEmpty) ...[
                          SizedBox(height: 26.h),
                          _buildSectionHeader(
                            'New Profiles',
                            count: newProfiles.length,
                            onSeeAll: () =>
                                _openList('New Profiles', newProfiles),
                          ),
                          SizedBox(height: 12.h),
                          _buildHorizontalProfiles(newProfiles),
                        ],

                        //SizedBox(height: 26.h),
                        _buildEnrichProfileSection(),
                        SizedBox(height: 26.h),
                        _buildDiscoverMatchesSection(),

                        // SizedBox(height: 26.h),
                        // _buildPromoCard(),

                        // if (recent.isNotEmpty) ...[
                        //   SizedBox(height: 26.h),
                        //   _buildSectionHeader(
                        //     'Recently Visited',
                        //     count: recent.length,
                        //   ),
                        //   SizedBox(height: 10.h),
                        //   _buildRecentList(recent),
                        // ],
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // ---------------- Header: avatar + name/plan | search, bell, menu ----------------
  Widget _buildHeader({
    required String name,
    String? gender,
    int unreadCount = 0,
  }) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 12.w, 16.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primaryLight, _pageBg],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar with camera badge
          GestureDetector(
            onTap: () {
              // TODO: open manage photos
            },
            child: SizedBox(
              width: 56.w,
              height: 56.w,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      // TODO: pass the user's real photo URL here if the API has
                      // one; empty falls back to the boy/girl default avatar.
                      child: _profileImage(
                        'assets/image/girl_icon.jpeg',
                        gender: gender,
                        width: 52.w,
                        height: 52.w,
                        errorIconSize: 26.sp,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -2.w,
                    bottom: -2.w,
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Icon(Icons.photo_camera,
                          size: 11.sp, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),
          // Name + plan + upgrade chip
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h,),
                Text(
                  name.isEmpty ? 'Ahana S Nair' : name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4.h,),
                Text(
                  'VBM26208878F',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 10.sp,
                    color: Colors.black54,
                  ),
                ),
              

                //SizedBox(height: 2.h),
                SizedBox(height: 4.h,),
                Row(
                  children: [
                    // TODO: replace with the real plan once the API has it
                    Flexible(
                      child: Text(
                        'Free Member',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 10.sp,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: _openSubscription,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          'Upgrade',
                          style: GoogleFonts.tasaOrbiter(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
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
          _headerIcon(Icons.search, onTap: _openSearch),
          _headerIcon(
            Icons.notifications_none,
            badgeCount: unreadCount,
            onTap: () {
              // TODO: open notifications
            },
          ),
          Builder(
            builder: (ctx) => _headerIcon(
              Icons.menu,
              onTap: () => Scaffold.of(ctx).openDrawer(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerIcon(
    IconData icon, {
    int badgeCount = 0,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(6.w),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(icon, size: 24.sp, color: Colors.black87),
            if (badgeCount > 0)
              Positioned(
                right: -4.w,
                top: -4.w,
                child: Container(
                  padding: EdgeInsets.all(3.w),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$badgeCount',
                    style: GoogleFonts.tasaOrbiter(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ---------------- Profile completion card ----------------
  Widget _buildCompletionCard(int percentage) {
    final pct = percentage.clamp(0, 100);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Complete your profile',
                    style: GoogleFonts.tasaOrbiter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.r),
                          child: LinearProgressIndicator(
                            value: pct / 100,
                            minHeight: 6.h,
                            backgroundColor: AppColors.primaryLight,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '$pct%',
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Add photos & details for better matches',
                    style: GoogleFonts.tasaOrbiter(
                      fontSize: 11.sp,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            GestureDetector(
              onTap: () {
                // TODO: open edit profile
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'Complete',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- Membership promo card ----------------
  Widget _buildPromoCard() {
    const perks = [
      'Contact matches directly',
      'Unlimited messages',
      'Better chances of a response',
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(18.w),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Go premium, connect faster',
              style: GoogleFonts.tasaOrbiter(
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            ...perks.map(
              (p) => Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: Row(
                  children: [
                    Icon(Icons.check_circle,
                        size: 15.sp, color: Colors.white),
                    SizedBox(width: 8.w),
                    Text(
                      p,
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 12.sp,
                        color: Colors.white.withOpacity(0.95),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: _openSubscription,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22.r),
                ),
                child: Text(
                  'See membership plans',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- Carousel header: title + prev/next arrows ----------------
  Widget _buildCarouselHeader(
    String title,
    PageController controller,
    int count,
  ) {
    void go(int delta) {
      if (!controller.hasClients) return;
      final current = (controller.page ?? 0).round();
      final target = (current + delta).clamp(0, count - 1);
      controller.animateToPage(
        target,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }

    Widget arrow(IconData icon, int delta) => GestureDetector(
          onTap: () => go(delta),
          child: Container(
            width: 30.w,
            height: 30.w,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 18.sp, color: Colors.white),
          ),
        );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.tasaOrbiter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            ),
          ),
          arrow(Icons.chevron_left, -1),
          SizedBox(width: 8.w),
          arrow(Icons.chevron_right, 1),
        ],
      ),
    );
  }

  // ---------------- Enrich your profile (carousel) ----------------
  Widget _buildEnrichProfileSection() {
    const items = _enrichItems;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCarouselHeader('Enrich your profile', _enrichController, items.length),
        SizedBox(height: 12.h),
        SizedBox(
          height: 240.h,
          child: PageView.builder(
            controller: _enrichController,
            padEnds: false,
            itemCount: items.length,
            itemBuilder: (_, i) => Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: _buildEnrichCard(items[i]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEnrichCard(_EnrichItem item) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Base gradient (visible when no background photo asset exists)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6B5A5A), Color(0xFF2B2224)],
              ),
            ),
          ),
          Image.asset(
            _enrichBgAsset,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const SizedBox.shrink(),
          ),
          // Dark fade so the text stays readable
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                stops: const [0.3, 1.0],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(14.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 1.25,
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  height: 38.h,
                  child: ElevatedButton(
                    onPressed: item.onTap ?? () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryDark,
                      elevation: 0,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      item.buttonLabel,
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- Discover Matches (carousel) ----------------
  Widget _buildDiscoverMatchesSection() {
    const items = _discoverItems;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCarouselHeader('Discover Matches', _discoverController, items.length),
        SizedBox(height: 12.h),
        SizedBox(
          height: 130.h,
          child: PageView.builder(
            controller: _discoverController,
            padEnds: false,
            itemCount: items.length,
            itemBuilder: (_, i) => Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: _buildDiscoverCard(items[i]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDiscoverCard(_DiscoverItem item) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Icon(item.icon, size: 30.sp, color: Colors.black87),
            Image.asset(
              height: 40,
            item.imageicon,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const SizedBox.shrink(),
          ),
            SizedBox(height: 10.h),
            Text(
              item.title,
              style: GoogleFonts.tasaOrbiter(
                fontSize: 15.sp,
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              item.subtitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.tasaOrbiter(
                fontSize: 11.sp,
                color: Colors.black54,
                height: 1.25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- Section header ----------------
  Widget _buildSectionHeader(
    String title, {
    int? count,
    VoidCallback? onSeeAll,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: GoogleFonts.tasaOrbiter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                  if (count != null)
                    TextSpan(
                      text: '  ($count)',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 12.sp,
                        color: Colors.black54,
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (onSeeAll != null)
            InkWell(
              onTap: onSeeAll,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primary
                    ),
                    child: Row(
                      children: [
                        Text(
                          'See all',
                          style: GoogleFonts.tasaOrbiter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.onPrimary,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Icon(Icons.chevron_right,
                      size: 16.sp, color: AppColors.onPrimary),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
        ],
      ),
    );
  }

  // ---------------- Activity cards (title + 2x2 grid in a white card) ----------------
  Widget _buildActivityCard(String title, List<_ActivityItem> items) {
    final rows = <Widget>[];
    for (int i = 0; i < items.length; i += 2) {
      final hasSecond = i + 1 < items.length;
      rows.add(
        Padding(
          padding: EdgeInsets.only(top: i == 0 ? 0 : 10.h),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _ActivityTile(item: items[i])),
                SizedBox(width: 10.w),
                Expanded(
                  child: hasSecond
                      ? _ActivityTile(item: items[i + 1])
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.tasaOrbiter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 12.h),
            ...rows,
          ],
        ),
      ),
    );
  }

  // ---------------- Horizontal profile cards (All Matches / New Profiles) ---------------- ----------------
  Widget _buildHorizontalProfiles(List<MatchProfile> profiles) {
    return SizedBox(
      height: 230.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: profiles.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (_, i) => SizedBox(
          width: 160.w,
          child: _MatchCard(profile: profiles[i], imageHeight: 160.h),
        ),
      ),
    );
  }

  // ---------------- Recently visited: compact rows ----------------
  Widget _buildRecentList(List<MatchProfile> matches) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: matches
            .map(
              (m) => Container(
                margin: EdgeInsets.only(bottom: 10.h),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: _profileImage(
                        m.image,
                        gender: m.gender,
                        width: 48.w,
                        height: 48.w,
                        errorIconSize: 22.sp,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            m.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.tasaOrbiter(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            [m.age, m.height]
                                .where((s) => s.isNotEmpty)
                                .join('  ·  '),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.tasaOrbiter(
                              fontSize: 11.sp,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right,
                        size: 20.sp, color: Colors.black38),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

/// One tile inside an activity card: count, label, hint.
class _ActivityTile extends StatelessWidget {
  final _ActivityItem item;

  const _ActivityTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${item.value}',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: item.color,
                  ),
                ),
                if (item.showStar)
                  Icon(Icons.star_border, size: 14.sp, color: AppColors.primary),
              ],
            ),
            SizedBox(height: 2.h),
            Text(
              item.label,
              style: GoogleFonts.tasaOrbiter(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              item.hint,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.tasaOrbiter(
                fontSize: 10.sp,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Profile card: photo with Shortlist chip, name, age + height.
class _MatchCard extends StatefulWidget {
  final MatchProfile profile;
  final double? imageHeight;

  const _MatchCard({required this.profile, this.imageHeight});

  @override
  State<_MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<_MatchCard> {
  // TODO: hook up to the shortlist API; local-only for now.
  bool _shortlisted = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.profile;
    final imgH = widget.imageHeight ?? 150.h;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: SizedBox(
            width: double.infinity,
            height: imgH,
            child: Stack(
              fit: StackFit.expand,
              children: [
                _profileImage(
                  p.image,
                  gender: p.gender,
                  width: double.infinity,
                  height: imgH,
                  errorIconSize: 48.sp,
                ),
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: GestureDetector(
                    onTap: () => setState(() => _shortlisted = !_shortlisted),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: _shortlisted
                            ? AppColors.primary
                            : Colors.black.withOpacity(0.55),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _shortlisted
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 11.sp,
                            color: Colors.white,
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            _shortlisted ? 'Shortlisted' : 'Shortlist',
                            style: GoogleFonts.tasaOrbiter(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (p.image.isEmpty)
                  Positioned(
                    bottom: 8.h,
                    left: 8.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.camera_alt_outlined,
                              size: 11.sp, color: Colors.white),
                          SizedBox(width: 3.w),
                          Text(
                            'Request Photo',
                            style: GoogleFonts.tasaOrbiter(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          p.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.tasaOrbiter(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 3.h),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                p.age,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 11.sp,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(width: 7.w),
            Flexible(
              child: Text(
                p.height,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 11.sp,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Full 2-column list reached from "See all".
class _ProfilesListScreen extends StatelessWidget {
  final String title;
  final List<MatchProfile> profiles;

  const _ProfilesListScreen({required this.title, required this.profiles});

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (int i = 0; i < profiles.length; i += 2) {
      final hasSecond = i + 1 < profiles.length;
      rows.add(
        Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _MatchCard(profile: profiles[i])),
              SizedBox(width: 12.w),
              Expanded(
                child: hasSecond
                    ? _MatchCard(profile: profiles[i + 1])
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: _pageBg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: Text(
          title,
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