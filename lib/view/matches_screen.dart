// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:matrimony_app/provider/home_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:matrimony_app/provider/register_provider.dart';
// import 'package:matrimony_app/provider/shortlist_provider.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/custom_widgets/gender_avatar.dart';
// import 'package:matrimony_app/view/custom_widgets/shortlist_badge.dart';
// import 'package:matrimony_app/view/match_profile_detail_screen.dart';
// import 'package:matrimony_app/view/search_preferences_screen.dart';


// Widget matchProfileImage(
//   String image, {
//   double? width,
//   double? height,
//   BoxFit fit = BoxFit.cover,
//   required double errorIconSize,
//   String? gender,
// }) {
//   final errorFallback = genderAvatarFallback(
//     gender: gender ?? UserGender.matchGender,
//     width: width,
//     height: height,
//     fit: fit,
//     iconSize: errorIconSize,
//   );
//   if (image.isEmpty) return errorFallback;
//   if (image.startsWith('http')) {
//     return Image.network(
//       image,
//       width: width,
//       height: height,
//       fit: fit,
//       errorBuilder: (_, __, ___) => errorFallback,
//     );
//   }
//   return Image.asset(
//     image,
//     width: width,
//     height: height,
//     fit: fit,
//     errorBuilder: (_, __, ___) => errorFallback,
//   );
// }

// class MatchProfileItem {
//   final String name;
//   final String line1;
//   final String line2;
//   final String image;
//   // Full photo gallery for this profile, in display order. Falls back to
//   // just [image] wherever it's left empty.
//   final List<String> images;
//   final int photoCount;
//   final bool isPremium;
//   final String contactNo;
//   final String email;

//   // Extra fields used by the profile detail screen.
//   final int age;
//   final String height;
//   final String maritalStatus;
//   final String motherTongue;
//   final String religion;
//   final String education;
//   final String profession;
//   final String location;
//   final String about;
//   final String fatherOccupation;
//   final String motherOccupation;
//   final String siblings;
//   final String community;
//   final String diet;
//   final String profileId;
//   final String managedBy;
//   final String birthDate;
//   final String zodiac;
//   final List<String> hobbies;
//   final String familyStatus;
//   final String familyFinancialStatus;
//   final String professionDetail;
//   final String annualIncomeSelf;
//   final String annualIncomeFamily;
//   final String educationField;

//   const MatchProfileItem({
//     required this.name,
//     required this.line1,
//     required this.line2,
//     required this.image,
//     this.images = const [],
//     this.photoCount = 1,
//     this.isPremium = false,
//     this.age = 0,
//     this.height = '',
//     this.maritalStatus = 'Never Married',
//     this.motherTongue = '',
//     this.religion = '',
//     this.education = '',
//     this.profession = '',
//     this.location = '',
//     this.about = '',
//     this.fatherOccupation = '',
//     this.motherOccupation = '',
//     this.siblings = '',
//     this.community = '',
//     this.diet = '',
//     this.profileId = '',
//     this.managedBy = 'Self',
//     this.birthDate = '',
//     this.zodiac = '',
//     this.hobbies = const [],
//     this.contactNo = '+91 9876******',
//     this.email = '****@gmail.com',
//     this.familyStatus = '',
//     this.familyFinancialStatus = '',
//     this.professionDetail = '',
//     this.annualIncomeSelf = '',
//     this.annualIncomeFamily = '',
//     this.educationField = '',
//   });
// }

// class MatchesScreen extends StatefulWidget {
//   const MatchesScreen({super.key});

//   @override
//   State<MatchesScreen> createState() => _MatchesScreenState();
// }

// class _MatchesScreenState extends State<MatchesScreen> {
//   int _activeTab = 1; // "Daily (20)" selected by default
//   int _navIndex = 1; // Matches tab active

//   final List<String> tabs = const [
//     'Search',
//     'All Matches',
//     'Newly Joined',
//     'Shortlisted You',
//     'Viewed You',
//     'Shortlisted By You',
//     'Viewed By You',
//     'Online',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final provider = context.read<HomeProvider>();
//       provider.getAllMatches();
//       provider.getNewMatches();
//       provider.getViewedMe();
//       provider.getViewedByMe();
//       provider.getShortlistedYou();
//       provider.getShortlistedByYou();
//     });
//   }

//   // Converts an API match (any of the near-identical Match classes from
//   // all_matches_model / new_matches_model / viewed_me_model /
//   // viewed_by_me_model) into the screen's display model. Takes plain fields
//   // instead of a typed Match so it works for all four without import
//   // aliasing (they're separate classes with the same shape).
//   MatchProfileItem _fromApiMatch({
//     String? name,
//     int? age,
//     String? height,
//     String? motherTongue,
//     dynamic community,
//     String? location,
//     String? imageUrl,
//     dynamic id,
//   }) {
//     final communityStr = community?.toString() ?? '';
//     final line1 = [
//       if (age != null) '$age Yrs',
//       if (height != null && height.isNotEmpty) height,
//     ].join(', ');
//     final line2 = [
//       [
//         if (motherTongue != null && motherTongue.isNotEmpty) motherTongue,
//         if (communityStr.isNotEmpty) communityStr,
//       ].join(', '),
//       if (location != null && location.isNotEmpty) location,
//     ].where((s) => s.isNotEmpty).join(' · ');
//     return MatchProfileItem(
//       name: name ?? '',
//       line1: line1,
//       line2: line2,
//       image: imageUrl ?? '',
//       age: age ?? 0,
//       height: height ?? '',
//       motherTongue: motherTongue ?? '',
//       community: communityStr,
//       location: location ?? '',
//       profileId: id?.toString() ?? '',
//     );
//   }

