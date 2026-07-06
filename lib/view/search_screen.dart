// // // Bandhan 2026 — Premium Search Screen
// // import 'package:flutter/material.dart';
// // import 'package:matrimony_app/model/profile_model.dart';
// // import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// // import 'package:matrimony_app/view/custom_widgets/profile_image.dart';
// // import 'package:matrimony_app/view/user_detail_screen.dart';

// // class SearchScreen extends StatefulWidget {
// //   const SearchScreen({super.key});
// //   @override
// //   State<SearchScreen> createState() => _SearchScreenState();
// // }

// // class _SearchScreenState extends State<SearchScreen> {
// //   final _ctrl = TextEditingController();
// //   bool _showResults = false;
// //   late List<Profile> _results;

// //   final _ageRange = RangeValues(22, 30);
// //   final _filters = {'Religion': false, 'Community': false, 'Education': false,
// //     'Occupation': false, 'Location': false, 'Verified': false, 'Premium': false};

// //   @override
// //   void initState() { super.initState(); _results = List.from(appProfiles); }
// //   @override
// //   void dispose() { _ctrl.dispose(); super.dispose(); }

// //   void _doSearch() => setState(() { _showResults = true; _results = appProfiles
// //     .where((p) => _ctrl.text.isEmpty || p.name.toLowerCase().contains(_ctrl.text.toLowerCase()) ||
// //       p.city.toLowerCase().contains(_ctrl.text.toLowerCase()) ||
// //       p.profession.toLowerCase().contains(_ctrl.text.toLowerCase())).toList(); });

// //   @override
// //   Widget build(BuildContext context) {
// //     final top = MediaQuery.of(context).padding.top;
// //     return Scaffold(
// //       backgroundColor: AppColors.background,
// //       body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
// //         SliverToBoxAdapter(child: _buildHero(top)),
// //         SliverToBoxAdapter(child: _buildFilters()),
// //         if (_showResults) ...[
// //           SliverToBoxAdapter(child: Padding(
// //             padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
// //             child: Row(children: [
// //               Text('${_results.length} profiles found', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textSecondary)),
// //               const Spacer(),
// //               const Text('Sort by: Match%', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600)),
// //             ]),
// //           )),
// //           SliverPadding(
// //             padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
// //             sliver: SliverList(delegate: SliverChildBuilderDelegate(
// //               (ctx, i) => _SearchCard(profile: _results[i]),
// //               childCount: _results.length,
// //             )),
// //           ),
// //         ] else
// //           SliverToBoxAdapter(child: _buildEmptyState()),
// //       ]),
// //     );
// //   }

// //   Widget _buildHero(double top) {
// //     return Container(
// //       decoration: BoxDecoration(gradient: AppColors.gradHero, boxShadow: AppColors.shadowMd),
// //       padding: EdgeInsets.fromLTRB(20, top + 20, 20, 24),
// //       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //         const Text('Find Your', style: TextStyle(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.w400)),
// //         const Text('Perfect Partner', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: -1.0, height: 1.1)),
// //         const SizedBox(height: 6),
// //         const Text('Search across 50,000+ profiles', style: TextStyle(color: Colors.white60, fontSize: 13)),
// //         const SizedBox(height: 20),
// //         // Search bar
// //         Container(
// //           decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(AppColors.r16), boxShadow: AppColors.shadowMd),
// //           child: Row(children: [
// //             Expanded(child: TextField(
// //               controller: _ctrl,
// //               onSubmitted: (_) => _doSearch(),
// //               decoration: const InputDecoration(
// //                 hintText: 'Name, city, profession...',
// //                 hintStyle: TextStyle(color: AppColors.textHint, fontSize: 14),
// //                 prefixIcon: Icon(Icons.search_rounded, color: AppColors.textHint),
// //                 border: InputBorder.none,
// //                 contentPadding: EdgeInsets.symmetric(vertical: 14),
// //               ),
// //             )),
// //             GestureDetector(onTap: _doSearch, child: Container(
// //               margin: const EdgeInsets.all(6),
// //               padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
// //               decoration: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(AppColors.r12)),
// //               child: const Text('Search', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w800)),
// //             )),
// //           ]),
// //         ),
// //       ]),
// //     );
// //   }

// //   Widget _buildFilters() {
// //     final chips = [
// //       ('Age', Icons.cake_outlined), ('Religion', Icons.temple_hindu_outlined),
// //       ('Community', Icons.groups_outlined), ('Education', Icons.school_outlined),
// //       ('Occupation', Icons.work_outline_rounded), ('Location', Icons.location_on_outlined),
// //       ('Height', Icons.height_rounded), ('Marital Status', Icons.favorite_border_rounded),
// //     ];
// //     return Container(
// //       color: AppColors.surface,
// //       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //         Padding(
// //           padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
// //           child: Row(children: [
// //             const Text('Filter By', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
// //             const Spacer(),
// //             GestureDetector(onTap: () {}, child: const Text('Advanced Filters', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w700))),
// //           ]),
// //         ),
// //         SizedBox(height: 44, child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16), children: [
// //           ...chips.map((c) => GestureDetector(
// //             onTap: () {},
// //             child: Container(
// //               margin: const EdgeInsets.only(right: 8),
// //               padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
// //               decoration: BoxDecoration(
// //                 color: AppColors.surfaceVariant,
// //                 borderRadius: BorderRadius.circular(AppColors.r32),
// //                 border: Border.all(color: AppColors.border),
// //               ),
// //               child: Row(mainAxisSize: MainAxisSize.min, children: [
// //                 Icon(c.$2, size: 13, color: AppColors.textSecondary),
// //                 const SizedBox(width: 6),
// //                 Text(c.$1, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
// //               ]),
// //             ),
// //           )),
// //         ])),
// //         const SizedBox(height: 16),
// //         const Divider(height: 1, color: AppColors.border),
// //       ]),
// //     );
// //   }

