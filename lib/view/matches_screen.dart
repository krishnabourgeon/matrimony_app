// // Bandhan 2026 — Premium Matches Screen
// import 'package:flutter/material.dart';
// import 'package:matrimony_app/model/profile_model.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/custom_widgets/profile_image.dart';
// import 'package:matrimony_app/view/user_detail_screen.dart';

// class MatchesScreen extends StatefulWidget {
//   const MatchesScreen({super.key});
//   @override
//   State<MatchesScreen> createState() => _MatchesScreenState();
// }

// class _MatchesScreenState extends State<MatchesScreen> with SingleTickerProviderStateMixin {
//   late TabController _tab;
//   late List<Profile> _profiles;
//   final _tabs = ['All Matches', 'Premium', 'Near You', 'New', 'Compatible'];

//   @override
//   void initState() {
//     super.initState();
//     _profiles = List.from(appProfiles);
//     _tab = TabController(length: 5, vsync: this);
//     _tab.addListener(() => setState(() {}));
//   }

//   @override
//   void dispose() { _tab.dispose(); super.dispose(); }

//   @override
//   Widget build(BuildContext context) {
//     final top = MediaQuery.of(context).padding.top;
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: Column(children: [
//         _buildHero(top),
//         _buildTabBar(),
//         Expanded(child: TabBarView(controller: _tab, children: List.generate(5, (_) => _buildList()))),
//       ]),
//     );
//   }

//   Widget _buildHero(double top) {
//     return Container(
//       decoration: BoxDecoration(gradient: AppColors.gradHero, boxShadow: AppColors.shadowMd),
//       child: Column(children: [
//         Padding(
//           padding: EdgeInsets.fromLTRB(20, top + 16, 20, 0),
//           child: Row(children: [
//             Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               const Text('Your Matches', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900, letterSpacing: -0.6)),
//               const SizedBox(height: 4),
//               Row(children: [
//                 Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFF4ADE80), shape: BoxShape.circle)),
//                 const SizedBox(width: 6),
//                 const Text('128 profiles matching your preferences', style: TextStyle(color: Colors.white70, fontSize: 12)),
//               ]),
//             ])),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//               decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
//               child: const Row(children: [
//                 Icon(Icons.tune_rounded, color: Colors.white, size: 16),
//                 SizedBox(width: 6),
//                 Text('Filter', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
//               ]),
//             ),
//           ]),
//         ),
//         const SizedBox(height: 14),
//         // Quick filter chips horizontal scroll
//         SizedBox(height: 36, child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16), children: [
//           ...[('Age 24-30', true), ('Hindu', false), ('Kerala', false), ('Software', false), ('Verified', false)].map((c) => Container(
//             margin: const EdgeInsets.only(right: 8),
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             decoration: BoxDecoration(
//               color: c.$2 ? Colors.white : Colors.white.withOpacity(0.15),
//               borderRadius: BorderRadius.circular(20),
//               border: c.$2 ? null : Border.all(color: Colors.white30),
//             ),
//             child: Text(c.$1, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600,
//                 color: c.$2 ? AppColors.primary : Colors.white)),
//           )),
//         ])),
//         const SizedBox(height: 16),
//       ]),
//     );
//   }

//   Widget _buildTabBar() {
//     return Container(
//       color: AppColors.surface,
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//       child: Container(
//         height: 40,
//         padding: const EdgeInsets.all(3),
//         decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(AppColors.r12)),
//         child: TabBar(
//           controller: _tab,
//           isScrollable: true,
//           tabAlignment: TabAlignment.start,
//           indicator: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(10), boxShadow: AppColors.shadowPrimary),
//           indicatorSize: TabBarIndicatorSize.tab,
//           dividerColor: Colors.transparent,
//           labelColor: Colors.white,
//           unselectedLabelColor: AppColors.textHint,
//           labelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
//           unselectedLabelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
//           tabs: _tabs.map((t) => Tab(text: t)).toList(),
//         ),
//       ),
//     );
//   }

//   Widget _buildList() => ListView.builder(
//     padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
//     physics: const BouncingScrollPhysics(),
//     itemCount: _profiles.length,
//     itemBuilder: (ctx, i) => _ProfileCard(
//       profile: _profiles[i],
//       onLike: () => setState(() => _profiles[i].liked = !_profiles[i].liked),
//       onInterest: () => setState(() => _profiles[i].interested = !_profiles[i].interested),
//       onShortlist: () => setState(() => _profiles[i].shortlisted = !_profiles[i].shortlisted),
//     ),
//   );
// }

// // ─── Profile Card ─────────────────────────────────────────────────────────────
// class _ProfileCard extends StatelessWidget {
//   final Profile profile;
//   final VoidCallback onLike, onInterest, onShortlist;
//   const _ProfileCard({required this.profile, required this.onLike, required this.onInterest, required this.onShortlist});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppColors.r20), boxShadow: AppColors.shadowSm),
//       child: Column(children: [
//         // Photo area
//         ClipRRect(
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(AppColors.r20)),
//           child: AspectRatio(
//             aspectRatio: 1.0,
//             child: Stack(fit: StackFit.expand, children: [
//               ProfileImage(profile.image, fit: BoxFit.cover,
//                   errorWidget: Container(color: AppColors.primaryLight,
//                       child: const Icon(Icons.person, size: 80, color: AppColors.primary))),
//               const DecoratedBox(decoration: BoxDecoration(gradient: AppColors.gradCard)),
//               // Match %
//               Positioned(top: 14, left: 14, child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 decoration: BoxDecoration(gradient: AppColors.gradGold, borderRadius: BorderRadius.circular(20), boxShadow: AppColors.shadowGold),
//                 child: Row(mainAxisSize: MainAxisSize.min, children: [
//                   const Icon(Icons.favorite_rounded, color: Colors.white, size: 10),
//                   const SizedBox(width: 4),
//                   Text('${profile.matchPct ?? "--"}% Match', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w900)),
//                 ]),
//               )),
//               // Shortlist top right
//               Positioned(top: 14, right: 14, child: GestureDetector(
//                 onTap: onShortlist,
//                 child: Container(width: 36, height: 36,
//                   decoration: BoxDecoration(color: profile.shortlisted ? AppColors.gold : Colors.black.withOpacity(0.4), shape: BoxShape.circle),
//                   child: Icon(profile.shortlisted ? Icons.bookmark_rounded : Icons.bookmark_border_rounded, color: Colors.white, size: 18)),
//               )),
//               // Badge row
//               Positioned(top: 58, left: 14, child: Row(children: [
//                 if (profile.verified) _Badge('Verified', AppColors.blue, Icons.verified_rounded),
//                 if (profile.premium) Padding(padding: const EdgeInsets.only(left: 6), child: _Badge('Premium', AppColors.gold, Icons.workspace_premium_rounded)),
//                 if (profile.assistedService) Padding(padding: const EdgeInsets.only(left: 6), child: _Badge('Assisted', AppColors.success, Icons.support_agent_rounded)),
//               ])),
//               // Bottom name overlay
//               Positioned(left: 0, right: 0, bottom: 0, child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
//                   Text('${profile.name}, ${profile.age}',
//                       maxLines: 1, overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: -0.4)),
//                   Text('${profile.profession} · ${profile.city}',
//                       maxLines: 1, overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(color: Color(0xCCFFFFFF), fontSize: 13)),
//                 ]),
//               )),
//             ]),
//           ),
//         ),
//         // Detail section
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(children: [
//             // Info grid
//             Row(children: [
//               Expanded(child: _InfoItem(Icons.school_outlined, profile.education)),
//               const SizedBox(width: 10),
//               Expanded(child: _InfoItem(Icons.height_rounded, profile.height)),
//             ]),
//             const SizedBox(height: 8),
//             Row(children: [
//               Expanded(child: _InfoItem(Icons.temple_hindu_outlined, '${profile.religion} · ${profile.caste}')),
//               const SizedBox(width: 10),
//               Expanded(child: _InfoItem(Icons.account_balance_wallet_outlined, profile.income)),
//             ]),
//             const SizedBox(height: 8),
//             Row(children: [
//               const Icon(Icons.access_time_rounded, size: 12, color: AppColors.textHint),
//               const SizedBox(width: 5),
//               Flexible(child: Text(profile.lastSeen, style: const TextStyle(fontSize: 11, color: AppColors.textHint))),
//               const SizedBox(width: 8),
//               Text('· ${profile.profileId}', style: const TextStyle(fontSize: 11, color: AppColors.textHint)),
//             ]),
//             const SizedBox(height: 14),
//             // Action buttons
//             Row(children: [
//               // Like
//               GestureDetector(onTap: onLike, child: Container(width: 44, height: 44,
//                 decoration: BoxDecoration(color: profile.liked ? AppColors.primaryLight : AppColors.surfaceVariant, shape: BoxShape.circle),
//                 child: Icon(profile.liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
//                     color: profile.liked ? AppColors.primary : AppColors.textHint, size: 20))),
//               const SizedBox(width: 8),
//               // View Profile
//               Expanded(child: GestureDetector(
//                 onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => UserDetailScreen(profile: profile))),
//                 child: Container(
//                 height: 44,
//                 decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(AppColors.r32), border: Border.all(color: AppColors.border)),
//                 child: const Center(child: Text('View Profile', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textSecondary))),
//               ))),
//               const SizedBox(width: 8),
//               // Express Interest
//               Expanded(flex: 2, child: GestureDetector(onTap: onInterest, child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 200),
//                 height: 44,
//                 decoration: BoxDecoration(
//                   gradient: profile.interested ? null : AppColors.gradPrimary,
//                   color: profile.interested ? AppColors.primaryLight : null,
//                   borderRadius: BorderRadius.circular(AppColors.r32),
//                   border: profile.interested ? Border.all(color: AppColors.primary) : null,
//                   boxShadow: profile.interested ? null : AppColors.shadowPrimary,
//                 ),
//                 child: Center(child: Row(mainAxisSize: MainAxisSize.min, children: [
//                   Icon(profile.interested ? Icons.check_rounded : Icons.favorite_border_rounded,
//                       color: profile.interested ? AppColors.primary : Colors.white, size: 15),
//                   const SizedBox(width: 6),
//                   Text(profile.interested ? 'Interest Sent!' : 'Express Interest',
//                       style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800,
//                           color: profile.interested ? AppColors.primary : Colors.white)),
//                 ])),
//               ))),
//             ]),
//           ]),
//         ),
//       ]),
//     );
//   }
// }

// class _Badge extends StatelessWidget {
//   final String label; final Color color; final IconData icon;
//   const _Badge(this.label, this.color, this.icon);
//   @override
//   Widget build(BuildContext context) => Container(
//     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//     decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
//     child: Row(mainAxisSize: MainAxisSize.min, children: [
//       Icon(icon, color: Colors.white, size: 10), const SizedBox(width: 4),
//       Text(label, style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w800)),
//     ]),
//   );
// }

// class _InfoItem extends StatelessWidget {
//   final IconData icon; final String text;
//   const _InfoItem(this.icon, this.text);
//   @override
//   Widget build(BuildContext context) => Row(children: [
//     Icon(icon, size: 13, color: AppColors.textHint), const SizedBox(width: 5),
//     Expanded(child: Text(text, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary), maxLines: 1, overflow: TextOverflow.ellipsis)),
//   ]);
// }







import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/match_profile_detail_screen.dart';
import 'package:matrimony_app/view/search_preferences_screen.dart';

class MatchProfileItem {
  final String name;
  final String line1;
  final String line2;
  final String image;
  final int photoCount;
  final bool isPremium;
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
    this.photoCount = 1,
    this.isPremium = false,
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
    this.email ='****@gmail.com',
    this.familyStatus = '',
    this.familyFinancialStatus = '',
    this.professionDetail = '',
    this.annualIncomeSelf = '',
    this.annualIncomeFamily = '',
    this.educationField = '',
  });
}

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  int _activeTab = 1; // "New" selected by default, matching reference
  int _navIndex = 1; // Matches tab active

  final List<String> tabs = const ['Search', 'New (10)', 'Daily (20)', 'My Matches'];

  final List<MatchProfileItem> profiles = const [
    MatchProfileItem(
      name: 'Swathy Mohan',
      line1: "26 Yrs, 5'2\" · Finance Professional",
      line2: 'Malayalam, Thiyya · Kozhikode, Kerala',
      image: 'assets/image/user1.png',
      photoCount: 4,
      age: 26,
      height: "5'2\"",
      motherTongue: 'Malayalam',
      religion: 'Hindu',
      community: 'Thiyya',
      education: 'PGDM',
      profession: 'Finance Professional',
      location: 'Kozhikode, Kerala',
      about:
          "Hello, I'm Swathy Mohan, born and raised in Kerala. I am a Finance Professional "
          'working with a reputed IT company in Kochi. My friends describe me as independent, '
          'responsible, and understanding. Outside work, I enjoy reading, music, and fitness. '
          'I value traditions while being open to modern perspectives.',
      fatherOccupation: 'Employed',
      motherOccupation: 'Homemaker',
      siblings: '1 Brother Married',
      diet: 'Non-Vegetarian',
      profileId: 'SH536637002',
      managedBy: 'Self',
      birthDate: '07 Jun 1999',
      zodiac: 'Gemini',
      hobbies: const ['Dancing', 'Cooking', 'Traveling', 'Music', 'Foodie'],
      familyStatus: 'Moderate',
      familyFinancialStatus: 'Aspiring - Annual family income is up to 30 lakhs',
      professionDetail: 'Finance Profession in a private Company',
      annualIncomeSelf: 'INR 8 - 20 Lakh',
      annualIncomeFamily: 'INR 10 - 30 Lakh',
      educationField: 'Management',
    ),
    MatchProfileItem(
      name: 'Geethu',
      line1: "26 Yrs, 5'2\" · Finance Professional",
      line2: 'Malayalam, Thiyya · Kozhikode, Kerala',
      image: 'assets/image/user3.png',
      photoCount: 4,
      isPremium: true,
      age: 26,
      height: "5'2\"",
      motherTongue: 'Malayalam',
      religion: 'Hindu',
      community: 'Thiyya',
      education: 'MBA Finance',
      profession: 'Finance Professional',
      location: 'Kozhikode, Kerala',
      about:
          'Geethu is warm, ambitious and family-oriented. She loves travelling and '
          'reading, and is looking for a supportive partner who shares similar values.',
      fatherOccupation: 'Government Employee',
      motherOccupation: 'Teacher',
      siblings: '1 Brother (Unmarried)',
      diet: 'Vegetarian',
      profileId: 'SH412298',
      managedBy: 'Self',
      birthDate: '14 Mar 1999',
      zodiac: 'Pisces',
      hobbies: const ['Reading', 'Traveling', 'Cooking'],
      familyStatus: 'Moderate',
      familyFinancialStatus: 'Moderate - Annual family income is up to 20 lakhs',
      professionDetail: 'Finance Profession in a private Company',
      annualIncomeSelf: 'INR 6 - 10 Lakh',
      annualIncomeFamily: 'INR 8 - 20 Lakh',
      educationField: 'Finance',
    ),
    MatchProfileItem(
      name: 'Meenakshi',
      line1: "28 Yrs, 5'2\" · Finance Professional",
      line2: 'Malayalam, Thiyya · Kozhikode, Kerala',
      image: 'assets/image/user2.png',
      photoCount: 4,
      age: 28,
      height: "5'2\"",
      motherTongue: 'Malayalam',
      religion: 'Hindu',
      community: 'Thiyya',
      education: 'MBA Finance',
      profession: 'Finance Professional',
      location: 'Kozhikode, Kerala',
      about:
          'Meenakshi is disciplined and caring, with a passion for classical dance and '
          'community service. Looking for a genuine, understanding life partner.',
      fatherOccupation: 'Retired Bank Officer',
      motherOccupation: 'Homemaker',
      siblings: 'None',
      diet: 'Vegetarian',
      profileId: 'SH398711',
      managedBy: 'Parent',
      birthDate: '02 Nov 1997',
      zodiac: 'Scorpio',
      hobbies: const ['Dancing', 'Volunteering'],
      familyStatus: 'Rich',
      familyFinancialStatus: 'Affluent - Annual family income is above 40 lakhs',
      professionDetail: 'Finance Profession in a private Company',
      annualIncomeSelf: 'INR 8 - 15 Lakh',
      annualIncomeFamily: 'INR 15 - 40 Lakh',
      educationField: 'Finance',
    ),
  ];

  // Distinct set shown under the "Daily (20)" tab — refreshed picks for today.
  final List<MatchProfileItem> dailyProfiles = const [
    MatchProfileItem(
      name: 'Anushka',
      line1: "23 Yrs, 5'4\" · Software Engineer",
      line2: 'Malayalam, Nair · Thrissur, Kerala',
      image: 'assets/image/archana.png',
      photoCount: 3,
      age: 23,
      height: "5'4\"",
      motherTongue: 'Malayalam',
      religion: 'Hindu',
      community: 'Nair',
      education: 'B.Tech CSE',
      profession: 'Software Engineer',
      location: 'Thrissur, Kerala',
      about:
          'Anushka is a software engineer who loves travelling and photography. '
          'Looking for a partner who is honest, family-oriented and easy going.',
      fatherOccupation: 'Business',
      motherOccupation: 'Homemaker',
      siblings: '1 Brother (Married)',
      diet: 'Non-Vegetarian',
      profileId: 'SH225671',
      managedBy: 'Self',
      birthDate: '19 Aug 2002',
      zodiac: 'Leo',
      hobbies: const ['Travelling', 'Photography'],
      familyStatus: 'Moderate',
      familyFinancialStatus: 'Moderate - Annual family income is up to 20 lakhs',
      professionDetail: 'Software Engineer in an IT Company',
      annualIncomeSelf: 'INR 6 - 12 Lakh',
      annualIncomeFamily: 'INR 10 - 20 Lakh',
      educationField: 'Computer Science',
    ),
    MatchProfileItem(
      name: 'Aishwarya',
      line1: "24 Yrs, 5'3\" · Doctor",
      line2: 'Malayalam, Nair · Palakkad, Kerala',
      image: 'assets/image/priya.png',
      photoCount: 3,
      isPremium: true,
      age: 24,
      height: "5'3\"",
      motherTongue: 'Malayalam',
      religion: 'Hindu',
      community: 'Nair',
      education: 'MBBS',
      profession: 'Doctor',
      location: 'Palakkad, Kerala',
      about:
          'Aishwarya is a doctor who enjoys cooking and classical dance. '
          'Seeking a caring, like-minded partner to share life with.',
      fatherOccupation: 'Doctor',
      motherOccupation: 'Doctor',
      siblings: '1 Sister (Unmarried)',
      diet: 'Vegetarian',
      profileId: 'SH334982',
      managedBy: 'Self',
      birthDate: '05 Feb 2001',
      zodiac: 'Aquarius',
      hobbies: const ['Cooking', 'Classical Dance'],
      familyStatus: 'Rich',
      familyFinancialStatus: 'Affluent - Annual family income is above 40 lakhs',
      professionDetail: 'Medical Professional at a private Hospital',
      annualIncomeSelf: 'INR 12 - 20 Lakh',
      annualIncomeFamily: 'INR 20 - 40 Lakh',
      educationField: 'Medicine',
    ),
    MatchProfileItem(
      name: 'Chandhini',
      line1: "26 Yrs, 5'2\" · Architect",
      line2: 'Malayalam, Nair · Ernakulam, Kerala',
      image: 'assets/image/riys.png',
      photoCount: 3,
      age: 26,
      height: "5'2\"",
      motherTongue: 'Malayalam',
      religion: 'Hindu',
      community: 'Nair',
      education: 'B.Arch',
      profession: 'Architect',
      location: 'Ernakulam, Kerala',
      about:
          'Chandhini is an architect with a passion for art and design. '
          'Looking for a genuine, understanding life partner.',
      fatherOccupation: 'Engineer',
      motherOccupation: 'Homemaker',
      siblings: 'None',
      diet: 'Vegetarian',
      profileId: 'SH551029',
      managedBy: 'Self',
      birthDate: '21 Sep 1999',
      zodiac: 'Virgo',
      hobbies: const ['Art', 'Design', 'Travelling'],
      familyStatus: 'Moderate',
      familyFinancialStatus: 'Moderate - Annual family income is up to 25 lakhs',
      professionDetail: 'Architect at a private Firm',
      annualIncomeSelf: 'INR 7 - 14 Lakh',
      annualIncomeFamily: 'INR 12 - 25 Lakh',
      educationField: 'Architecture',
    ),
  ];

  // Small round-avatar row shown at the top of the "My Matches" tab.
  final List<MatchProfileItem> preferenceMatches = const [
    MatchProfileItem(
      name: 'Chandhini',
      line1: "26 Yrs, 5'2\"",
      line2: 'Ernakulam, Kerala',
      image: 'assets/image/riys.png',
      age: 26,
      height: "5'2\"",
      location: 'Ernakulam, Kerala',
    ),
    MatchProfileItem(
      name: 'Dhanya',
      line1: "25 Yrs, 5'2\"",
      line2: 'Kannur, Kerala',
      image: 'assets/image/archana.png',
      age: 25,
      height: "5'2\"",
      location: 'Kannur, Kerala',
    ),
    MatchProfileItem(
      name: 'Meera',
      line1: "24 Yrs, 5'2\"",
      line2: 'Alappuzha, Kerala',
      image: 'assets/image/priya.png',
      age: 24,
      height: "5'2\"",
      location: 'Alappuzha, Kerala',
    ),
  ];

  // Full cards shown under the "My Matches" tab.
  final List<MatchProfileItem> myMatchesProfiles = const [
    MatchProfileItem(
      name: 'Saranya',
      line1: "24 Yrs, 5'2\" · Human Resource Manager",
      line2: 'Malayalam, Vishwakarma · Palakkad, Kerala',
      image: 'assets/image/user1.png',
      photoCount: 4,
      age: 24,
      height: "5'2\"",
      motherTongue: 'Malayalam',
      religion: 'Hindu',
      community: 'Vishwakarma',
      education: 'MBA HR',
      profession: 'Human Resource Manager',
      location: 'Palakkad, Kerala',
      about:
          'Saranya works as an HR manager and enjoys reading and classical music. '
          'Looking for a caring, understanding partner.',
      fatherOccupation: 'Business',
      motherOccupation: 'Homemaker',
      siblings: '1 Brother (Married)',
      diet: 'Vegetarian',
      profileId: 'SH667340',
      managedBy: 'Self',
      birthDate: '11 Jan 2001',
      zodiac: 'Capricorn',
      hobbies: const ['Reading', 'Classical Music'],
      familyStatus: 'Moderate',
      familyFinancialStatus: 'Moderate - Annual family income is up to 20 lakhs',
      professionDetail: 'HR Profession in a private Company',
      annualIncomeSelf: 'INR 6 - 10 Lakh',
      annualIncomeFamily: 'INR 8 - 20 Lakh',
      educationField: 'Human Resources',
    ),
    MatchProfileItem(
      name: 'Devika',
      line1: "25 Yrs, 5'3\" · Bank Officer",
      line2: 'Malayalam, Vishwakarma · Kollam, Kerala',
      image: 'assets/image/user2.png',
      photoCount: 3,
      age: 25,
      height: "5'3\"",
      motherTongue: 'Malayalam',
      religion: 'Hindu',
      community: 'Vishwakarma',
      education: 'MBA Finance',
      profession: 'Bank Officer',
      location: 'Kollam, Kerala',
      about:
          'Devika is a bank officer who loves painting and yoga. '
          'Looking for a sincere, family-oriented partner.',
      fatherOccupation: 'Farmer',
      motherOccupation: 'Homemaker',
      siblings: 'None',
      diet: 'Vegetarian',
      profileId: 'SH778213',
      managedBy: 'Self',
      birthDate: '30 Apr 2000',
      zodiac: 'Taurus',
      hobbies: const ['Painting', 'Yoga'],
      familyStatus: 'Moderate',
      familyFinancialStatus: 'Moderate - Annual family income is up to 20 lakhs',
      professionDetail: 'Banking Profession at a nationalised Bank',
      annualIncomeSelf: 'INR 6 - 10 Lakh',
      annualIncomeFamily: 'INR 8 - 20 Lakh',
      educationField: 'Finance',
    ),
    MatchProfileItem(
      name: 'Anjali',
      line1: "23 Yrs, 5'2\" · Teacher",
      line2: 'Malayalam, Vishwakarma · Kottayam, Kerala',
      image: 'assets/image/user3.png',
      photoCount: 3,
      age: 23,
      height: "5'2\"",
      motherTongue: 'Malayalam',
      religion: 'Hindu',
      community: 'Vishwakarma',
      education: 'B.Ed',
      profession: 'Teacher',
      location: 'Kottayam, Kerala',
      about:
          'Anjali is a school teacher who enjoys storytelling and gardening. '
          'Seeking a kind, understanding life partner.',
      fatherOccupation: 'Government Employee',
      motherOccupation: 'Teacher',
      siblings: '1 Sister (Married)',
      diet: 'Vegetarian',
      profileId: 'SH889456',
      managedBy: 'Parent',
      birthDate: '17 Jul 2002',
      zodiac: 'Cancer',
      hobbies: const ['Storytelling', 'Gardening'],
      familyStatus: 'Moderate',
      familyFinancialStatus: 'Moderate - Annual family income is up to 20 lakhs',
      professionDetail: 'Teaching Profession at a Government School',
      annualIncomeSelf: 'INR 4 - 8 Lakh',
      annualIncomeFamily: 'INR 8 - 20 Lakh',
      educationField: 'Education',
    ),
  ];

  List<MatchProfileItem> get _currentProfiles =>
      _activeTab == 2 ? dailyProfiles : _activeTab == 3 ? myMatchesProfiles : profiles;

  @override
  Widget build(BuildContext context) {
    final currentProfiles = _currentProfiles;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 10.h),
            _buildTabs(),
            SizedBox(height: 8.h),
            if (_activeTab == 0) ...[
              _buildSearchByLocationBar(),
              SizedBox(height: 8.h),
            ],
            Expanded(
              child: _activeTab == 3
                  ? _buildMyMatchesBody()
                  : ListView.separated(
                      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
                      itemCount: currentProfiles.length,
                      separatorBuilder: (_, __) => SizedBox(height: 14.h),
                      itemBuilder: (context, index) => _MatchProfileCard(
                        item: currentProfiles[index],
                        allProfiles: currentProfiles,
                      ),
                    ),
            ),
          ],
        ),
      ),

    );
  }

  // ---------------- "Search by location" bar (Search tab) ----------------
  Widget _buildSearchByLocationBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SearchPreferencesScreen()),
        ),
        child: Container(
          height: 42.h,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              Icon(Icons.search, size: 17.sp, color: Colors.black45),
              SizedBox(width: 8.w),
              Text(
                'Search by location',
                style: GoogleFonts.tasaOrbiter(fontSize: 12.5.sp, color: Colors.black45),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- "My Matches" tab body ----------------
  Widget _buildMyMatchesBody() {
    return ListView(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Matching most of your preferences',
                style: GoogleFonts.tasaOrbiter(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.edit_outlined, size: 13.sp, color: const Color(0xFF5A6ACF)),
                  SizedBox(width: 3.w),
                  Text('Edit', style: GoogleFonts.tasaOrbiter(fontSize: 12.sp, fontWeight: FontWeight.w600, color: const Color(0xFF5A6ACF))),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 195.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: preferenceMatches.length,
            separatorBuilder: (_, __) => SizedBox(width: 10.w),
            itemBuilder: (context, index) => _SmallMatchCard(
              item: preferenceMatches[index],
              allProfiles: preferenceMatches,
            ),
          ),
        ),
        SizedBox(height: 16.h),
       // _buildFilterSortBar(),
        SizedBox(height: 16.h),
        ...myMatchesProfiles.map(
          (p) => Padding(
            padding: EdgeInsets.only(bottom: 14.h),
            child: _MatchProfileCard(item: p, allProfiles: myMatchesProfiles),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
      child: Row(
        children: [
          Icon(Icons.menu, size: 22.sp, color: Colors.black87),
          SizedBox(width: 10.w),
          Text(
            'Matches',
            style: GoogleFonts.tasaOrbiter(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return SizedBox(
      height: 34.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: tabs.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final selected = _activeTab == index;
          final isSearch = index == 0;
          return InkWell(
            onTap: () => setState(() => _activeTab = index),
            borderRadius: BorderRadius.circular(18.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
              decoration: BoxDecoration(
                color: selected ? AppColors.coral : Colors.white,
                borderRadius: BorderRadius.circular(18.r),
                border: Border.all(color: selected ? AppColors.coral : const Color(0xFFE0E0E0)),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isSearch) ...[
                    Icon(Icons.search, size: 13.sp, color: selected ? Colors.white : Colors.black54),
                    SizedBox(width: 4.w),
                  ],
                  Text(
                    tabs[index],
                    style: GoogleFonts.tasaOrbiter(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: selected ? Colors.white : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterSortBar() {
    return Row(
      children: [
        Expanded(child: _filterSortChip(Icons.tune_rounded, 'Filter')),
        SizedBox(width: 10.w),
        Expanded(child: _filterSortChip(Icons.swap_vert_rounded, 'Sort')),
      ],
    );
  }

  Widget _filterSortChip(IconData icon, String label) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 9.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14.sp, color: Colors.black54),
            SizedBox(width: 4.w),
            Text(label, style: GoogleFonts.tasaOrbiter(fontSize: 11.sp, fontWeight: FontWeight.w600, color: Colors.black54)),
          ],
        ),
      ),
    );
  }

  
}



/// A single match card: full-bleed photo, premium ribbon, photo-count
/// pill, verified name, two-line details, and Message / Connect Now
/// action buttons.
class _MatchProfileCard extends StatelessWidget {
  final MatchProfileItem item;
  final List<MatchProfileItem> allProfiles;

  const _MatchProfileCard({required this.item, this.allProfiles = const []});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MatchProfileDetailScreen(item: item, allProfiles: allProfiles),
        ),
      ),
      child: ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: SizedBox(
        height: 509.h,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(item.image, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  stops: const [0.45, 1.0],
                ),
              ),
            ),
 
            // Premium ribbon
            if (item.isPremium)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 150.w,
                  height: 20.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/image/Vector 1265.png'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(12.r)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/image/crown.png', width: 12.w, height: 12.w),
                      SizedBox(width: 4.w),
                      Text('Premium', style: GoogleFonts.tasaOrbiter(fontSize: 10.sp, fontWeight: FontWeight.w700, color: Colors.white)),
                    ],
                  ),
                ),
              ),
 
            // top-right: menu + photo count
            Positioned(
              top: 10.h,
              right: 10.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 30.h,
                    width: 36.h,
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(color: Colors.black.withOpacity(0.4), shape: BoxShape.circle),
                    child: Icon(Icons.more_horiz, size: 15.sp, color: Colors.white),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 30.h,
                    width: 51.h,
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(color: Colors.black.withOpacity(0.4), borderRadius: BorderRadius.circular(12.r)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 3.w),
                        Icon(Icons.camera_alt_outlined, size: 20.sp, color: Colors.white),
                        SizedBox(width: 6.w),
                        Text('${item.photoCount}', style: GoogleFonts.tasaOrbiter(fontSize: 15.sp, fontWeight: FontWeight.w600, color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
 
            // bottom content
            Positioned(
              left: 14.w,
              right: 14.w,
              bottom: 12.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          item.name,
                          style: GoogleFonts.tasaOrbiter(fontSize: 24.sp, fontWeight: FontWeight.w700, color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Image.asset('assets/image/verified.png', width: 18.w, height: 17.w),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Text(item.line1, style: GoogleFonts.tasaOrbiter(fontSize: 14.sp, color: Colors.white70)),
                  Text(item.line2, style: GoogleFonts.tasaOrbiter(fontSize: 14.sp, color: Colors.white70)),
                  SizedBox(height: 8.h),
                  Divider(color: Colors.white24, height: 1),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Like this Profile?',
                          style: GoogleFonts.tasaOrbiter(fontSize: 14.sp, color: Colors.white70),
                        ),
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            // child: Container(
                            //   padding: EdgeInsets.all(9.w),
                            //   decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                            //   child: Icon(Icons.chat_bubble_outline, size: 16.sp, color: const Color(0xFF5A6ACF)),
                            // ),
                            child: Image.asset('assets/image/Frame 2085664438.png',height: 44.h,width: 73.w,),
                          ),
                          //SizedBox(height: 5.h),
                          Text("View contact",style: GoogleFonts.tasaOrbiter(fontSize: 12.sp, color: Colors.white70),)
                        ],
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            // child: Container(
                            //   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
                            //   decoration: BoxDecoration(color: AppColors.coral, borderRadius: BorderRadius.circular(20.r)),
                            //   child: Icon(Icons.check, size: 16.sp, color: Colors.white),
                            // ),
                            child: Image.asset('assets/image/Frame 2085664438 (1).png',height: 44.h,width: 73.w,),
                          ),
                          //SizedBox(height: 5.h),
                          Text("Connect Now",style: GoogleFonts.tasaOrbiter(fontSize: 12.sp, color: Colors.white70),)
                        ],
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
}