//   final List<MatchProfileItem> profiles = const [
//     MatchProfileItem(
//       name: 'Swathy Mohan',
//       line1: "26 Yrs, 5'2\" · Finance Professional",
//       line2: 'Malayalam, Thiyya · Kozhikode, Kerala',
//       image: 'assets/image/user1.png',
//       images: [
//         'assets/image/user1.png',
//         'assets/image/user2.png',
//         'assets/image/user3.png',
//       ],
//       photoCount: 4,
//       age: 26,
//       height: "5'2\"",
//       motherTongue: 'Malayalam',
//       religion: 'Hindu',
//       community: 'Thiyya',
//       education: 'PGDM',
//       profession: 'Finance Professional',
//       location: 'Kozhikode, Kerala',
//       about:
//           "Hello, I'm Swathy Mohan, born and raised in Kerala. I am a Finance Professional "
//           'working with a reputed IT company in Kochi. My friends describe me as independent, '
//           'responsible, and understanding. Outside work, I enjoy reading, music, and fitness. '
//           'I value traditions while being open to modern perspectives.',
//       fatherOccupation: 'Employed',
//       motherOccupation: 'Homemaker',
//       siblings: '1 Brother Married',
//       diet: 'Non-Vegetarian',
//       profileId: 'SH536637002',
//       managedBy: 'Self',
//       birthDate: '07 Jun 1999',
//       zodiac: 'Gemini',
//       hobbies: const ['Dancing', 'Cooking', 'Traveling', 'Music', 'Foodie'],
//       familyStatus: 'Moderate',
//       familyFinancialStatus:
//           'Aspiring - Annual family income is up to 30 lakhs',
//       professionDetail: 'Finance Profession in a private Company',
//       annualIncomeSelf: 'INR 8 - 20 Lakh',
//       annualIncomeFamily: 'INR 10 - 30 Lakh',
//       educationField: 'Management',
//     ),
//     MatchProfileItem(
//       name: 'Geethu',
//       line1: "26 Yrs, 5'2\" · Finance Professional",
//       line2: 'Malayalam, Thiyya · Kozhikode, Kerala',
//       image: 'assets/image/user3.png',
//       photoCount: 4,
//       isPremium: true,
//       age: 26,
//       height: "5'2\"",
//       motherTongue: 'Malayalam',
//       religion: 'Hindu',
//       community: 'Thiyya',
//       education: 'MBA Finance',
//       profession: 'Finance Professional',
//       location: 'Kozhikode, Kerala',
//       about:
//           'Geethu is warm, ambitious and family-oriented. She loves travelling and '
//           'reading, and is looking for a supportive partner who shares similar values.',
//       fatherOccupation: 'Government Employee',
//       motherOccupation: 'Teacher',
//       siblings: '1 Brother (Unmarried)',
//       diet: 'Vegetarian',
//       profileId: 'SH412298',
//       managedBy: 'Self',
//       birthDate: '14 Mar 1999',
//       zodiac: 'Pisces',
//       hobbies: const ['Reading', 'Traveling', 'Cooking'],
//       familyStatus: 'Moderate',
//       familyFinancialStatus:
//           'Moderate - Annual family income is up to 20 lakhs',
//       professionDetail: 'Finance Profession in a private Company',
//       annualIncomeSelf: 'INR 6 - 10 Lakh',
//       annualIncomeFamily: 'INR 8 - 20 Lakh',
//       educationField: 'Finance',
//     ),
//     MatchProfileItem(
//       name: 'Meenakshi',
//       line1: "28 Yrs, 5'2\" · Finance Professional",
//       line2: 'Malayalam, Thiyya · Kozhikode, Kerala',
//       image: 'assets/image/user2.png',
//       photoCount: 4,
//       age: 28,
//       height: "5'2\"",
//       motherTongue: 'Malayalam',
//       religion: 'Hindu',
//       community: 'Thiyya',
//       education: 'MBA Finance',
//       profession: 'Finance Professional',
//       location: 'Kozhikode, Kerala',
//       about:
//           'Meenakshi is disciplined and caring, with a passion for classical dance and '
//           'community service. Looking for a genuine, understanding life partner.',
//       fatherOccupation: 'Retired Bank Officer',
//       motherOccupation: 'Homemaker',
//       siblings: 'None',
//       diet: 'Vegetarian',
//       profileId: 'SH398711',
//       managedBy: 'Parent',
//       birthDate: '02 Nov 1997',
//       zodiac: 'Scorpio',
//       hobbies: const ['Dancing', 'Volunteering'],
//       familyStatus: 'Rich',
//       familyFinancialStatus:
//           'Affluent - Annual family income is above 40 lakhs',
//       professionDetail: 'Finance Profession in a private Company',
//       annualIncomeSelf: 'INR 8 - 15 Lakh',
//       annualIncomeFamily: 'INR 15 - 40 Lakh',
//       educationField: 'Finance',
//     ),
//   ];

//   List<MatchProfileItem> get _currentProfiles {
//     final provider = context.watch<HomeProvider>();

//     if (_activeTab == 0) {
//       // "Search" — results from the last partner-preference search.
//       final results = context.watch<RegisterProvider>().searchModel?.data;
//       if (results != null && results.isNotEmpty) {
//         return results
//             .map(
//               (s) => _fromApiMatch(
//                 name: s.name,
//                 age: s.age,
//                 height: s.height,
//                 motherTongue: s.motherTongue,
//                 community: s.community,
//                 location: s.location,
//                 imageUrl: s.imageUrl,
//                 id: s.id,
//               ),
//             )
//             .toList();
//       }
//       return const [];
//     }

//     if (_activeTab == 1) {
//       // "All Matches"
//       final apiMatches = provider.allMatchesModel?.matches;
//       if (apiMatches != null && apiMatches.isNotEmpty) {
//         return apiMatches
//             .map(
//               (m) => _fromApiMatch(
//                 name: m.name,
//                 age: m.age,
//                 height: m.height,
//                 motherTongue: m.motherTongue,
//                 community: m.community,
//                 location: m.location,
//                 imageUrl: m.imageUrl,
//                 id: m.id,
//               ),
//             )
//             .toList();
//       }
//       return const [];
//     }

