// // Bandhan 2026 — Premium Search Screen
// import 'package:flutter/material.dart';
// import 'package:matrimony_app/model/profile_model.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/custom_widgets/profile_image.dart';
// import 'package:matrimony_app/view/user_detail_screen.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final _ctrl = TextEditingController();
//   bool _showResults = false;
//   late List<Profile> _results;

//   final _ageRange = RangeValues(22, 30);
//   final _filters = {'Religion': false, 'Community': false, 'Education': false,
//     'Occupation': false, 'Location': false, 'Verified': false, 'Premium': false};

//   @override
//   void initState() { super.initState(); _results = List.from(appProfiles); }
//   @override
//   void dispose() { _ctrl.dispose(); super.dispose(); }

//   void _doSearch() => setState(() { _showResults = true; _results = appProfiles
//     .where((p) => _ctrl.text.isEmpty || p.name.toLowerCase().contains(_ctrl.text.toLowerCase()) ||
//       p.city.toLowerCase().contains(_ctrl.text.toLowerCase()) ||
//       p.profession.toLowerCase().contains(_ctrl.text.toLowerCase())).toList(); });

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
//     return Container(
//       color: AppColors.surface,
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
//           child: Row(children: [
//             const Text('Filter By', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
//             const Spacer(),
//             GestureDetector(onTap: () {}, child: const Text('Advanced Filters', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w700))),
//           ]),
//         ),
//         SizedBox(height: 44, child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16), children: [
//           ...chips.map((c) => GestureDetector(
//             onTap: () {},
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



// Bandhan 2026 — Premium Search Screen
import 'package:flutter/material.dart';
import 'package:matrimony_app/model/profile_model.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/profile_image.dart';
import 'package:matrimony_app/view/user_detail_screen.dart';
import 'package:matrimony_app/view/advanced_filter_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _ctrl = TextEditingController();
  bool _showResults = false;
  late List<Profile> _results;

  AdvancedFilters _advanced = AdvancedFilters();

  @override
  void initState() { super.initState(); _results = List.from(appProfiles); }
  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  bool _matchesAdvanced(Profile p) {
    if (p.age < _advanced.ageRange.start || p.age > _advanced.ageRange.end) return false;
    if (_advanced.location != null &&
        !p.city.toLowerCase().contains(_advanced.location!.toLowerCase())) {
      return false;
    }
    if (_advanced.occupation != null &&
        !p.profession.toLowerCase().contains(_advanced.occupation!.toLowerCase())) {
      return false;
    }
    // TODO: wire religion / community / education / maritalStatus / verified /
    // premium / withPhoto / heightRange once those fields are confirmed on
    // your Profile model — the AdvancedFilters object already carries them.
    return true;
  }

  void _doSearch() => setState(() {
    _showResults = true;
    _results = appProfiles.where((p) {
      final matchesText = _ctrl.text.isEmpty ||
          p.name.toLowerCase().contains(_ctrl.text.toLowerCase()) ||
          p.city.toLowerCase().contains(_ctrl.text.toLowerCase()) ||
          p.profession.toLowerCase().contains(_ctrl.text.toLowerCase());
      return matchesText && _matchesAdvanced(p);
    }).toList();
  });

  Future<void> _openAdvancedFilters() async {
    final result = await Navigator.push<AdvancedFilters>(
      context,
      MaterialPageRoute(builder: (_) => AdvancedFilterScreen(initial: _advanced)),
    );
    if (result != null) {
      setState(() => _advanced = result);
      _doSearch();
    }
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(child: _buildHero(top)),
        SliverToBoxAdapter(child: _buildFilters()),
        if (_showResults) ...[
          SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Row(children: [
              Text('${_results.length} profiles found', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textSecondary)),
              const Spacer(),
              const Text('Sort by: Match%', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600)),
            ]),
          )),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
            sliver: SliverList(delegate: SliverChildBuilderDelegate(
              (ctx, i) => _SearchCard(profile: _results[i]),
              childCount: _results.length,
            )),
          ),
        ] else
          SliverToBoxAdapter(child: _buildEmptyState()),
      ]),
    );
  }

  Widget _buildHero(double top) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.gradHero, boxShadow: AppColors.shadowMd),
      padding: EdgeInsets.fromLTRB(20, top + 20, 20, 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Find Your', style: TextStyle(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.w400)),
        const Text('Perfect Partner', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: -1.0, height: 1.1)),
        const SizedBox(height: 6),
        const Text('Search across 50,000+ profiles', style: TextStyle(color: Colors.white60, fontSize: 13)),
        const SizedBox(height: 20),
        // Search bar
        Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(AppColors.r16), boxShadow: AppColors.shadowMd),
          child: Row(children: [
            Expanded(child: TextField(
              controller: _ctrl,
              onSubmitted: (_) => _doSearch(),
              decoration: const InputDecoration(
                hintText: 'Name, city, profession...',
                hintStyle: TextStyle(color: AppColors.textHint, fontSize: 14),
                prefixIcon: Icon(Icons.search_rounded, color: AppColors.textHint),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            )),
            GestureDetector(onTap: _doSearch, child: Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(AppColors.r12)),
              child: const Text('Search', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w800)),
            )),
          ]),
        ),
      ]),
    );
  }

  Widget _buildFilters() {
    final chips = [
      ('Age', Icons.cake_outlined), ('Religion', Icons.temple_hindu_outlined),
      ('Community', Icons.groups_outlined), ('Education', Icons.school_outlined),
      ('Occupation', Icons.work_outline_rounded), ('Location', Icons.location_on_outlined),
      ('Height', Icons.height_rounded), ('Marital Status', Icons.favorite_border_rounded),
    ];
    final activeCount = _advanced.activeCount;
    return Container(
      color: AppColors.surface,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
          child: Row(children: [
            const Text('Filter By', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
            const Spacer(),
            GestureDetector(
              onTap: _openAdvancedFilters,
              child: Row(children: [
                if (activeCount > 0) Container(
                  margin: const EdgeInsets.only(right: 6),
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(20)),
                  child: Text('$activeCount', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.white)),
                ),
                const Text('Advanced Filters', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w700)),
              ]),
            ),
          ]),
        ),
        SizedBox(height: 44, child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16), children: [
          ...chips.map((c) => GestureDetector(
            onTap: _openAdvancedFilters,
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(AppColors.r32),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(c.$2, size: 13, color: AppColors.textSecondary),
                const SizedBox(width: 6),
                Text(c.$1, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
              ]),
            ),
          )),
        ])),
        const SizedBox(height: 16),
        const Divider(height: 1, color: AppColors.border),
      ]),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(width: 100, height: 100, decoration: BoxDecoration(gradient: AppColors.gradHero, shape: BoxShape.circle),
          child: const Icon(Icons.search_rounded, size: 48, color: Colors.white)),
        const SizedBox(height: 24),
        const Text('Search for Your Match', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.textPrimary)),
        const SizedBox(height: 8),
        const Text('Enter a name, city, or profession to find profiles. Use filters for better results.', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: AppColors.textHint, height: 1.5)),
        const SizedBox(height: 24),
        GestureDetector(onTap: _doSearch, child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          decoration: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(AppColors.r32), boxShadow: AppColors.shadowPrimary),
          child: const Text('Show All Profiles', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14)),
        )),
      ]),
    );
  }
}

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