// Bandhan 2026 — Premium Matches Screen
import 'package:flutter/material.dart';
import 'package:matrimony_app/model/profile_model.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/profile_image.dart';
import 'package:matrimony_app/view/user_detail_screen.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});
  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> with SingleTickerProviderStateMixin {
  late TabController _tab;
  late List<Profile> _profiles;
  final _tabs = ['All Matches', 'Premium', 'Near You', 'New', 'Compatible'];

  @override
  void initState() {
    super.initState();
    _profiles = List.from(appProfiles);
    _tab = TabController(length: 5, vsync: this);
    _tab.addListener(() => setState(() {}));
  }

  @override
  void dispose() { _tab.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(children: [
        _buildHero(top),
        _buildTabBar(),
        Expanded(child: TabBarView(controller: _tab, children: List.generate(5, (_) => _buildList()))),
      ]),
    );
  }

  Widget _buildHero(double top) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.gradHero, boxShadow: AppColors.shadowMd),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, top + 16, 20, 0),
          child: Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Your Matches', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900, letterSpacing: -0.6)),
              const SizedBox(height: 4),
              Row(children: [
                Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFF4ADE80), shape: BoxShape.circle)),
                const SizedBox(width: 6),
                const Text('128 profiles matching your preferences', style: TextStyle(color: Colors.white70, fontSize: 12)),
              ]),
            ])),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
              child: const Row(children: [
                Icon(Icons.tune_rounded, color: Colors.white, size: 16),
                SizedBox(width: 6),
                Text('Filter', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
              ]),
            ),
          ]),
        ),
        const SizedBox(height: 14),
        // Quick filter chips horizontal scroll
        SizedBox(height: 36, child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16), children: [
          ...[('Age 24-30', true), ('Hindu', false), ('Kerala', false), ('Software', false), ('Verified', false)].map((c) => Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: c.$2 ? Colors.white : Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: c.$2 ? null : Border.all(color: Colors.white30),
            ),
            child: Text(c.$1, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600,
                color: c.$2 ? AppColors.primary : Colors.white)),
          )),
        ])),
        const SizedBox(height: 16),
      ]),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(AppColors.r12)),
        child: TabBar(
          controller: _tab,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicator: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(10), boxShadow: AppColors.shadowPrimary),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: AppColors.textHint,
          labelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
          unselectedLabelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          tabs: _tabs.map((t) => Tab(text: t)).toList(),
        ),
      ),
    );
  }

  Widget _buildList() => ListView.builder(
    padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
    physics: const BouncingScrollPhysics(),
    itemCount: _profiles.length,
    itemBuilder: (ctx, i) => _ProfileCard(
      profile: _profiles[i],
      onLike: () => setState(() => _profiles[i].liked = !_profiles[i].liked),
      onInterest: () => setState(() => _profiles[i].interested = !_profiles[i].interested),
      onShortlist: () => setState(() => _profiles[i].shortlisted = !_profiles[i].shortlisted),
    ),
  );
}