//     if (_activeTab == 2) {
//       // "Newly Joined"
//       final apiMatches = provider.newMatchesModel?.matches;
//       if (apiMatches != null && apiMatches.isNotEmpty) {
//         return apiMatches
//             .map(
//               (m) => _fromApiMatch(
//                 name: m.name,
//                 age: m.age,
//                 height: m.height,
//                 motherTongue: m.motherTongue,
//                 community: m.community,
//                 location: m.location,
//                 imageUrl: m.imageUrl,
//                 id: m.id,
//               ),
//             )
//             .toList();
//       }
//       return const [];
//     }

//     if (_activeTab == 3) {
//       // "Shortlisted You" — people who shortlisted your profile.
//       final apiMatches = provider.shortlistedYouModel?.matches;
//       if (apiMatches != null && apiMatches.isNotEmpty) {
//         return apiMatches
//             .map(
//               (m) => _fromApiMatch(
//                 name: m.name,
//                 age: m.age,
//                 height: m.height,
//                 motherTongue: m.motherTongue,
//                 community: m.community,
//                 location: m.location,
//                 imageUrl: m.imageUrl,
//                 id: m.id,
//               ),
//             )
//             .toList();
//       }
//       return const [];
//     }

//     if (_activeTab == 4) {
//       // "Viewed You" — people who viewed your profile.
//       final apiMatches = provider.viewedMeModel?.matches;
//       if (apiMatches != null && apiMatches.isNotEmpty) {
//         return apiMatches
//             .map(
//               (m) => _fromApiMatch(
//                 name: m.name,
//                 age: m.age,
//                 height: m.height,
//                 motherTongue: m.motherTongue,
//                 community: m.community,
//                 location: m.location,
//                 imageUrl: m.imageUrl,
//                 id: m.id,
//               ),
//             )
//             .toList();
//       }
//       return const [];
//     }

//     if (_activeTab == 5) {
//       // "Shortlisted By You" — profiles you shortlisted.
//       final apiMatches = provider.shortlistedByYouModel?.matches;
//       if (apiMatches != null && apiMatches.isNotEmpty) {
//         return apiMatches
//             .map(
//               (m) => _fromApiMatch(
//                 name: m.name,
//                 age: m.age,
//                 height: m.height,
//                 motherTongue: m.motherTongue,
//                 community: m.community,
//                 location: m.location,
//                 imageUrl: m.imageUrl,
//                 id: m.id,
//               ),
//             )
//             .toList();
//       }
//       // Fall back to the local shortlist toggled via ShortlistBadge (e.g.
//       // from Match Detail / Inbox) in case the API list hasn't caught up.
//       return context.watch<ShortlistProvider>().shortlistedProfiles;
//     }

//     if (_activeTab == 6) {
//       // "Viewed By You" — profiles you viewed.
//       final apiMatches = provider.viewedByMeModel?.matches;
//       if (apiMatches != null && apiMatches.isNotEmpty) {
//         return apiMatches
//             .map(
//               (m) => _fromApiMatch(
//                 name: m.name,
//                 age: m.age,
//                 height: m.height,
//                 motherTongue: m.motherTongue,
//                 community: m.community,
//                 location: m.location,
//                 imageUrl: m.imageUrl,
//                 id: m.id,
//               ),
//             )
//             .toList();
//       }
//       return const [];
//     }

//     return profiles;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currentProfiles = _currentProfiles;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildHeader(),
//             SizedBox(height: 10.h),
//             _buildTabs(),
//             SizedBox(height: 8.h),
//             Expanded(
//               child: currentProfiles.isEmpty
//                   ? Center(
//                       child: Text(
//                         'There is no matches',
//                         style: GoogleFonts.tasaOrbiter(
//                           fontSize: 13.sp,
//                           color: Colors.black45,
//                         ),
//                       ),
//                     )
//                   : ListView.separated(
//                       padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
//                       itemCount: currentProfiles.length,
//                       separatorBuilder: (_, __) => SizedBox(height: 14.h),
//                       itemBuilder: (context, index) => _MatchProfileCard(
//                         item: currentProfiles[index],
//                         allProfiles: currentProfiles,
//                       ),
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
//       child: Row(
//         children: [
//           Icon(Icons.menu, size: 22.sp, color: Colors.black87),
//           SizedBox(width: 10.w),
//           Text(
//             'Matches',
//             style: GoogleFonts.tasaOrbiter(
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w700,
//               color: Colors.black87,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTabs() {
//     return SizedBox(
//       height: 34.h,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         padding: EdgeInsets.symmetric(horizontal: 16.w),
//         itemCount: tabs.length,
//         separatorBuilder: (_, __) => SizedBox(width: 8.w),
//         itemBuilder: (context, index) {
//           final selected = _activeTab == index;
//           final isSearch = index == 0;
//           return InkWell(
//             onTap: () async {
//               if (isSearch) {
//                 final searched = await Navigator.push<bool>(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => const SearchPreferencesScreen(),
//                   ),
//                 );
//                 if (searched == true) setState(() => _activeTab = 0);
//                 return;
//               }
//               setState(() => _activeTab = index);
//             },
//             borderRadius: BorderRadius.circular(18.r),
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
//               decoration: BoxDecoration(
//                 color: selected ? AppColors.primary : Colors.white,
//                 borderRadius: BorderRadius.circular(18.r),
//                 border: Border.all(
//                   color: selected ? AppColors.primary : const Color(0xFFE0E0E0),
//                 ),
//               ),
//               alignment: Alignment.center,
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   if (isSearch) ...[
//                     Icon(
//                       Icons.search,
//                       size: 13.sp,
//                       color: selected ? Colors.white : Colors.black54,
//                     ),
//                     SizedBox(width: 4.w),
//                   ],
//                   Text(
//                     tabs[index],
//                     style: GoogleFonts.tasaOrbiter(
//                       fontSize: 11.sp,
//                       fontWeight: FontWeight.w600,
//                       color: selected ? Colors.white : Colors.black54,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildFilterSortBar() {
//     return Row(
//       children: [
//         Expanded(child: _filterSortChip(Icons.tune_rounded, 'Filter')),
//         SizedBox(width: 10.w),
//         Expanded(child: _filterSortChip(Icons.swap_vert_rounded, 'Sort')),
//       ],
//     );
//   }

//   Widget _filterSortChip(IconData icon, String label) {
//     return InkWell(
//       onTap: () {},
//       borderRadius: BorderRadius.circular(16.r),
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 9.h),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: const Color(0xFFF4F4F4),
//           borderRadius: BorderRadius.circular(16.r),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(icon, size: 14.sp, color: Colors.black54),
//             SizedBox(width: 4.w),
//             Text(
//               label,
//               style: GoogleFonts.tasaOrbiter(
//                 fontSize: 11.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black54,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// A single match card: full-bleed photo, premium ribbon, photo-count
// /// pill, verified name, two-line details, and Message / Connect Now
// /// action buttons.
// class _MatchProfileCard extends StatelessWidget {
//   final MatchProfileItem item;
//   final List<MatchProfileItem> allProfiles;

