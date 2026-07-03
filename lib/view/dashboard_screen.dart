// Bandhan 2026 — Premium Dashboard Screen
import 'package:flutter/material.dart';
import 'package:matrimony_app/model/profile_model.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/app_drawer.dart';
import 'package:matrimony_app/view/user_detail_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<Profile> _profiles;
  int _storyPage = 0;
  static const _completion = 0.85;
  final _stories = const [
    ('Ananya & Rajan', 'Met on VivahBharath in 2023. Now happily married!', 'https://randomuser.me/api/portraits/women/44.jpg'),
    ('Priya & Arjun', 'Found each other within a week. So blessed!', 'https://randomuser.me/api/portraits/women/65.jpg'),
    ('Meena & Suresh', 'VivahBharath made our dream come true.', 'https://randomuser.me/api/portraits/women/68.jpg'),
  ];

  @override
  void initState() { super.initState(); _profiles = List.from(appProfiles); }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      drawer: const AppDrawer(),
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(child: _appBar(top)),
        SliverToBoxAdapter(child: _heroCard()),
        SliverToBoxAdapter(child: _statsStrip()),
        SliverToBoxAdapter(child: _quickActions()),
        SliverToBoxAdapter(child: _secTitle('Daily Recommendations', 'Handpicked for you today', timer: true)),
        SliverToBoxAdapter(child: _dailyPicks()),
        SliverToBoxAdapter(child: _interestsBanner()),
        SliverToBoxAdapter(child: _secTitle('Recent Visitors', '43 people visited')),
        SliverToBoxAdapter(child: _visitorsRow()),
        SliverToBoxAdapter(child: _upgradeBanner()),
        SliverToBoxAdapter(child: _secTitle('Success Stories', 'Real couples, real happiness')),
        SliverToBoxAdapter(child: _successCarousel()),
        SliverToBoxAdapter(child: _assistedBanner()),
        const SliverToBoxAdapter(child: SizedBox(height: 120)),
      ]),
    );
  }

  Widget _appBar(double top) => Container(
    color: AppColors.surface, padding: EdgeInsets.fromLTRB(20, top + 14, 20, 14),
    child: Row(children: [
      GestureDetector(
        onTap: () => _scaffoldKey.currentState?.openDrawer(),
        child: Container(width: 38, height: 38,
            decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.menu_rounded, size: 20, color: AppColors.textSecondary)),
      ),
      const SizedBox(width: 10),
      Container(width: 38, height: 38,
          decoration: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(10)),
          child: const Center(child: Text('V', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900)))),
      const SizedBox(width: 10),
      const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('VivahBharath', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: AppColors.textPrimary, letterSpacing: -0.3)),
        Text('Matrimony', style: TextStyle(fontSize: 9, color: AppColors.roseGold, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
      ]),
      const Spacer(),
      _DashIconBtn(icon: Icons.notifications_outlined, badge: 3),
      const SizedBox(width: 8),
      Container(width: 38, height: 38,
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.roseGold, width: 2)),
          child: ClipOval(child: _ProfileImage('assets/image/arun.png', fit: BoxFit.cover,
              errorWidget: Container(color: AppColors.primaryLight, child: const Icon(Icons.person, color: AppColors.primary, size: 22))))),
    ]),
  );

  Widget _heroCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      decoration: BoxDecoration(gradient: AppColors.gradHero, borderRadius: BorderRadius.circular(AppColors.r24), boxShadow: AppColors.shadowPrimary),
      child: Stack(children: [
        Positioned(top: -25, right: -25, child: Container(width: 130, height: 130,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.05)))),
        Padding(padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              SizedBox(width: 88, height: 88, child: Stack(alignment: Alignment.center, children: [
                SizedBox(width: 88, height: 88, child: CircularProgressIndicator(
                    value: _completion, strokeWidth: 4,
                    backgroundColor: Colors.white.withOpacity(0.15),
                    valueColor: const AlwaysStoppedAnimation(AppColors.roseGold))),
                Container(width: 76, height: 76,
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white.withOpacity(0.3), width: 2)),
                    child: ClipOval(child: _ProfileImage('assets/image/arun.png', fit: BoxFit.cover,
                        errorWidget: Container(color: AppColors.primaryLight, child: const Icon(Icons.person, color: AppColors.primary, size: 36))))),
              ])),
              const SizedBox(width: 16),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Good Morning, Arun', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500)),
                const SizedBox(height: 5),
                const Text('Welcome back to\nyour matrimony journey',
                    style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800, height: 1.25, letterSpacing: -0.3)),
                const SizedBox(height: 10),
                Row(children: [
                  _HeroChip(Icons.workspace_premium_rounded, 'Premium', AppColors.gold),
                  const SizedBox(width: 6),
                  _HeroChip(Icons.verified_rounded, 'Verified', AppColors.success),
                ]),
              ])),
            ]),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.fromLTRB(14, 11, 14, 13),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.18), borderRadius: BorderRadius.circular(14)),
              child: Column(children: [
                Row(children: [
                  const Text('Profile Completion', style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.w600)),
                  const Spacer(),
                  Text('${(_completion * 100).toInt()}%', style: const TextStyle(color: AppColors.roseGold, fontSize: 13, fontWeight: FontWeight.w900)),
                ]),
                const SizedBox(height: 7),
                ClipRRect(borderRadius: BorderRadius.circular(6), child: LinearProgressIndicator(value: _completion, minHeight: 7,
                    backgroundColor: Colors.white.withOpacity(0.18), valueColor: const AlwaysStoppedAnimation(AppColors.roseGold))),
                const SizedBox(height: 7),
                const Row(children: [
                  Icon(Icons.info_outline_rounded, color: Colors.white38, size: 10),
                  SizedBox(width: 4),
                  Text('Add horoscope to complete your profile', style: TextStyle(color: Colors.white54, fontSize: 10)),
                  Spacer(),
                  Text('Complete now', style: TextStyle(color: AppColors.roseGold, fontSize: 10, fontWeight: FontWeight.w700)),
                ]),
              ]),
            ),
            const SizedBox(height: 16),
          ]),
        ),
      ]),
    );
  }

  Widget _statsStrip() {
    const stats = [
      ('627', 'Profile Views',  Icons.visibility_outlined,     AppColors.blue,    AppColors.blueLight),
      ('43',  'Interests',      Icons.favorite_border_rounded, AppColors.primary, AppColors.primaryLight),
      ('18',  'Mutual Matches', Icons.handshake_outlined,      AppColors.success, AppColors.successLight),
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Row(children: List.generate(3, (i) {
        final s = stats[i];
        return Expanded(child: Container(
          margin: EdgeInsets.only(right: i < 2 ? 10 : 0),
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppColors.r16),
              boxShadow: AppColors.shadowXs, border: Border.all(color: AppColors.border)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(width: 30, height: 30, decoration: BoxDecoration(color: s.$5, borderRadius: BorderRadius.circular(8)), child: Icon(s.$3, color: s.$4, size: 15)),
            const SizedBox(height: 7),
            Text(s.$1, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: s.$4, letterSpacing: -0.5)),
            Text(s.$2, style: const TextStyle(fontSize: 9, color: AppColors.textHint, fontWeight: FontWeight.w500, height: 1.3)),
          ]),
        ));
      })),
    );
  }

  Widget _quickActions() {
    const a = [
      ('Search Profiles', Icons.search_rounded,             AppColors.primaryLight,  AppColors.primary),
      ('View Matches',    Icons.favorite_rounded,           AppColors.roseGoldLight, AppColors.roseGold),
      ('Interests',       Icons.volunteer_activism_rounded, AppColors.successLight,  AppColors.success),
      ('Upgrade Plan',    Icons.workspace_premium_rounded,  AppColors.goldLight,     AppColors.gold),
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Column(children: [
        Row(children: [_QABtn(a[0], right: true), _QABtn(a[1])]),
        const SizedBox(height: 10),
        Row(children: [_QABtn(a[2], right: true), _QABtn(a[3])]),
      ]),
    );
  }

  Widget _secTitle(String title, String sub, {bool timer = false}) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 22, 20, 12),
    child: Row(children: [
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: AppColors.textPrimary, letterSpacing: -0.3)),
        Text(sub, style: const TextStyle(fontSize: 11, color: AppColors.textHint)),
      ])),
      if (timer)
        Container(padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
            decoration: BoxDecoration(color: AppColors.successLight, borderRadius: BorderRadius.circular(20)),
            child: const Row(children: [
              Icon(Icons.timer_outlined, color: AppColors.success, size: 11),
              SizedBox(width: 4),
              Text('Refreshes in 8h', style: TextStyle(color: AppColors.success, fontSize: 9, fontWeight: FontWeight.w700)),
            ]))
      else
        const Text('See all', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w700)),
    ]),
  );

  Widget _dailyPicks() => SizedBox(height: 238, child: ListView.builder(
    scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16),
    physics: const BouncingScrollPhysics(), itemCount: _profiles.length,
    itemBuilder: (ctx, i) => _PickCard(profile: _profiles[i],
        onShortlist: () => setState(() => _profiles[i].shortlisted = !_profiles[i].shortlisted)),
  ));

  Widget _interestsBanner() => Container(
    margin: const EdgeInsets.fromLTRB(16, 18, 16, 0),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppColors.r20),
        boxShadow: AppColors.shadowSm, border: Border.all(color: AppColors.primaryMid)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(20)),
            child: const Row(children: [
              Icon(Icons.favorite_rounded, color: Colors.white, size: 11), SizedBox(width: 5),
              Text('New Interests', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800)),
            ])),
        const SizedBox(width: 8),
        const Text('3 people interested in you!', style: TextStyle(fontSize: 11, color: AppColors.textHint)),
        const Spacer(),
        const Text('View all', style: TextStyle(fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.w700)),
      ]),
      const SizedBox(height: 12),
      ..._profiles.take(3).map((p) => _IRow(profile: p)),
    ]),
  );

  Widget _visitorsRow() => SizedBox(height: 110, child: ListView.builder(
    scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16),
    physics: const BouncingScrollPhysics(), itemCount: _profiles.length,
    itemBuilder: (ctx, i) {
      final blurred = i >= 3;
      return Container(width: 78, margin: const EdgeInsets.only(right: 10),
        child: Column(children: [
          Stack(children: [
            Container(width: 64, height: 64,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.border, width: 2)),
                child: ClipOval(child: _ProfileImage(_profiles[i].image, fit: BoxFit.cover,
                    errorWidget: Container(color: AppColors.primaryLight,
                        child: const Icon(Icons.person, size: 28, color: AppColors.primary))))),
            if (blurred) Positioned.fill(child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black.withOpacity(0.6)),
                child: const Icon(Icons.lock_rounded, color: Colors.white, size: 20))),
          ]),
          const SizedBox(height: 6),
          Text(blurred ? '???' : _profiles[i].name.split(' ').first,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
              maxLines: 1, overflow: TextOverflow.ellipsis),
          Text('${_profiles[i].age} yrs', style: const TextStyle(fontSize: 9, color: AppColors.textHint)),
        ]),
      );
    },
  ));

  Widget _upgradeBanner() => Container(
    margin: const EdgeInsets.fromLTRB(16, 20, 16, 0),
    decoration: BoxDecoration(gradient: AppColors.gradPrimary,
        borderRadius: BorderRadius.circular(AppColors.r24), boxShadow: AppColors.shadowPrimary),
    child: Stack(children: [
      Positioned(right: -15, top: -15, child: Container(width: 120, height: 120,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.07)))),
      Padding(padding: const EdgeInsets.all(20), child: Row(children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(gradient: AppColors.gradGold, borderRadius: BorderRadius.circular(20)),
              child: const Text('PREMIUM PLAN', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 1.2))),
          const SizedBox(height: 10),
          const Text('Unlock\nFull Access', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w900, height: 1.2, letterSpacing: -0.5)),
          const SizedBox(height: 8),
          const Text('Call, WhatsApp & message any match.\nGet up to 61% OFF today.', style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5)),
          const SizedBox(height: 14),
          GestureDetector(onTap: () {}, child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 11),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(AppColors.r32)),
            child: const Text('View Plans', style: TextStyle(color: AppColors.primary, fontSize: 13, fontWeight: FontWeight.w900)),
          )),
        ])),
        const SizedBox(width: 16),
        Container(width: 86, height: 86,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.12)),
            child: const Icon(Icons.workspace_premium_rounded, color: AppColors.roseGold, size: 50)),
      ])),
    ]),
  );

  Widget _successCarousel() => Column(children: [
    SizedBox(height: 155, child: PageView.builder(
      onPageChanged: (p) => setState(() => _storyPage = p),
      itemCount: _stories.length, padEnds: false,
      controller: PageController(viewportFraction: 0.88),
      itemBuilder: (ctx, i) {
        final s = _stories[i];
        return Container(
          margin: EdgeInsets.fromLTRB(i == 0 ? 16 : 8, 0, 8, 0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF2C1810), Color(0xFF6B0F2A)], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(AppColors.r20),
          ),
          child: Row(children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppColors.r20), bottomLeft: Radius.circular(AppColors.r20)),
              child: Image.network(s.$3, width: 110, height: double.infinity, fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(width: 110, color: AppColors.primaryLight, child: const Icon(Icons.people_alt_rounded, size: 36, color: AppColors.primary))),
            ),
            Expanded(child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(color: AppColors.roseGold.withOpacity(0.2), borderRadius: BorderRadius.circular(6)),
                  child: const Text('SUCCESS STORY', style: TextStyle(color: AppColors.roseGold, fontSize: 7, fontWeight: FontWeight.w900, letterSpacing: 1))),
              const SizedBox(height: 7),
              Text(s.$1, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w800)),
              const SizedBox(height: 5),
              Text(s.$2, style: const TextStyle(color: Colors.white60, fontSize: 10, height: 1.5)),
            ]))),
          ]),
        );
      },
    )),
    const SizedBox(height: 10),
    Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(_stories.length, (i) => AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: _storyPage == i ? 18 : 6, height: 6, margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(color: _storyPage == i ? AppColors.primary : AppColors.border, borderRadius: BorderRadius.circular(3)),
    ))),
  ]);

  Widget _assistedBanner() => Container(
    margin: const EdgeInsets.fromLTRB(16, 22, 16, 0),
    decoration: BoxDecoration(color: const Color(0xFF0D2818), borderRadius: BorderRadius.circular(AppColors.r24)),
    child: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Container(width: 34, height: 34, decoration: const BoxDecoration(color: AppColors.gold, shape: BoxShape.circle),
            child: const Icon(Icons.support_agent_rounded, color: Colors.white, size: 18)),
        const SizedBox(width: 10),
        const Text('Assisted Service', style: TextStyle(color: AppColors.gold, fontSize: 15, fontWeight: FontWeight.w800)),
      ]),
      const SizedBox(height: 10),
      const Text('Find your match 3x faster with a dedicated Relationship Manager', style: TextStyle(color: Colors.white, fontSize: 13, height: 1.5)),
      const SizedBox(height: 10),
      ...['Handpicked compatible matches', 'Active follow-ups until you succeed', 'Monthly progress meetings'].map((f) => Padding(
        padding: const EdgeInsets.only(bottom: 7),
        child: Row(children: [
          const Icon(Icons.check_circle_rounded, color: Color(0xFF4ADE80), size: 14), const SizedBox(width: 8),
          Expanded(child: Text(f, style: const TextStyle(color: Colors.white70, fontSize: 12, height: 1.4))),
        ]),
      )),
      const SizedBox(height: 12),
      GestureDetector(onTap: () {}, child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
        decoration: BoxDecoration(color: AppColors.gold, borderRadius: BorderRadius.circular(AppColors.r32)),
        child: const Text('Get Your Relationship Manager', style: TextStyle(color: Color(0xFF0D2818), fontSize: 12, fontWeight: FontWeight.w900)),
      )),
    ])),
  );
}