// //   Widget _buildEmptyState() {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
// //       child: Column(mainAxisSize: MainAxisSize.min, children: [
// //         Container(width: 100, height: 100, decoration: BoxDecoration(gradient: AppColors.gradHero, shape: BoxShape.circle),
// //           child: const Icon(Icons.search_rounded, size: 48, color: Colors.white)),
// //         const SizedBox(height: 24),
// //         const Text('Search for Your Match', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.textPrimary)),
// //         const SizedBox(height: 8),
// //         const Text('Enter a name, city, or profession to find profiles. Use filters for better results.', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: AppColors.textHint, height: 1.5)),
// //         const SizedBox(height: 24),
// //         GestureDetector(onTap: _doSearch, child: Container(
// //           padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
// //           decoration: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(AppColors.r32), boxShadow: AppColors.shadowPrimary),
// //           child: const Text('Show All Profiles', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14)),
// //         )),
// //       ]),
// //     );
// //   }
// // }

// // class _SearchCard extends StatelessWidget {
// //   final Profile profile;
// //   const _SearchCard({required this.profile});
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.only(bottom: 12),
// //       decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppColors.r16), boxShadow: AppColors.shadowSm),
// //       child: Row(children: [
// //         ClipRRect(borderRadius: const BorderRadius.horizontal(left: Radius.circular(AppColors.r16)),
// //           child: ProfileImage(profile.image, width: 96, height: 110, fit: BoxFit.cover,
// //               errorWidget: Container(width: 96, height: 110, color: AppColors.primaryLight,
// //                   child: const Icon(Icons.person, size: 40, color: AppColors.primary)))),
// //         Expanded(child: Padding(
// //           padding: const EdgeInsets.all(12),
// //           child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //             Row(children: [
// //               Expanded(child: Text('${profile.name}, ${profile.age}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.textPrimary), maxLines: 1, overflow: TextOverflow.ellipsis)),
// //               if (profile.matchPct != null) Container(
// //                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
// //                 decoration: BoxDecoration(gradient: AppColors.gradGold, borderRadius: BorderRadius.circular(20)),
// //                 child: Text('${profile.matchPct}%', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900)),
// //               ),
// //             ]),
// //             const SizedBox(height: 4),
// //             Text(profile.profession, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary), maxLines: 1, overflow: TextOverflow.ellipsis),
// //             const SizedBox(height: 3),
// //             Row(children: [
// //               const Icon(Icons.location_on_outlined, size: 11, color: AppColors.textHint),
// //               const SizedBox(width: 3),
// //               Flexible(child: Text(profile.city, style: const TextStyle(fontSize: 11, color: AppColors.textHint), maxLines: 1, overflow: TextOverflow.ellipsis)),
// //               const SizedBox(width: 8),
// //               const Icon(Icons.height_rounded, size: 11, color: AppColors.textHint),
// //               const SizedBox(width: 3),
// //               Text(profile.height, style: const TextStyle(fontSize: 11, color: AppColors.textHint)),
// //             ]),
// //             const SizedBox(height: 10),
// //             Row(children: [
// //               Expanded(child: GestureDetector(
// //                 onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => UserDetailScreen(profile: profile))),
// //                 child: Container(
// //                 height: 32,
// //                 decoration: BoxDecoration(border: Border.all(color: AppColors.primary), borderRadius: BorderRadius.circular(AppColors.r32)),
// //                 child: const Center(child: Text('View', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.primary))),
// //               ))),
// //               const SizedBox(width: 8),
// //               Expanded(flex: 2, child: GestureDetector(onTap: () {}, child: Container(
// //                 height: 32,
// //                 decoration: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(AppColors.r32)),
// //                 child: const Center(child: Text('Express Interest', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.white))),
// //               ))),
// //             ]),
// //           ]),
// //         )),
// //       ]),
// //     );
// //   }
// // }



// // Bandhan 2026 — Premium Search Screen
// import 'package:flutter/material.dart';
// import 'package:matrimony_app/model/profile_model.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/custom_widgets/profile_image.dart';
// import 'package:matrimony_app/view/user_detail_screen.dart';
// import 'package:matrimony_app/view/advanced_filter_screen.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final _ctrl = TextEditingController();
//   bool _showResults = false;
//   late List<Profile> _results;

//   AdvancedFilters _advanced = AdvancedFilters();

//   @override
//   void initState() { super.initState(); _results = List.from(appProfiles); }
//   @override
//   void dispose() { _ctrl.dispose(); super.dispose(); }

//   bool _matchesAdvanced(Profile p) {
//     if (p.age < _advanced.ageRange.start || p.age > _advanced.ageRange.end) return false;
//     if (_advanced.location != null &&
//         !p.city.toLowerCase().contains(_advanced.location!.toLowerCase())) {
//       return false;
//     }
//     if (_advanced.occupation != null &&
//         !p.profession.toLowerCase().contains(_advanced.occupation!.toLowerCase())) {
//       return false;
//     }
//     // TODO: wire religion / community / education / maritalStatus / verified /
//     // premium / withPhoto / heightRange once those fields are confirmed on
//     // your Profile model — the AdvancedFilters object already carries them.
//     return true;
//   }

//   void _doSearch() => setState(() {
//     _showResults = true;
//     _results = appProfiles.where((p) {
//       final matchesText = _ctrl.text.isEmpty ||
//           p.name.toLowerCase().contains(_ctrl.text.toLowerCase()) ||
//           p.city.toLowerCase().contains(_ctrl.text.toLowerCase()) ||
//           p.profession.toLowerCase().contains(_ctrl.text.toLowerCase());
//       return matchesText && _matchesAdvanced(p);
//     }).toList();
//   });

//   Future<void> _openAdvancedFilters() async {
//     final result = await Navigator.push<AdvancedFilters>(
//       context,
//       MaterialPageRoute(builder: (_) => AdvancedFilterScreen(initial: _advanced)),
//     );
//     if (result != null) {
//       setState(() => _advanced = result);
//       _doSearch();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final top = MediaQuery.of(context).padding.top;
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
//         SliverToBoxAdapter(child: _buildHero(top)),
//         SliverToBoxAdapter(child: _buildFilters()),
//         if (_showResults) ...[
//           SliverToBoxAdapter(child: Padding(
//             padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
//             child: Row(children: [
//               Text('${_results.length} profiles found', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textSecondary)),
//               const Spacer(),
//               const Text('Sort by: Match%', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600)),
//             ]),
//           )),
//           SliverPadding(
//             padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
//             sliver: SliverList(delegate: SliverChildBuilderDelegate(
//               (ctx, i) => _SearchCard(profile: _results[i]),
//               childCount: _results.length,
//             )),
//           ),
//         ] else
//           SliverToBoxAdapter(child: _buildEmptyState()),
//       ]),
//     );
//   }