//   const _MatchProfileCard({required this.item, this.allProfiles = const []});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(16.r),
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) =>
//               MatchProfileDetailScreen(item: item, allProfiles: allProfiles),
//         ),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16.r),
//         child: SizedBox(
//           height: 509.h,
//           child: Stack(
//             fit: StackFit.expand,
//             children: [
//               matchProfileImage(item.image, errorIconSize: 64.sp),
//               Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
//                     stops: const [0.45, 1.0],
//                   ),
//                 ),
//               ),

//               // Premium ribbon
//               if (item.isPremium)
//                 Positioned(
//                   top: 0,
//                   left: 0,
//                   child: Container(
//                     width: 150.w,
//                     height: 20.h,
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 10.w,
//                       vertical: 5.h,
//                     ),
//                     decoration: BoxDecoration(
//                       image: const DecorationImage(
//                         image: AssetImage('assets/image/Vector 1265.png'),
//                         fit: BoxFit.fill,
//                       ),
//                       borderRadius: BorderRadius.only(
//                         bottomRight: Radius.circular(12.r),
//                       ),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Image.asset(
//                           'assets/image/crown.png',
//                           width: 12.w,
//                           height: 12.w,
//                         ),
//                         SizedBox(width: 4.w),
//                         Text(
//                           'Premium',
//                           style: GoogleFonts.tasaOrbiter(
//                             fontSize: 10.sp,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//               // // top-left: shortlist (offset below the premium ribbon when present)
//               // Positioned(
//               //   top: item.isPremium ? 30.h : 10.h,
//               //   left: 10.w,
//               //   child: ShortlistBadge(profile: item),
//               // ),

//               // top-right: menu + photo count
//               Positioned(
//                 top: 10.h,
//                 right: 10.w,
//                 // child: Column(
//                 //   crossAxisAlignment: CrossAxisAlignment.end,
//                 //   children: [
//                 //     // Container(
//                 //     //   height: 30.h,
//                 //     //   width: 36.h,
//                 //     //   padding: EdgeInsets.all(5.w),
//                 //     //   decoration: BoxDecoration(color: Colors.black.withOpacity(0.4), shape: BoxShape.circle),
//                 //     //   child: Icon(Icons.more_horiz, size: 15.sp, color: Colors.white),
//                 //     // ),
//                 //     SizedBox(height: 8.h),
//                 //     Container(
//                 //       height: 30.h,
//                 //       width: 51.h,
//                 //       padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
//                 //       decoration: BoxDecoration(color: Colors.black.withOpacity(0.4), borderRadius: BorderRadius.circular(12.r)),
//                 //       child: Row(
//                 //         mainAxisSize: MainAxisSize.min,
//                 //         children: [
//                 //           SizedBox(width: 3.w),
//                 //           Icon(Icons.camera_alt_outlined, size: 20.sp, color: Colors.white),
//                 //           SizedBox(width: 6.w),
//                 //           Text('${item.photoCount}', style: GoogleFonts.tasaOrbiter(fontSize: 15.sp, fontWeight: FontWeight.w600, color: Colors.white)),
//                 //         ],
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 child: ShortlistBadge(profile: item),
//               ),