class _HeroChip extends StatelessWidget {
  final IconData icon; final String label; final Color color;
  const _HeroChip(this.icon, this.label, this.color);
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(20), border: Border.all(color: color.withOpacity(0.4))),
    child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, color: color, size: 9), const SizedBox(width: 3), Text(label, style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.w700))]),
  );
}

class _QABtn extends StatelessWidget {
  final (String, IconData, Color, Color) data; final bool right;
  const _QABtn(this.data, {this.right = false});
  @override
  Widget build(BuildContext context) => Expanded(child: GestureDetector(onTap: () {},
    child: Container(
      margin: EdgeInsets.only(right: right ? 10 : 0),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppColors.r16), boxShadow: AppColors.shadowXs, border: Border.all(color: AppColors.border)),
      child: Row(children: [
        Container(width: 36, height: 36, decoration: BoxDecoration(color: data.$3, borderRadius: BorderRadius.circular(10)), child: Icon(data.$2, color: data.$4, size: 19)),
        const SizedBox(width: 10),
        Expanded(child: Text(data.$1, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textPrimary))),
      ]),
    ),
  ));
}

class _PickCard extends StatelessWidget {
  final Profile profile; final VoidCallback onShortlist;
  const _PickCard({required this.profile, required this.onShortlist});
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => UserDetailScreen(profile: profile))),
    child: Container(width: 158, margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppColors.r20), boxShadow: AppColors.shadowMd),
      child: ClipRRect(borderRadius: BorderRadius.circular(AppColors.r20),
        child: Stack(fit: StackFit.expand, children: [
          _ProfileImage(profile.image, fit: BoxFit.cover, errorWidget: Container(color: AppColors.primaryLight, child: const Icon(Icons.person, size: 60, color: AppColors.primary))),
          const DecoratedBox(decoration: BoxDecoration(gradient: AppColors.gradCard)),
          Positioned(top: 10, right: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(gradient: AppColors.gradGold, borderRadius: BorderRadius.circular(20)),
              child: Text('${profile.matchPct ?? "--"}%', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900)))),
          if (profile.verified) Positioned(top: 10, left: 10, child: Container(width: 22, height: 22, decoration: const BoxDecoration(color: AppColors.blue, shape: BoxShape.circle), child: const Icon(Icons.verified_rounded, color: Colors.white, size: 13))),
          Positioned(left: 0, right: 0, bottom: 0, child: Padding(padding: const EdgeInsets.fromLTRB(12, 0, 12, 12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            Text('${profile.name.split(" ").first}, ${profile.age}', style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800)),
            Text('${profile.height} . ${profile.city}', style: const TextStyle(color: Colors.white70, fontSize: 10)),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(child: GestureDetector(onTap: onShortlist, child: Container(
                padding: const EdgeInsets.symmetric(vertical: 7),
                decoration: BoxDecoration(color: profile.shortlisted ? AppColors.gold : Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(10), border: profile.shortlisted ? null : Border.all(color: Colors.white30)),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(profile.shortlisted ? Icons.bookmark_rounded : Icons.bookmark_border_rounded, color: Colors.white, size: 12),
                  const SizedBox(width: 4),
                  Text(profile.shortlisted ? 'Saved' : 'Save', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
                ]),
              ))),
              const SizedBox(width: 6),
              GestureDetector(onTap: () {}, child: Container(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                decoration: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(10)),
                child: const Text('Interest', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
              )),
            ]),
          ]))),
        ]),
      ),
    ),
  );
}