//   Widget _buildHero(double top) {
//     return Container(
//       decoration: BoxDecoration(gradient: AppColors.gradHero, boxShadow: AppColors.shadowMd),
//       padding: EdgeInsets.fromLTRB(20, top + 20, 20, 24),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         const Text('Find Your', style: TextStyle(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.w400)),
//         const Text('Perfect Partner', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: -1.0, height: 1.1)),
//         const SizedBox(height: 6),
//         const Text('Search across 50,000+ profiles', style: TextStyle(color: Colors.white60, fontSize: 13)),
//         const SizedBox(height: 20),
//         // Search bar
//         Container(
//           decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(AppColors.r16), boxShadow: AppColors.shadowMd),
//           child: Row(children: [
//             Expanded(child: TextField(
//               controller: _ctrl,
//               onSubmitted: (_) => _doSearch(),
//               decoration: const InputDecoration(
//                 hintText: 'Name, city, profession...',
//                 hintStyle: TextStyle(color: AppColors.textHint, fontSize: 14),
//                 prefixIcon: Icon(Icons.search_rounded, color: AppColors.textHint),
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.symmetric(vertical: 14),
//               ),
//             )),
//             GestureDetector(onTap: _doSearch, child: Container(
//               margin: const EdgeInsets.all(6),
//               padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//               decoration: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(AppColors.r12)),
//               child: const Text('Search', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w800)),
//             )),
//           ]),
//         ),
//       ]),
//     );
//   }

//   Widget _buildFilters() {
//     final chips = [
//       ('Age', Icons.cake_outlined), ('Religion', Icons.temple_hindu_outlined),
//       ('Community', Icons.groups_outlined), ('Education', Icons.school_outlined),
//       ('Occupation', Icons.work_outline_rounded), ('Location', Icons.location_on_outlined),
//       ('Height', Icons.height_rounded), ('Marital Status', Icons.favorite_border_rounded),
//     ];
//     final activeCount = _advanced.activeCount;
//     return Container(
//       color: AppColors.surface,
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
//           child: Row(children: [
//             const Text('Filter By', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
//             const Spacer(),
//             GestureDetector(
//               onTap: _openAdvancedFilters,
//               child: Row(children: [
//                 if (activeCount > 0) Container(
//                   margin: const EdgeInsets.only(right: 6),
//                   padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
//                   decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(20)),
//                   child: Text('$activeCount', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.white)),
//                 ),
//                 const Text('Advanced Filters', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w700)),
//               ]),
//             ),
//           ]),
//         ),
//         SizedBox(height: 44, child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16), children: [
//           ...chips.map((c) => GestureDetector(
//             onTap: _openAdvancedFilters,
//             child: Container(
//               margin: const EdgeInsets.only(right: 8),
//               padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//               decoration: BoxDecoration(
//                 color: AppColors.surfaceVariant,
//                 borderRadius: BorderRadius.circular(AppColors.r32),
//                 border: Border.all(color: AppColors.border),
//               ),
//               child: Row(mainAxisSize: MainAxisSize.min, children: [
//                 Icon(c.$2, size: 13, color: AppColors.textSecondary),
//                 const SizedBox(width: 6),
//                 Text(c.$1, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
//               ]),
//             ),
//           )),
//         ])),
//         const SizedBox(height: 16),
//         const Divider(height: 1, color: AppColors.border),
//       ]),
//     );
//   }

//   Widget _buildEmptyState() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
//       child: Column(mainAxisSize: MainAxisSize.min, children: [
//         Container(width: 100, height: 100, decoration: BoxDecoration(gradient: AppColors.gradHero, shape: BoxShape.circle),
//           child: const Icon(Icons.search_rounded, size: 48, color: Colors.white)),
//         const SizedBox(height: 24),
//         const Text('Search for Your Match', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.textPrimary)),
//         const SizedBox(height: 8),
//         const Text('Enter a name, city, or profession to find profiles. Use filters for better results.', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: AppColors.textHint, height: 1.5)),
//         const SizedBox(height: 24),
//         GestureDetector(onTap: _doSearch, child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
//           decoration: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(AppColors.r32), boxShadow: AppColors.shadowPrimary),
//           child: const Text('Show All Profiles', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14)),
//         )),
//       ]),
//     );
//   }
// }

// class _SearchCard extends StatelessWidget {
//   final Profile profile;
//   const _SearchCard({required this.profile});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppColors.r16), boxShadow: AppColors.shadowSm),
//       child: Row(children: [
//         ClipRRect(borderRadius: const BorderRadius.horizontal(left: Radius.circular(AppColors.r16)),
//           child: ProfileImage(profile.image, width: 96, height: 110, fit: BoxFit.cover,
//               errorWidget: Container(width: 96, height: 110, color: AppColors.primaryLight,
//                   child: const Icon(Icons.person, size: 40, color: AppColors.primary)))),
//         Expanded(child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Row(children: [
//               Expanded(child: Text('${profile.name}, ${profile.age}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.textPrimary), maxLines: 1, overflow: TextOverflow.ellipsis)),
//               if (profile.matchPct != null) Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//                 decoration: BoxDecoration(gradient: AppColors.gradGold, borderRadius: BorderRadius.circular(20)),
//                 child: Text('${profile.matchPct}%', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900)),
//               ),
//             ]),
//             const SizedBox(height: 4),
//             Text(profile.profession, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary), maxLines: 1, overflow: TextOverflow.ellipsis),
//             const SizedBox(height: 3),
//             Row(children: [
//               const Icon(Icons.location_on_outlined, size: 11, color: AppColors.textHint),
//               const SizedBox(width: 3),
//               Flexible(child: Text(profile.city, style: const TextStyle(fontSize: 11, color: AppColors.textHint), maxLines: 1, overflow: TextOverflow.ellipsis)),
//               const SizedBox(width: 8),
//               const Icon(Icons.height_rounded, size: 11, color: AppColors.textHint),
//               const SizedBox(width: 3),
//               Text(profile.height, style: const TextStyle(fontSize: 11, color: AppColors.textHint)),
//             ]),
//             const SizedBox(height: 10),
//             Row(children: [
//               Expanded(child: GestureDetector(
//                 onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => UserDetailScreen(profile: profile))),
//                 child: Container(
//                 height: 32,
//                 decoration: BoxDecoration(border: Border.all(color: AppColors.primary), borderRadius: BorderRadius.circular(AppColors.r32)),
//                 child: const Center(child: Text('View', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.primary))),
//               ))),
//               const SizedBox(width: 8),
//               Expanded(flex: 2, child: GestureDetector(onTap: () {}, child: Container(
//                 height: 32,
//                 decoration: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(AppColors.r32)),
//                 child: const Center(child: Text('Express Interest', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.white))),
//               ))),
//             ]),
//           ]),
//         )),
//       ]),
//     );
//   }
// }