// ─── Profile Card ─────────────────────────────────────────────────────────────
class _ProfileCard extends StatelessWidget {
  final Profile profile;
  final VoidCallback onLike, onInterest, onShortlist;
  const _ProfileCard({required this.profile, required this.onLike, required this.onInterest, required this.onShortlist});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppColors.r20), boxShadow: AppColors.shadowSm),
      child: Column(children: [
        // Photo area
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(AppColors.r20)),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Stack(fit: StackFit.expand, children: [
              ProfileImage(profile.image, fit: BoxFit.cover,
                  errorWidget: Container(color: AppColors.primaryLight,
                      child: const Icon(Icons.person, size: 80, color: AppColors.primary))),
              const DecoratedBox(decoration: BoxDecoration(gradient: AppColors.gradCard)),
              // Match %
              Positioned(top: 14, left: 14, child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(gradient: AppColors.gradGold, borderRadius: BorderRadius.circular(20), boxShadow: AppColors.shadowGold),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  const Icon(Icons.favorite_rounded, color: Colors.white, size: 10),
                  const SizedBox(width: 4),
                  Text('${profile.matchPct ?? "--"}% Match', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w900)),
                ]),
              )),
              // Shortlist top right
              Positioned(top: 14, right: 14, child: GestureDetector(
                onTap: onShortlist,
                child: Container(width: 36, height: 36,
                  decoration: BoxDecoration(color: profile.shortlisted ? AppColors.gold : Colors.black.withOpacity(0.4), shape: BoxShape.circle),
                  child: Icon(profile.shortlisted ? Icons.bookmark_rounded : Icons.bookmark_border_rounded, color: Colors.white, size: 18)),
              )),
              // Badge row
              Positioned(top: 58, left: 14, child: Row(children: [
                if (profile.verified) _Badge('Verified', AppColors.blue, Icons.verified_rounded),
                if (profile.premium) Padding(padding: const EdgeInsets.only(left: 6), child: _Badge('Premium', AppColors.gold, Icons.workspace_premium_rounded)),
                if (profile.assistedService) Padding(padding: const EdgeInsets.only(left: 6), child: _Badge('Assisted', AppColors.success, Icons.support_agent_rounded)),
              ])),
              // Bottom name overlay
              Positioned(left: 0, right: 0, bottom: 0, child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                  Text('${profile.name}, ${profile.age}', style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: -0.4)),
                  Text('${profile.profession} · ${profile.city}', style: const TextStyle(color: Color(0xCCFFFFFF), fontSize: 13)),
                ]),
              )),
            ]),
          ),
        ),
        // Detail section
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            // Info grid
            Row(children: [
              Expanded(child: _InfoItem(Icons.school_outlined, profile.education)),
              const SizedBox(width: 10),
              Expanded(child: _InfoItem(Icons.height_rounded, profile.height)),
            ]),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(child: _InfoItem(Icons.temple_hindu_outlined, '${profile.religion} · ${profile.caste}')),
              const SizedBox(width: 10),
              Expanded(child: _InfoItem(Icons.account_balance_wallet_outlined, profile.income)),
            ]),
            const SizedBox(height: 8),
            Row(children: [
              const Icon(Icons.access_time_rounded, size: 12, color: AppColors.textHint),
              const SizedBox(width: 5),
              Flexible(child: Text(profile.lastSeen, style: const TextStyle(fontSize: 11, color: AppColors.textHint))),
              const SizedBox(width: 8),
              Text('· ${profile.profileId}', style: const TextStyle(fontSize: 11, color: AppColors.textHint)),
            ]),
            const SizedBox(height: 14),
            // Action buttons
            Row(children: [
              // Like
              GestureDetector(onTap: onLike, child: Container(width: 44, height: 44,
                decoration: BoxDecoration(color: profile.liked ? AppColors.primaryLight : AppColors.surfaceVariant, shape: BoxShape.circle),
                child: Icon(profile.liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                    color: profile.liked ? AppColors.primary : AppColors.textHint, size: 20))),
              const SizedBox(width: 8),
              // View Profile
              Expanded(child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => UserDetailScreen(profile: profile))),
                child: Container(
                height: 44,
                decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(AppColors.r32), border: Border.all(color: AppColors.border)),
                child: const Center(child: Text('View Profile', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textSecondary))),
              ))),
              const SizedBox(width: 8),
              // Express Interest
              Expanded(flex: 2, child: GestureDetector(onTap: onInterest, child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 44,
                decoration: BoxDecoration(
                  gradient: profile.interested ? null : AppColors.gradPrimary,
                  color: profile.interested ? AppColors.primaryLight : null,
                  borderRadius: BorderRadius.circular(AppColors.r32),
                  border: profile.interested ? Border.all(color: AppColors.primary) : null,
                  boxShadow: profile.interested ? null : AppColors.shadowPrimary,
                ),
                child: Center(child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(profile.interested ? Icons.check_rounded : Icons.favorite_border_rounded,
                      color: profile.interested ? AppColors.primary : Colors.white, size: 15),
                  const SizedBox(width: 6),
                  Text(profile.interested ? 'Interest Sent!' : 'Express Interest',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800,
                          color: profile.interested ? AppColors.primary : Colors.white)),
                ])),
              ))),
            ]),
          ]),
        ),
      ]),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label; final Color color; final IconData icon;
  const _Badge(this.label, this.color, this.icon);
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
    child: Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(icon, color: Colors.white, size: 10), const SizedBox(width: 4),
      Text(label, style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w800)),
    ]),
  );
}

class _InfoItem extends StatelessWidget {
  final IconData icon; final String text;
  const _InfoItem(this.icon, this.text);
  @override
  Widget build(BuildContext context) => Row(children: [
    Icon(icon, size: 13, color: AppColors.textHint), const SizedBox(width: 5),
    Expanded(child: Text(text, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary), maxLines: 1, overflow: TextOverflow.ellipsis)),
  ]);
}