class _IRow extends StatelessWidget {
  final Profile profile;
  const _IRow({required this.profile});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(children: [
      Container(width: 42, height: 42, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.primaryMid, width: 2)),
          child: ClipOval(child: _ProfileImage(profile.image, fit: BoxFit.cover, errorWidget: Container(color: AppColors.primaryLight, child: const Icon(Icons.person, size: 22, color: AppColors.primary))))),
      const SizedBox(width: 10),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('${profile.name}, ${profile.age}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
        Text('${profile.profession} . ${profile.city}', style: const TextStyle(fontSize: 10, color: AppColors.textHint)),
      ])),
      const SizedBox(width: 6),
      _MiniBtn('Accept', AppColors.success, AppColors.successLight),
      const SizedBox(width: 5),
      _MiniBtn('Decline', AppColors.textHint, AppColors.surfaceVariant),
    ]),
  );
}

class _MiniBtn extends StatelessWidget {
  final String label; final Color color; final Color bg;
  const _MiniBtn(this.label, this.color, this.bg);
  @override
  Widget build(BuildContext context) => GestureDetector(onTap: () {}, child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
    child: Text(label, style: TextStyle(fontSize: 9, color: color, fontWeight: FontWeight.w800)),
  ));
}

class _DashIconBtn extends StatelessWidget {
  final IconData icon; final int badge;
  const _DashIconBtn({required this.icon, this.badge = 0});
  @override
  Widget build(BuildContext context) => Stack(clipBehavior: Clip.none, children: [
    Container(width: 38, height: 38, decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(12)), child: Icon(icon, size: 20, color: AppColors.textSecondary)),
    if (badge > 0) Positioned(top: -4, right: -4, child: Container(width: 16, height: 16,
        decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
        child: Center(child: Text('$badge', style: const TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.w900))))),
  ]);
}

class _ProfileImage extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final Widget errorWidget;
  const _ProfileImage(this.image, {this.fit = BoxFit.cover, required this.errorWidget});
  @override
  Widget build(BuildContext context) {
    if (image.startsWith('http')) {
      return Image.network(image, fit: fit, errorBuilder: (_, __, ___) => errorWidget);
    } else {
      return Image.asset(image, fit: fit, errorBuilder: (_, __, ___) => errorWidget);
    }
  }
}