// Bandhan 2026 — Premium Search Screen (Tabbed: Basic / Advanced / Saved / Profile ID / Keyword)
import 'package:flutter/material.dart';
import 'package:matrimony_app/model/profile_model.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/profile_image.dart';
import 'package:matrimony_app/view/user_detail_screen.dart';

// ═══════════════════════════════════════════════════════════════
//  MODELS
// ═══════════════════════════════════════════════════════════════

enum SearchType { basic, advanced }

class SavedSearchEntry {
  final String id;
  String name;
  final SearchType type;
  final Map<String, dynamic> filters;
  final DateTime createdAt;

  SavedSearchEntry({
    required this.id,
    required this.name,
    required this.type,
    required this.filters,
    required this.createdAt,
  });
}

// ═══════════════════════════════════════════════════════════════
//  SEARCH SCREEN
// ═══════════════════════════════════════════════════════════════

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Saved searches (shared across Basic & Advanced tabs)
  final List<SavedSearchEntry> _savedSearches = [];

  // ── Basic Search state ──
  String? _basicAgeFrom, _basicAgeTo;
  String? _basicHeightFrom, _basicHeightTo;
  String? _basicWeightFrom, _basicWeightTo;
  String? _basicMaritalStatus;
  String? _basicDisability;
  String? _basicMotherTongue;
  String? _basicEducation;
  String? _basicReligion;
  String? _basicCaste;
  String? _basicFamilyType;

  // ── Advanced Search state ──
  String? _advAgeFrom, _advAgeTo;
  String? _advHeightFrom, _advHeightTo;
  String? _advWeightFrom, _advWeightTo;
  String? _advMaritalStatus;
  String? _advDisability;
  String? _advSurgeryPref; // Yes/No
  String? _advFamilyStatus;
  String? _advBodyType;
  String? _advMotherTongue;
  String? _advSkinTone;
  String? _advFamilyType;
  String? _advFoodType;
  String? _advDrinking;
  String? _advSmoking;
  String? _advReligion;
  String? _advCaste;
  String? _advGotra;
  String? _advCountry;
  String? _advState;
  String? _advCity;
  String? _advQualification;
  String? _advEmploymentType;
  String? _advOccupation;
  String? _advAnnualIncome;
  String? _advFamilyProperty;
  String? _advSudhaJathakam;
  String? _advDoshaJathakam;
  bool _advWithPhoto = false;
  String? _advSortBy;

  // ── Profile ID Search ──
  final _profileIdCtrl = TextEditingController();
  String? _profileIdError;

  // ── Keyword Search ──
  final _keywordCtrl = TextEditingController();
  List<Profile> _keywordResults = [];
  bool _keywordSearched = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _profileIdCtrl.dispose();
    _keywordCtrl.dispose();
    super.dispose();
  }

  // ── Helpers ──
  List<String> _range(int start, int end, {String suffix = ''}) =>
      List.generate(end - start + 1, (i) => '${start + i}$suffix');

  void _resetBasic() {
    setState(() {
      _basicAgeFrom = null;
      _basicAgeTo = null;
      _basicHeightFrom = null;
      _basicHeightTo = null;
      _basicWeightFrom = null;
      _basicWeightTo = null;
      _basicMaritalStatus = null;
      _basicDisability = null;
      _basicMotherTongue = null;
      _basicEducation = null;
      _basicReligion = null;
      _basicCaste = null;
      _basicFamilyType = null;
    });
  }

  void _resetAdvanced() {
    setState(() {
      _advAgeFrom = null;
      _advAgeTo = null;
      _advHeightFrom = null;
      _advHeightTo = null;
      _advWeightFrom = null;
      _advWeightTo = null;
      _advMaritalStatus = null;
      _advDisability = null;
      _advSurgeryPref = null;
      _advFamilyStatus = null;
      _advBodyType = null;
      _advMotherTongue = null;
      _advSkinTone = null;
      _advFamilyType = null;
      _advFoodType = null;
      _advDrinking = null;
      _advSmoking = null;
      _advReligion = null;
      _advCaste = null;
      _advGotra = null;
      _advCountry = null;
      _advState = null;
      _advCity = null;
      _advQualification = null;
      _advEmploymentType = null;
      _advOccupation = null;
      _advAnnualIncome = null;
      _advFamilyProperty = null;
      _advSudhaJathakam = null;
      _advDoshaJathakam = null;
      _advWithPhoto = false;
      _advSortBy = null;
    });
  }

  Map<String, dynamic> _basicFiltersMap() => {
        'ageMin': _basicAgeFrom == null ? null : int.tryParse(_basicAgeFrom!),
        'ageMax': _basicAgeTo == null ? null : int.tryParse(_basicAgeTo!),
        'heightFrom': _basicHeightFrom,
        'heightTo': _basicHeightTo,
        'weightFrom': _basicWeightFrom,
        'weightTo': _basicWeightTo,
        'maritalStatus': _basicMaritalStatus,
        'disability': _basicDisability,
        'motherTongue': _basicMotherTongue,
        'education': _basicEducation,
        'religion': _basicReligion,
        'caste': _basicCaste,
        'familyType': _basicFamilyType,
      };

  Map<String, dynamic> _advancedFiltersMap() => {
        'ageMin': _advAgeFrom == null ? null : int.tryParse(_advAgeFrom!),
        'ageMax': _advAgeTo == null ? null : int.tryParse(_advAgeTo!),
        'heightFrom': _advHeightFrom,
        'heightTo': _advHeightTo,
        'weightFrom': _advWeightFrom,
        'weightTo': _advWeightTo,
        'maritalStatus': _advMaritalStatus,
        'disability': _advDisability,
        'surgeryPref': _advSurgeryPref,
        'familyStatus': _advFamilyStatus,
        'bodyType': _advBodyType,
        'motherTongue': _advMotherTongue,
        'skinTone': _advSkinTone,
        'familyType': _advFamilyType,
        'foodType': _advFoodType,
        'drinking': _advDrinking,
        'smoking': _advSmoking,
        'religion': _advReligion,
        'caste': _advCaste,
        'gotra': _advGotra,
        'country': _advCountry,
        'state': _advState,
        'city': _advCity,
        'qualification': _advQualification,
        'employmentType': _advEmploymentType,
        'occupation': _advOccupation,
        'annualIncome': _advAnnualIncome,
        'familyProperty': _advFamilyProperty,
        'sudhaJathakam': _advSudhaJathakam,
        'doshaJathakam': _advDoshaJathakam,
        'withPhoto': _advWithPhoto,
        'sortBy': _advSortBy,
      };

  void _saveSearch(SearchType type) {
    final filters =
        type == SearchType.basic ? _basicFiltersMap() : _advancedFiltersMap();
    final typeLabel = type == SearchType.basic ? 'Basic' : 'Advanced';
    final name = '$typeLabel Search ${_savedSearches.length + 1}';

    setState(() {
      _savedSearches.insert(
        0,
        SavedSearchEntry(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          name: name,
          type: type,
          filters: filters,
          createdAt: DateTime.now(),
        ),
      );
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved as "$name"')),
      );
    }

    _showFilterResults(name, filters);
  }

  Future<void> _renameSavedSearch(SavedSearchEntry entry) async {
    final controller = TextEditingController(text: entry.name);
    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Rename Search'),
        content: TextField(controller: controller),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(ctx, controller.text.trim()),
              child: const Text('Rename')),
        ],
      ),
    );
    if (name != null && name.isNotEmpty) {
      setState(() => entry.name = name);
    }
  }

  void _deleteSavedSearch(SavedSearchEntry entry) {
    setState(() => _savedSearches.remove(entry));
  }

  bool _matchesFilters(Profile p, Map<String, dynamic> f) {
    final ageMin = f['ageMin'] as num?;
    final ageMax = f['ageMax'] as num?;
    if (ageMin != null && p.age < ageMin) return false;
    if (ageMax != null && p.age > ageMax) return false;

    final religion = f['religion'] as String?;
    if (religion != null && p.religion.toLowerCase() != religion.toLowerCase()) {
      return false;
    }

    final caste = f['caste'] as String?;
    if (caste != null && p.caste.toLowerCase() != caste.toLowerCase()) {
      return false;
    }

    final education = (f['education'] ?? f['qualification']) as String?;
    if (education != null &&
        !p.education.toLowerCase().contains(education.toLowerCase())) {
      return false;
    }

    final city = f['city'] as String?;
    if (city != null && p.city.toLowerCase() != city.toLowerCase()) {
      return false;
    }

    final occupation = f['occupation'] as String?;
    if (occupation != null &&
        !p.profession.toLowerCase().contains(occupation.toLowerCase())) {
      return false;
    }

    final withPhoto = f['withPhoto'] as bool?;
    if (withPhoto == true && p.photoCount <= 0) return false;

    return true;
  }

  void _showMatches(SavedSearchEntry entry) =>
      _showFilterResults(entry.name, entry.filters);

  void _showFilterResults(String title, Map<String, dynamic> filters) {
    final results =
        appProfiles.where((p) => _matchesFilters(p, filters)).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _SearchResultsScreen(title: title, results: results),
      ),
    );
  }

  void _searchProfileId() {
    setState(() => _profileIdError = null);
    final id = _profileIdCtrl.text.trim();
    if (id.isEmpty) {
      setState(() => _profileIdError = 'Please enter a matrimony ID');
      return;
    }
    // TODO: replace with real lookup once Profile has an `id`/`matrimonyId` field
    final match = appProfiles.isNotEmpty ? appProfiles.first : null;
    if (match != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => UserDetailScreen(profile: match)));
    } else {
      setState(() => _profileIdError = 'No profile found with this ID');
    }
  }

  void _searchKeyword() {
    final q = _keywordCtrl.text.trim().toLowerCase();
    setState(() {
      _keywordSearched = true;
      _keywordResults = q.isEmpty
          ? []
          : appProfiles.where((p) =>
              p.name.toLowerCase().contains(q) ||
              p.city.toLowerCase().contains(q) ||
              p.profession.toLowerCase().contains(q)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildHero(top),
          // SliverToBoxAdapter(child: _buildHero(top)),
          Container(
            color: AppColors.surface,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              indicatorColor: AppColors.primary,
              labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              tabs: const [
                Tab(text: 'Basic Search'),
                Tab(text: 'Advanced Search'),
                Tab(text: 'Saved Search'),
                Tab(text: 'Profile ID Search'),
                Tab(text: 'Keyword Search'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildBasicSearchTab(),
                _buildAdvancedSearchTab(),
                _buildSavedSearchTab(),
                _buildProfileIdTab(),
                _buildKeywordTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHero(double top) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppColors.gradHero, boxShadow: AppColors.shadowMd),
      padding: EdgeInsets.fromLTRB(20, top + 16, 20, 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text('Find Your', style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w400)),
        Text('Perfect Partner', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: -1.0, height: 1.1)),
        SizedBox(height: 4),
        Text('Search across 50,000+ profiles', style: TextStyle(color: Colors.white60, fontSize: 12)),
      ]),
    );
  }

  // ═══════════════════════════════════════════════════════════
  //  BASIC SEARCH TAB
  // ═══════════════════════════════════════════════════════════

  Widget _buildBasicSearchTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Basic Search', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
        const SizedBox(height: 16),
        _dropdownRow('Age', _basicAgeFrom, _basicAgeTo, _range(18, 70),
            (v) => setState(() => _basicAgeFrom = v),
            (v) => setState(() => _basicAgeTo = v)),
        const SizedBox(height: 12),
        _dropdownRow('Height', _basicHeightFrom, _basicHeightTo,
            _range(131, 210, suffix: 'cm'),
            (v) => setState(() => _basicHeightFrom = v),
            (v) => setState(() => _basicHeightTo = v)),
        const SizedBox(height: 12),
        _dropdownRow('Weight', _basicWeightFrom, _basicWeightTo,
            _range(35, 150, suffix: 'kg'),
            (v) => setState(() => _basicWeightFrom = v),
            (v) => setState(() => _basicWeightTo = v)),
        const SizedBox(height: 12),
        _singleDropdown('Marital Status', _basicMaritalStatus,
            const ['Never Married', 'Divorced', 'Widow/er', 'Awaiting Divorce', 'Annulled'],
            (v) => setState(() => _basicMaritalStatus = v)),
        const SizedBox(height: 12),
        _singleDropdown('Disability Status', _basicDisability, const ['No', 'Yes'],
            (v) => setState(() => _basicDisability = v)),
        const SizedBox(height: 12),
        _singleDropdown('Mother Tongue', _basicMotherTongue,
            const ['Malayalam', 'English', 'Hindi', 'Tamil', 'Telugu', 'Kannada', 'Gujarati', 'Bengali', 'Urdu', 'Arabic'],
            (v) => setState(() => _basicMotherTongue = v)),
        const SizedBox(height: 12),
        _singleDropdown('Education', _basicEducation,
            const ['Bachelors Degree', 'Masters Degree', 'Diploma', '10th', '12th'],
            (v) => setState(() => _basicEducation = v)),
        const SizedBox(height: 12),
        _singleDropdown('Religion', _basicReligion, const ['Hindu', 'Muslim', 'Christian', 'Sikh'],
            (v) => setState(() => _basicReligion = v)),
        const SizedBox(height: 12),
        _singleDropdown('Caste', _basicCaste, const ['Nair', 'Thiyya', 'Ezhava', 'Sunni', 'Mujahid'],
            (v) => setState(() => _basicCaste = v)),
        const SizedBox(height: 12),
        _singleDropdown('Family Type', _basicFamilyType, const ['Nuclear Family', 'Joint Family'],
            (v) => setState(() => _basicFamilyType = v)),
        const SizedBox(height: 24),
        _actionButtons(
          onSave: () => _saveSearch(SearchType.basic),
          onReset: _resetBasic,
          onSearch: () => _showFilterResults('Basic Search', _basicFiltersMap()),
        ),
        const SizedBox(height: 100),
      ]),
    );
  }

  // ═══════════════════════════════════════════════════════════
  //  ADVANCED SEARCH TAB
  // ═══════════════════════════════════════════════════════════

  Widget _buildAdvancedSearchTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Advanced Search', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
        const SizedBox(height: 16),
        _dropdownRow('Age', _advAgeFrom, _advAgeTo, _range(18, 100),
            (v) => setState(() => _advAgeFrom = v),
            (v) => setState(() => _advAgeTo = v)),
        const SizedBox(height: 12),
        _dropdownRow('Height', _advHeightFrom, _advHeightTo,
            _range(131, 210, suffix: 'cm'),
            (v) => setState(() => _advHeightFrom = v),
            (v) => setState(() => _advHeightTo = v)),
        const SizedBox(height: 12),
        _dropdownRow('Weight', _advWeightFrom, _advWeightTo,
            _range(35, 150, suffix: 'kg'),
            (v) => setState(() => _advWeightFrom = v),
            (v) => setState(() => _advWeightTo = v)),
        const SizedBox(height: 12),
        _singleDropdown('Marital Status', _advMaritalStatus,
            const ['Never Married', 'Divorced', 'Widow/er', 'Awaiting Divorce', 'Annulled'],
            (v) => setState(() => _advMaritalStatus = v)),
        const SizedBox(height: 12),
        _singleDropdown('Disability Status', _advDisability, const ['No', 'Yes'],
            (v) => setState(() => _advDisability = v)),
        const SizedBox(height: 12),
        _label('Are you preferring persons who have undergone major surgery or Organ transplantation'),
        _yesNoRadio(_advSurgeryPref, (v) => setState(() => _advSurgeryPref = v)),
        const SizedBox(height: 12),
        _singleDropdown('Family Status', _advFamilyStatus,
            const ['Upper Middle Class', 'Middle Class', 'Lower Middle Class'],
            (v) => setState(() => _advFamilyStatus = v)),
        const SizedBox(height: 12),
        _singleDropdown('Body Type', _advBodyType, const ['Fat', 'Slim'],
            (v) => setState(() => _advBodyType = v)),
        const SizedBox(height: 12),
        _singleDropdown('Mother Tongue', _advMotherTongue,
            const ['Malayalam', 'English', 'Hindi', 'Tamil', 'Telugu', 'Kannada', 'Gujarati', 'Bengali', 'Urdu', 'Arabic'],
            (v) => setState(() => _advMotherTongue = v)),
        const SizedBox(height: 12),
        _singleDropdown('Body Skin Tone', _advSkinTone, const ['Fair', 'Wheatish', 'Dusky', 'Dark'],
            (v) => setState(() => _advSkinTone = v)),
        const SizedBox(height: 12),
        _singleDropdown('Family Type', _advFamilyType, const ['Nuclear Family', 'Joint Family'],
            (v) => setState(() => _advFamilyType = v)),
        const SizedBox(height: 12),
        _singleDropdown('Food Type', _advFoodType, const ['Vegan', 'Non-Vegan'],
            (v) => setState(() => _advFoodType = v)),
        const SizedBox(height: 12),
        _singleDropdown('Drinking Habits', _advDrinking, const ['Yes', 'No', "Don't Know"],
            (v) => setState(() => _advDrinking = v)),
        const SizedBox(height: 12),
        _singleDropdown('Smoking Habits', _advSmoking, const ['Yes', 'No', "Don't Know"],
            (v) => setState(() => _advSmoking = v)),
        const SizedBox(height: 20),
        const Text('Religious details', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
        const SizedBox(height: 12),
        _singleDropdown('Religion', _advReligion, const ['Hindu', 'Muslim', 'Christian', 'Sikh'],
            (v) => setState(() => _advReligion = v)),
        const SizedBox(height: 12),
        _singleDropdown('Caste', _advCaste, const ['Nair', 'Thiyya', 'Ezhava', 'Sunni', 'Mujahid'],
            (v) => setState(() => _advCaste = v)),
        const SizedBox(height: 12),
        _singleDropdown('Gotra', _advGotra, const ['Atreya', 'Gavishthira', 'Viswamithra'],
            (v) => setState(() => _advGotra = v)),
        const SizedBox(height: 20),
        const Text('Location details', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
        const SizedBox(height: 12),
        _singleDropdown('Country', _advCountry, const ['India'], (v) => setState(() => _advCountry = v)),
        const SizedBox(height: 12),
        _singleDropdown('State', _advState, const ['Kerala', 'Gujarat'], (v) => setState(() => _advState = v)),
        const SizedBox(height: 12),
        _singleDropdown('City', _advCity, const ['Kozhikode', 'Palakkad', 'Surat', 'Malappuram'],
            (v) => setState(() => _advCity = v)),
        const SizedBox(height: 20),
        const Text('Education & professional details', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
        const SizedBox(height: 12),
        _singleDropdown('Qualification', _advQualification,
            const ['Bachelors Degree', 'Diploma', '10th', 'Masters Degree'],
            (v) => setState(() => _advQualification = v)),
        const SizedBox(height: 12),
        _singleDropdown('Employment Type', _advEmploymentType,
            const ['Healthcare', 'Information Technology', 'Farmer', 'Defence', 'Government/PSU', 'Private Sector', 'Business', 'Others'],
            (v) => setState(() => _advEmploymentType = v)),
        const SizedBox(height: 12),
        _singleDropdown('Occupation', _advOccupation,
            const ['Doctor', 'Software Developer', 'Farmer', 'UI/UX Designer', 'Software Engineer', 'Teacher', 'Police', 'Military', 'Nurse', 'Mechanic', 'Plumber', 'Business', 'Clerk'],
            (v) => setState(() => _advOccupation = v)),
        const SizedBox(height: 12),
        _singleDropdown('Annual Income', _advAnnualIncome,
            const ['10L to 20L', '20L to 30L', '2L to 3L', '20K to 30K', '5K - 10K AED'],
            (v) => setState(() => _advAnnualIncome = v)),
        const SizedBox(height: 12),
        _singleDropdown('Family Property', _advFamilyProperty,
            const ['10L to 20L', '20L to 30L', '2L to 3L', '20K to 30K', '5K - 10K AED'],
            (v) => setState(() => _advFamilyProperty = v)),
        const SizedBox(height: 20),
        const Text('Horoscope details', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
        const SizedBox(height: 12),
        _singleDropdown('Profile with Sudha Jathakam', _advSudhaJathakam, const ['Yes', 'No'],
            (v) => setState(() => _advSudhaJathakam = v)),
        const SizedBox(height: 12),
        _singleDropdown('Profile with Dosha Jathakam', _advDoshaJathakam, const ['Yes', 'No'],
            (v) => setState(() => _advDoshaJathakam = v)),
        const SizedBox(height: 20),
        Row(children: [
          Checkbox(
            value: _advWithPhoto,
            activeColor: AppColors.primary,
            onChanged: (v) => setState(() => _advWithPhoto = v ?? false),
          ),
          const Expanded(child: Text('Profiles with Photo — Matches who have added photos',
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary))),
        ]),
        const SizedBox(height: 12),
        _singleDropdown('Sort by', _advSortBy,
            const ['Newly Created', 'Based on Last Login', 'Recently Updated Profiles'],
            (v) => setState(() => _advSortBy = v)),
        const SizedBox(height: 24),
        _actionButtons(
          onSave: () => _saveSearch(SearchType.advanced),
          onReset: _resetAdvanced,
          onSearch: () => _showFilterResults('Advanced Search', _advancedFiltersMap()),
        ),
        const SizedBox(height: 100),
      ]),
    );
  }

  // ═══════════════════════════════════════════════════════════
  //  SAVED SEARCH TAB
  // ═══════════════════════════════════════════════════════════

  Widget _buildSavedSearchTab() {
    if (_savedSearches.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.bookmark_border_rounded, size: 56, color: AppColors.textHint),
            const SizedBox(height: 16),
            const Text('No saved searches yet',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
            const SizedBox(height: 6),
            const Text(
              'Save a search from the Basic or Advanced Search tab to see it here.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: AppColors.textHint),
            ),
          ]),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _savedSearches.length,
      itemBuilder: (ctx, i) {
        final entry = _savedSearches[i];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppColors.r16),
            boxShadow: AppColors.shadowSm,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Expanded(
                child: Text(entry.name,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: entry.type == SearchType.basic
                      ? AppColors.primary.withOpacity(0.12)
                      : AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  entry.type == SearchType.basic ? 'Basic' : 'Advanced',
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.primary),
                ),
              ),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(child: _outlinedSmallButton('Rename', () => _renameSavedSearch(entry))),
              const SizedBox(width: 8),
              Expanded(child: _outlinedSmallButton('Delete', () => _deleteSavedSearch(entry))),
              const SizedBox(width: 8),
              Expanded(child: _outlinedSmallButton('Show matches', () => _showMatches(entry))),
            ]),
          ]),
        );
      },
    );
  }

  // ═══════════════════════════════════════════════════════════
  //  PROFILE ID SEARCH TAB
  // ═══════════════════════════════════════════════════════════

  Widget _buildProfileIdTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Profile ID search', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppColors.r16),
            boxShadow: AppColors.shadowSm,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Enter matrimony ID', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(
                child: TextField(
                  controller: _profileIdCtrl,
                  decoration: InputDecoration(
                    hintText: 'Eg: W43525266',
                    hintStyle: const TextStyle(color: AppColors.textHint, fontSize: 13),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.primary)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: _searchProfileId,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('View Profile', style: TextStyle(fontWeight: FontWeight.w700)),
              ),
            ]),
            if (_profileIdError != null) ...[
              const SizedBox(height: 8),
              Text(_profileIdError!, style: const TextStyle(color: Colors.red, fontSize: 12)),
            ],
          ]),
        ),
      ]),
    );
  }

  // ═══════════════════════════════════════════════════════════
  //  KEYWORD SEARCH TAB
  // ═══════════════════════════════════════════════════════════

  Widget _buildKeywordTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Keyword Search', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppColors.r16),
            boxShadow: AppColors.shadowSm,
          ),
          child: Row(children: [
            Expanded(
              child: TextField(
                controller: _keywordCtrl,
                onSubmitted: (_) => _searchKeyword(),
                decoration: InputDecoration(
                  hintText: 'Search Keywords',
                  hintStyle: const TextStyle(color: AppColors.textHint, fontSize: 13),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.border)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.border)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.primary)),
                ),
              ),
            ),
            const SizedBox(width: 10),
            OutlinedButton(
              onPressed: _searchKeyword,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Search', style: TextStyle(fontWeight: FontWeight.w700)),
            ),
          ]),
        ),
        const SizedBox(height: 16),
        if (_keywordSearched)
          _keywordResults.isEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: Text('No profiles match your criteria.',
                        style: TextStyle(color: AppColors.textHint, fontSize: 13)),
                  ),
                )
              : Column(
                  children: _keywordResults.map((p) => _SearchCard(profile: p)).toList(),
                ),
      ]),
    );
  }

  // ═══════════════════════════════════════════════════════════
  //  SHARED UI HELPERS
  // ═══════════════════════════════════════════════════════════

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
      );

  Widget _singleDropdown(String label, String? value, List<String> items, ValueChanged<String?> onChanged) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _label(label),
      _dropdownField(value, items, onChanged),
    ]);
  }

  Widget _dropdownRow(String label, String? from, String? to, List<String> items,
      ValueChanged<String?> onFrom, ValueChanged<String?> onTo) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _label(label),
      Row(children: [
        Expanded(child: _dropdownField(from, items, onFrom, hint: 'Select')),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('to')),
        Expanded(child: _dropdownField(to, items, onTo, hint: 'Select')),
      ]),
    ]);
  }

  Widget _dropdownField(String? value, List<String> items, ValueChanged<String?> onChanged, {String hint = 'Select'}) {
    return DropdownButtonFormField<String>(
      value: value,
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textHint),
      style: const TextStyle(fontSize: 13, color: AppColors.textPrimary, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textHint, fontSize: 13),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        filled: true,
        fillColor: AppColors.surfaceVariant,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.border)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.border)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.primary)),
      ),
      items: items.map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
      onChanged: onChanged,
    );
  }

  Widget _yesNoRadio(String? value, ValueChanged<String?> onChanged) {
    return Row(children: [
      Row(children: [
        Radio<String>(value: 'Yes', groupValue: value, activeColor: AppColors.primary, onChanged: onChanged),
        const Text('Yes'),
      ]),
      const SizedBox(width: 16),
      Row(children: [
        Radio<String>(value: 'No', groupValue: value, activeColor: AppColors.primary, onChanged: onChanged),
        const Text('No'),
      ]),
    ]);
  }

  Widget _actionButtons({required VoidCallback onSave, required VoidCallback onReset, required VoidCallback onSearch}) {
    return Row(children: [
      Expanded(child: _outlinedSmallButton('Save search', onSave)),
      const SizedBox(width: 8),
      Expanded(child: _outlinedSmallButton('Reset', onReset)),
      const SizedBox(width: 8),
      Expanded(
        child: ElevatedButton(
          onPressed: onSearch,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppColors.r32)),
          ),
          child: const Text('Search', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
        ),
      ),
    ]);
  }

  Widget _outlinedSmallButton(String label, VoidCallback onTap) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppColors.r32)),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//  FULL-SCREEN SEARCH RESULTS