//               // bottom content
//               Positioned(
//                 left: 14.w,
//                 right: 14.w,
//                 bottom: 12.h,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Flexible(
//                           child: Text(
//                             item.name,
//                             style: GoogleFonts.tasaOrbiter(
//                               fontSize: 24.sp,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.white,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         SizedBox(width: 5.w),
//                         Image.asset(
//                           'assets/image/verified.png',
//                           width: 18.w,
//                           height: 17.w,
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 3.h),
//                     Text(
//                       item.line1,
//                       style: GoogleFonts.tasaOrbiter(
//                         fontSize: 14.sp,
//                         color: Colors.white70,
//                       ),
//                     ),
//                     Text(
//                       item.line2,
//                       style: GoogleFonts.tasaOrbiter(
//                         fontSize: 14.sp,
//                         color: Colors.white70,
//                       ),
//                     ),
//                     SizedBox(height: 8.h),
//                     Divider(color: Colors.white24, height: 1),
//                     SizedBox(height: 8.h),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Text(
//                             'Like this Profile?',
//                             style: GoogleFonts.tasaOrbiter(
//                               fontSize: 14.sp,
//                               color: Colors.white70,
//                             ),
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             InkWell(
//                               onTap: () {},
//                               // child: Container(
//                               //   padding: EdgeInsets.all(9.w),
//                               //   decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
//                               //   child: Icon(Icons.chat_bubble_outline, size: 16.sp, color: const Color(0xFF5A6ACF)),
//                               // ),
//                               child: Image.asset(
//                                 'assets/image/Frame 2085664438.png',
//                                 height: 44.h,
//                                 width: 73.w,
//                               ),
//                             ),
//                             //SizedBox(height: 5.h),
//                             Text(
//                               "View contact",
//                               style: GoogleFonts.tasaOrbiter(
//                                 fontSize: 12.sp,
//                                 color: Colors.white70,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(width: 8.w),
//                         Column(
//                           children: [
//                             InkWell(
//                               onTap: () {},
//                               // child: Container(
//                               //   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
//                               //   decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(20.r)),
//                               //   child: Icon(Icons.check, size: 16.sp, color: Colors.white),
//                               // ),
//                               child: Image.asset(
//                                 'assets/image/Frame 2085664438 (1).png',
//                                 height: 44.h,
//                                 width: 73.w,
//                               ),
//                             ),
//                             //SizedBox(height: 5.h),
//                             Text(
//                               "Connect Now",
//                               style: GoogleFonts.tasaOrbiter(
//                                 fontSize: 12.sp,
//                                 color: Colors.white70,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
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




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:matrimony_app/provider/register_provider.dart';
import 'package:matrimony_app/provider/shortlist_provider.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/gender_avatar.dart';
import 'package:matrimony_app/view/custom_widgets/shortlist_badge.dart';
import 'package:matrimony_app/view/match_profile_detail_screen.dart';
import 'package:matrimony_app/view/search_preferences_screen.dart';

const _pageBg = Color(0xFFF7F4EF);
const _darkRed = Color(0xFF9B2C2C);
const _verifiedBlue = Color(0xFF1E6FE0);
const _paidPurple = Color(0xFF4B2E83);

/// Renders [image] as a network image when it's a URL (real API data) or a
/// local asset otherwise (sample/fallback data). If it's empty or fails to
/// load, shows the boy/girl default avatar for [gender] (defaults to the
/// opposite of the logged-in user), or a person icon if gender is unknown.
Widget matchProfileImage(
  String image, {
  double? width,
  double? height,
  BoxFit fit = BoxFit.cover,
  required double errorIconSize,
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

class MatchProfileItem {
  final String name;
  final String line1;
  final String line2;
  final String image;
  // Full photo gallery for this profile, in display order. Falls back to
  // just [image] wherever it's left empty.
  final List<String> images;
  final int photoCount;
  final bool isPremium;
  final bool isFeatured;
  final bool isOnline;
  final String lastSeen;
  final String contactNo;
  final String email;

  // Extra fields used by the profile detail screen.
  final int age;
  final String height;
  final String maritalStatus;
  final String motherTongue;
  final String religion;
  final String education;
  final String profession;
  final String location;
  final String about;
  final String fatherOccupation;
  final String motherOccupation;
  final String siblings;
  final String community;
  final String diet;
  final String profileId;
  final String managedBy;
  final String birthDate;
  final String zodiac;
  final List<String> hobbies;
  final String familyStatus;
  final String familyFinancialStatus;
  final String professionDetail;
  final String annualIncomeSelf;
  final String annualIncomeFamily;
  final String educationField;

  const MatchProfileItem({
    required this.name,
    required this.line1,
    required this.line2,
    required this.image,
    this.images = const [],
    this.photoCount = 1,
    this.isPremium = false,
    this.isFeatured = false,
    this.isOnline = false,
    this.lastSeen = '',
    this.age = 0,
    this.height = '',
    this.maritalStatus = 'Never Married',
    this.motherTongue = '',
    this.religion = '',
    this.education = '',
    this.profession = '',
    this.location = '',
    this.about = '',
    this.fatherOccupation = '',
    this.motherOccupation = '',
    this.siblings = '',
    this.community = '',
    this.diet = '',
    this.profileId = '',
    this.managedBy = 'Self',
    this.birthDate = '',
    this.zodiac = '',
    this.hobbies = const [],
    this.contactNo = '+91 9876******',
    this.email = '****@gmail.com',
    this.familyStatus = '',
    this.familyFinancialStatus = '',
    this.professionDetail = '',
    this.annualIncomeSelf = '',
    this.annualIncomeFamily = '',
    this.educationField = '',
  });
}

/// Tabs, in the same order as the website.
enum _MatchTab {
  search('Search Results'),
  all('All Matches'),
  newlyJoined('Newly Joined'),
  shortlistedYou('Shortlisted You'),
  viewedYou('Viewed You'),
  shortlistedByYou('Shortlisted By You'),
  viewedByYou('Viewed By You'),
  online('Online'),
  profession('Profession Matches');

  final String label;
  const _MatchTab(this.label);
}

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  _MatchTab _tab = _MatchTab.all;

  // "Search Results" tab only appears after a search has been run.
  bool _hasSearched = false;

  // TODO: load saved searches from the API (and save one after each search).
  // Selecting one should re-run that search.
  final List<String> _savedSearches = [];

  // Profiles dismissed with "Don't show" (local only for now).
  // TODO: send to API so they stay hidden across sessions.
  final Set<String> _hidden = {};

  final TextEditingController _searchCtrl = TextEditingController();
  String _query = '';

  // Search-profiles icon in the header expands into a text field when tapped.
  bool _searchOpen = false;

  void _toggleSearch() {
    setState(() {
      _searchOpen = !_searchOpen;
      if (!_searchOpen) {
        _searchCtrl.clear();
        _query = '';
        FocusScope.of(context).unfocus();
      }
    });
  }

  List<_MatchTab> get _visibleTabs => [
    if (_hasSearched) _MatchTab.search,
    _MatchTab.all,
    _MatchTab.newlyJoined,
    _MatchTab.shortlistedYou,
    _MatchTab.viewedYou,
    _MatchTab.shortlistedByYou,
    _MatchTab.viewedByYou,
    _MatchTab.online,
    _MatchTab.profession,
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<HomeProvider>();
      provider.getAllMatches();
      provider.getNewMatches();
      provider.getViewedMe();
      provider.getViewedByMe();
      provider.getShortlistedYou();
      provider.getShortlistedByYou();
    });
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  // ---------------- API -> display model ----------------

  /// Runs [f], returning null if it throws (e.g. the model has no such field).
  T? _try<T>(T? Function() f) {
    try {
      return f();
    } catch (_) {
      return null;
    }
  }

  bool _flag(dynamic Function() f) =>
      _try<String>(() => f()?.toString())?.toLowerCase() == 'true';

  /// Converts any API match object (all_matches / new_matches / viewed_me /
  /// viewed_by_me / search results — near-identical classes) into the screen's
  /// display model. Reads fields dynamically so one function works for all of
  /// them, and picks up education / profession / online status / paid status
  /// whenever the API sends them.
  MatchProfileItem _fromApi(dynamic m) {
    final name = _try<String>(() => m.name?.toString()) ?? '';
    final age =
        int.tryParse(_try<String>(() => m.age?.toString()) ?? '') ?? 0;
    final height = _try<String>(() => m.height?.toString()) ?? '';
    final motherTongue = _try<String>(() => m.motherTongue?.toString()) ?? '';
    final community = _try<String>(() => m.community?.toString()) ?? '';
    final location = _try<String>(() => m.location?.toString()) ?? '';
    final image = _try<String>(() => m.imageUrl?.toString()) ?? '';
    final id = _try<String>(() => m.id?.toString()) ?? '';
    final education = _try<String>(() => m.education?.toString()) ?? '';
    final profession = _try<String>(() => m.profession?.toString()) ?? '';
    final lastSeen = _try<String>(() => m.lastSeen?.toString()) ?? '';
    final isPremium = _flag(() => m.isPremium) ||
        _flag(() => m.isPaid) ||
        _flag(() => m.isPaidMember);
    final isOnline = _flag(() => m.isOnline) || _flag(() => m.online);
    final isFeatured = _flag(() => m.isFeatured) ||
        _flag(() => m.featured) ||
        _flag(() => m.isFeaturedProfile);

    final line1 = [
      if (age > 0) '$age Yrs',
      if (height.isNotEmpty) height,
    ].join(', ');
    final line2 = [
      [
        if (motherTongue.isNotEmpty) motherTongue,
        if (community.isNotEmpty) community,
      ].join(', '),
      if (location.isNotEmpty) location,
    ].where((s) => s.isNotEmpty).join(' · ');

    return MatchProfileItem(
      name: name,
      line1: line1,
      line2: line2,
      image: image,
      age: age,
      height: height,
      motherTongue: motherTongue,
      community: community,
      education: education,
      profession: profession,
      location: location,
      profileId: id,
      isPremium: isPremium,
      isFeatured: isFeatured,
      isOnline: isOnline,
      lastSeen: lastSeen,
    );
  }

  List<MatchProfileItem> _fromList(List<dynamic>? list) =>
      (list ?? const []).map(_fromApi).toList();

  List<MatchProfileItem> get _tabProfiles {
    final provider = context.watch<HomeProvider>();

    switch (_tab) {
      case _MatchTab.search:
        return _fromList(context.watch<RegisterProvider>().searchModel?.data);
      case _MatchTab.all:
        return _fromList(provider.allMatchesModel?.matches);
      case _MatchTab.newlyJoined:
        return _fromList(provider.newMatchesModel?.matches);
      case _MatchTab.shortlistedYou:
        return _fromList(provider.shortlistedYouModel?.matches);
      case _MatchTab.viewedYou:
        return _fromList(provider.viewedMeModel?.matches);
      case _MatchTab.shortlistedByYou:
        final fromApi = _fromList(provider.shortlistedByYouModel?.matches);
        if (fromApi.isNotEmpty) return fromApi;
        // Fall back to the local shortlist toggled via ShortlistBadge in case
        // the API list hasn't caught up.
        return context.watch<ShortlistProvider>().shortlistedProfiles;
      case _MatchTab.viewedByYou:
        return _fromList(provider.viewedByMeModel?.matches);
      case _MatchTab.online:
        // No dedicated API: filter All Matches by online status.
        return _fromList(
          provider.allMatchesModel?.matches,
        ).where((p) => p.isOnline).toList();
      case _MatchTab.profession:
        // TODO: no API yet for "Profession Matches".
        return const [];
    }
  }

  String _keyOf(MatchProfileItem p) =>
      p.profileId.isNotEmpty ? p.profileId : p.name;

  List<MatchProfileItem> get _visibleProfiles {
    final q = _query.trim().toLowerCase();
    return _tabProfiles.where((p) {
      if (_hidden.contains(_keyOf(p))) return false;
      if (q.isEmpty) return true;
      return p.name.toLowerCase().contains(q) ||
          p.profileId.toLowerCase().contains(q);
    }).toList();
  }

  // ---------------- Actions ----------------

  Future<void> _openNewSearch() async {
    final searched = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => const SearchPreferencesScreen()),
    );
    if (searched == true && mounted) {
      setState(() {
        _hasSearched = true;
        _tab = _MatchTab.search;
      });
    }
  }

  void _onSearchMenu(String value) {
    if (value == 'new') {
      _openNewSearch();
    } else if (value.startsWith('saved:')) {
      // TODO: re-run the saved search at index int.parse(value.substring(6)).
    }
  }

  // ---------------- Build ----------------

  @override
  Widget build(BuildContext context) {
    final profiles = _visibleProfiles;
    final unread =
        context.watch<HomeProvider>().dashboardModel?.notifications?.unreadCount ??
        0;

    return Scaffold(
      backgroundColor: _pageBg,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(unread),
            SizedBox(height: 12.h),
            _buildTabs(),
            SizedBox(height: 8.h),
            Expanded(
              child: profiles.isEmpty
                  ? Center(
                      child: Text(
                        'There is no matches',
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 13.sp,
                          color: Colors.black45,
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
                      itemCount: profiles.length,
                      separatorBuilder: (_, __) => SizedBox(height: 14.h),
                      itemBuilder: (context, index) => _MatchProfileCard(
                        item: profiles[index],
                        allProfiles: profiles,
                        onDontShow: () =>
                            setState(() => _hidden.add(_keyOf(profiles[index]))),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- Header (one row): dropdown | search icon | bell | profile ----------------
  // Tapping the search icon swaps the dropdown for a search field (with a
  // close button); closing it restores the row.
  Widget _buildHeader(int unreadCount) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 12.h),
      child: _searchOpen
          ? Row(
              children: [
                Expanded(child: _buildSearchField()),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: _toggleSearch,
                  child: Icon(Icons.close, size: 24.sp, color: Colors.black87),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: _buildSearchDropdown()),
                SizedBox(width: 10.w),
                _headerCircleIcon(Icons.search, onTap: _toggleSearch),
                SizedBox(width: 10.w),
                _buildBell(unreadCount),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: () {
                    // TODO: open profile
                  },
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: genderAvatarFallback(
                        gender: UserGender.current,
                        width: 32.w,
                        height: 32.w,
                        fit: BoxFit.cover,
                        iconSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _headerCircleIcon(IconData icon, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(7.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary),
        ),
        child: Icon(icon, size: 20.sp, color: AppColors.primary),
      ),
    );
  }

  /// "New or Saved Search" dropdown.
  Widget _buildSearchDropdown() {
    return PopupMenuButton<String>(
      tooltip: 'New or Saved Search',
      offset: Offset(0, 46.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      onSelected: _onSearchMenu,
      itemBuilder: (_) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          enabled: false,
          height: 30.h,
          child: Text(
            'NEW OR SAVED SEARCH',
            style: GoogleFonts.tasaOrbiter(
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black45,
              letterSpacing: 0.6,
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'new',
          child: Row(
            children: [
              Icon(Icons.search, size: 18.sp, color: AppColors.primary),
              SizedBox(width: 8.w),
              Text(
                'New Search',
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<String>(
          enabled: false,
          height: 28.h,
          child: Text(
            'SAVED SEARCHES',
            style: GoogleFonts.tasaOrbiter(
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black45,
              letterSpacing: 0.6,
            ),
          ),
        ),
        if (_savedSearches.isEmpty)
          PopupMenuItem<String>(
            enabled: false,
            child: Text(
              'No saved searches yet',
              style: GoogleFonts.tasaOrbiter(
                fontSize: 12.sp,
                color: Colors.black45,
              ),
            ),
          )
        else
          for (int i = 0; i < _savedSearches.length; i++)
            PopupMenuItem<String>(
              value: 'saved:$i',
              child: Row(
                children: [
                  Icon(Icons.bookmark_border,
                      size: 18.sp, color: Colors.black54),
                  SizedBox(width: 8.w),
                  Flexible(
                    child: Text(
                      _savedSearches[i],
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.tasaOrbiter(fontSize: 13.sp),
                    ),
                  ),
                ],
              ),
            ),
      ],
      child: Container(
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(color: AppColors.primary),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'New or Saved Search',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(Icons.keyboard_arrow_down, size: 20.sp, color: Colors.black54),
          ],
        ),
      ),
    );
  }

  Widget _buildBell(int unreadCount) {
    return GestureDetector(
      onTap: () {
        // TODO: open notifications
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(7.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary),
            ),
            child: Icon(
              Icons.notifications_none,
              size: 20.sp,
              color: AppColors.primary,
            ),
          ),
          if (unreadCount > 0)
            Positioned(
              right: -3.w,
              top: -3.w,
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$unreadCount',
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
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEAE4),
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Row(
        children: [
          Icon(Icons.search, size: 18.sp, color: Colors.black45),
          SizedBox(width: 6.w),
          Expanded(
            child: TextField(
              controller: _searchCtrl,
              autofocus: true,
              onChanged: (v) => setState(() => _query = v),
              style: GoogleFonts.tasaOrbiter(fontSize: 13.sp),
              decoration: InputDecoration(
                hintText: 'Search Profiles...',
                hintStyle: GoogleFonts.tasaOrbiter(
                  fontSize: 12.sp,
                  color: Colors.black45,
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          if (_query.isNotEmpty)
            GestureDetector(
              onTap: () {
                _searchCtrl.clear();
                FocusScope.of(context).unfocus();
                setState(() => _query = '');
              },
              child: Icon(Icons.close, size: 18.sp, color: Colors.black54),
            ),
        ],
      ),
    );
  }

  // ---------------- Tabs ----------------
  Widget _buildTabs() {
    final tabs = _visibleTabs;
    return SizedBox(
      height: 36.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: tabs.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final t = tabs[index];
          final selected = _tab == t;
          return InkWell(
            onTap: () => setState(() => _tab = t),
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: selected ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: selected ? AppColors.primary : const Color(0xFFE0E0E0),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                t.label,
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : Colors.black87,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// A single match card (mobile version of the website card): large photo on
/// top with the Shortlist chip, and all the details underneath — chips,
/// name, ID + last seen, details line, contact icons and action buttons.
/// Featured profiles also get a primary-coloured border and a
/// "Featured Profile" tab.
class _MatchProfileCard extends StatefulWidget {
  final MatchProfileItem item;
  final List<MatchProfileItem> allProfiles;
  final VoidCallback? onDontShow;

  const _MatchProfileCard({
    required this.item,
    this.allProfiles = const [],
    this.onDontShow,
  });

  @override
  State<_MatchProfileCard> createState() => _MatchProfileCardState();
}

class _MatchProfileCardState extends State<_MatchProfileCard> {
  // TODO: hook up to the send-interest API and the real interest status.
  bool _interestSent = false;

  MatchProfileItem get item => widget.item;

  String get _details => [
    if (item.age > 0) '${item.age} yrs',
    if (item.height.isNotEmpty) item.height,
    if (item.community.isNotEmpty)
      item.community
    else if (item.motherTongue.isNotEmpty)
      item.motherTongue,
    if (item.education.isNotEmpty) item.education,
    if (item.profession.isNotEmpty) item.profession,
    if (item.location.isNotEmpty) item.location,
  ].join('  •  ');

  String get _activity {
    if (item.isOnline) return 'Online now';
    if (item.lastSeen.isNotEmpty) return 'Last seen ${item.lastSeen}';
    return 'Recently no activity';
  }

  void _openDetail() => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => MatchProfileDetailScreen(
        item: item,
        allProfiles: widget.allProfiles,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: _openDetail,
      child: _buildCard(),
    );
  }

  Widget _buildCard() {
    final featured = item.isFeatured;

    final body = Container(
      padding: EdgeInsets.fromLTRB(12.w, featured ? 24.h : 12.h, 12.w, 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: featured
            ? Border.all(color: AppColors.primary, width: 1.5)
            : null,
        boxShadow: [
          BoxShadow(
            color: featured
                ? AppColors.primary.withValues(alpha: 0.22)
                : Colors.black.withValues(alpha: 0.05),
            blurRadius: featured ? 16 : 10,
            offset: Offset(0, featured ? 4 : 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Large, eye-catching photo
          _photo(
            width: double.infinity,
            height: 240.h,
            radius: 14.r,
            gradient: true,
          ),
          SizedBox(height: 12.h),
          // Verified / Paid chips + contact icons
          Row(
            children: [
              Expanded(child: _badges()),
              _contactIcons(),
            ],
          ),
          SizedBox(height: 10.h),
          _nameRow(fontSize: 20.sp),
          SizedBox(height: 2.h),
          _idLine(),
          SizedBox(height: 8.h),
          _detailsText(maxLines: 5, fontSize: 13.sp),
          SizedBox(height: 14.h),
          _actionButtons(),
        ],
      ),
    );

    if (!featured) return body;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        body,
        // "Featured Profile" tab hanging from the top border
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                border: Border.all(color: AppColors.primary, width: 1.5),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10.r),
                ),
              ),
              child: Text(
                'Featured Profile',
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ---------------- Shared pieces ----------------

  Widget _photo({
    required double width,
    required double height,
    required double radius,
    bool gradient = false,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            matchProfileImage(
              item.image,
              width: width,
              height: height,
              errorIconSize: 48.sp,
            ),
            if (gradient)
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withValues(alpha: 0.25)],
                    stops: const [0.65, 1.0],
                  ),
                ),
              ),
            Positioned(
              top: 8.h,
              left: 8.w,
              child: ShortlistBadge(profile: item),
            ),
            if (gradient)
              Positioned(
                bottom: 10.h,
                right: 10.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.55),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.photo_camera_outlined,
                          size: 13.sp, color: Colors.white),
                      SizedBox(width: 4.w),
                      Text(
                        '${item.photoCount}',
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 11.sp,
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
    );
  }

  Widget _badges() {
    return Wrap(
      spacing: 6.w,
      runSpacing: 4.h,
      children: [
        _chip(
          Icons.verified,
          'Verified',
          _verifiedBlue,
          const Color(0xFFEAF2FF),
        ),
        if (item.isPremium)
          _chip(
            Icons.workspace_premium,
            'Paid Member',
            _paidPurple,
            const Color(0xFFEFEAF8),
          ),
      ],
    );
  }

  Widget _nameRow({required double fontSize}) {
    return Row(
      children: [
        Flexible(
          child: Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.tasaOrbiter(
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
        ),
        if (item.isOnline) ...[
          SizedBox(width: 6.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: const Color(0xFF2E8B57)),
            ),
            child: Text(
              'Online',
              style: GoogleFonts.tasaOrbiter(
                fontSize: 9.sp,
                color: const Color(0xFF2E8B57),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _idLine() {
    return Text(
      [if (item.profileId.isNotEmpty) item.profileId, _activity].join('  |  '),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.tasaOrbiter(fontSize: 10.sp, color: Colors.black45),
    );
  }

  Widget _detailsText({required int maxLines, double? fontSize}) {
    return Text(
      _details,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.tasaOrbiter(
        fontSize: fontSize ?? 12.sp,
        color: Colors.black87,
        height: 1.35,
      ),
    );
  }

  Widget _contactIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _roundIcon(Icons.share),
        SizedBox(width: 8.w),
        _roundIcon(Icons.call),
        SizedBox(width: 8.w),
        // No WhatsApp icon in Material Icons; swap in a brand asset if you
        // have one.
        _roundIcon(Icons.chat),
      ],
    );
  }

  Widget _actionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: widget.onDontShow,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.black87),
              padding: EdgeInsets.symmetric(vertical: 10.h),
              shape: const StadiumBorder(),
            ),
            child: Text(
              "Don't show",
              style: GoogleFonts.tasaOrbiter(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: ElevatedButton(
            onPressed: _interestSent
                ? null
                : () => setState(() => _interestSent = true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.55),
              elevation: 0,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              shape: const StadiumBorder(),
            ),
            child: Text(
              _interestSent ? 'Awaiting Response' : 'Send Interest',
              style: GoogleFonts.tasaOrbiter(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _chip(IconData icon, String label, Color fg, Color bg) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13.sp, color: fg),
          SizedBox(width: 4.w),
          Text(
            label,
            style: GoogleFonts.tasaOrbiter(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: fg,
            ),
          ),
        ],
      ),
    );
  }

  Widget _roundIcon(IconData icon) {
    return GestureDetector(
      onTap: () {
        // TODO: share / call / WhatsApp
      },
      child: Container(
        width: 30.w,
        height: 30.w,
        decoration: const BoxDecoration(
          color: _darkRed,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 15.sp, color: Colors.white),
      ),
    );
  }
}