/// Compact round-avatar card used in the "My Matches" preferences row.
class _SmallMatchCard extends StatelessWidget {
  final MatchProfileItem item;
  final List<MatchProfileItem> allProfiles;

  const _SmallMatchCard({required this.item, this.allProfiles = const []});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14.r),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MatchProfileDetailScreen(item: item, allProfiles: allProfiles),
        ),
      ),
      child: Container(
        width: 118.w,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: const Color(0xFFF0F0F0)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 3))],
        ),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(item.image, width: 106.w, height: 106.w, fit: BoxFit.cover),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.tasaOrbiter(fontSize: 12.sp, fontWeight: FontWeight.w700, color: Colors.black87),
                  ),
                ),
                SizedBox(width: 3.w),
                Image.asset('assets/image/verified.png', width: 11.w, height: 11.w),
              ],
            ),
            SizedBox(height: 2.h),
            Text(
              item.age > 0 && item.height.isNotEmpty ? '${item.age} Yrs, ${item.height}' : item.line1,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.tasaOrbiter(fontSize: 9.5.sp, color: Colors.black54),
            ),
            Text(
              item.location.isNotEmpty ? item.location : item.line2,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.tasaOrbiter(fontSize: 9.5.sp, color: Colors.black54),
            ),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 6.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.coralLight,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                'Connect Now',
                style: GoogleFonts.tasaOrbiter(fontSize: 9.5.sp, fontWeight: FontWeight.w700, color: AppColors.coral),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 