// ═══════════════════════════════════════════════════════════════

class _SearchResultsScreen extends StatelessWidget {
  final String title;
  final List<Profile> results;
  const _SearchResultsScreen({required this.title, required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: Text(title,
            style: const TextStyle(
                color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w800)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(28),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text('${results.length} profiles found',
                style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
          ),
        ),
      ),
      body: results.isEmpty
          ? const Center(
              child: Text('No profiles match this search.',
                  style: TextStyle(color: AppColors.textHint, fontSize: 13)),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: results.length,
              itemBuilder: (ctx, i) => _SearchCard(profile: results[i]),
            ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//  SEARCH RESULT CARD (unchanged)
// ═══════════════════════════════════════════════════════════════

class _SearchCard extends StatelessWidget {
  final Profile profile;
  const _SearchCard({required this.profile});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppColors.r16), boxShadow: AppColors.shadowSm),
      child: Row(children: [
        ClipRRect(borderRadius: const BorderRadius.horizontal(left: Radius.circular(AppColors.r16)),
          child: ProfileImage(profile.image, width: 96, height: 110, fit: BoxFit.cover,
              errorWidget: Container(width: 96, height: 110, color: AppColors.primaryLight,
                  child: const Icon(Icons.person, size: 40, color: AppColors.primary)))),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Expanded(child: Text('${profile.name}, ${profile.age}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.textPrimary), maxLines: 1, overflow: TextOverflow.ellipsis)),
              if (profile.matchPct != null) Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(gradient: AppColors.gradGold, borderRadius: BorderRadius.circular(20)),
                child: Text('${profile.matchPct}%', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900)),
              ),
            ]),
            const SizedBox(height: 4),
            Text(profile.profession, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary), maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 3),
            Row(children: [
              const Icon(Icons.location_on_outlined, size: 11, color: AppColors.textHint),
              const SizedBox(width: 3),
              Flexible(child: Text(profile.city, style: const TextStyle(fontSize: 11, color: AppColors.textHint), maxLines: 1, overflow: TextOverflow.ellipsis)),
              const SizedBox(width: 8),
              const Icon(Icons.height_rounded, size: 11, color: AppColors.textHint),
              const SizedBox(width: 3),
              Text(profile.height, style: const TextStyle(fontSize: 11, color: AppColors.textHint)),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => UserDetailScreen(profile: profile))),
                child: Container(
                height: 32,
                decoration: BoxDecoration(border: Border.all(color: AppColors.primary), borderRadius: BorderRadius.circular(AppColors.r32)),
                child: const Center(child: Text('View', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.primary))),
              ))),
              const SizedBox(width: 8),
              Expanded(flex: 2, child: GestureDetector(onTap: () {}, child: Container(
                height: 32,
                decoration: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(AppColors.r32)),
                child: const Center(child: Text('Express Interest', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.white))),
              ))),
            ]),
          ]),
        )),
      ]),
    );
  }
}