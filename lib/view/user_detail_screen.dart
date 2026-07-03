// Bandhan 2026 — User Details Screen
import 'package:flutter/material.dart';
import 'package:matrimony_app/model/profile_model.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/profile_image.dart';

class UserDetailScreen extends StatefulWidget {
  final Profile profile;
  const UserDetailScreen({super.key, required this.profile});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _ac;

  @override
  void initState() {
    super.initState();
    _ac = AnimationController(vsync: this, duration: const Duration(milliseconds: 700))..forward();
  }

  @override
  void dispose() {
    _ac.dispose();
    super.dispose();
  }

  Widget _fade(double start, Widget child) {
    final a = CurvedAnimation(
      parent: _ac,
      curve: Interval(start.clamp(0.0, .85), (start + .4).clamp(0.0, 1.0), curve: Curves.easeOut),
    );
    return FadeTransition(
      opacity: a,
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, .03), end: Offset.zero).animate(a),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.profile;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: _HeroPhoto(
                  profile: p,
                  onLike: () => setState(() => p.liked = !p.liked),
                ),
              ),
              SliverToBoxAdapter(child: _fade(0.0, _IdentityCard(profile: p))),
              SliverToBoxAdapter(child: _fade(0.08, _QuickStatsRow(profile: p))),
              if (p.about.isNotEmpty)
                SliverToBoxAdapter(child: _fade(0.14, _AboutCard(about: p.about))),
              SliverToBoxAdapter(child: _fade(0.20, _BasicInfoCard(profile: p))),
              if (p.hobbies.isNotEmpty)
                SliverToBoxAdapter(child: _fade(0.26, _HobbiesCard(hobbies: p.hobbies))),
              const SliverToBoxAdapter(child: SizedBox(height: 110)),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            left: 16,
            child: _FloatBtn(
              icon: Icons.arrow_back_ios_new_rounded,
              onTap: () => Navigator.maybePop(context),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _BottomBar(
              interested: p.interested,
              onMessage: () {},
              onInterest: () => setState(() => p.interested = !p.interested),
            ),
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  HERO PHOTO
// ════════════════════════════════════════════════════════════════════
class _HeroPhoto extends StatelessWidget {
  final Profile profile;
  final VoidCallback onLike;
  const _HeroPhoto({required this.profile, required this.onLike});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ProfileImage(
            profile.image,
            fit: BoxFit.cover,
            errorWidget: Container(
              color: AppColors.primaryLight,
              child: const Icon(Icons.person, size: 90, color: AppColors.primary),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.30),
                    Colors.transparent,
                    Colors.black.withOpacity(.70),
                  ],
                  stops: const [0.0, 0.45, 1.0],
                ),
              ),
            ),
          ),
          // Like button
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            right: 16,
            child: GestureDetector(
              onTap: onLike,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: profile.liked ? AppColors.primary : Colors.white.withOpacity(.90),
                  borderRadius: BorderRadius.circular(AppColors.r12),
                  boxShadow: AppColors.shadowSm,
                ),
                child: Icon(
                  profile.liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                  color: profile.liked ? Colors.white : AppColors.primary,
                  size: 18,
                ),
              ),
            ),
          ),
          // Match % chip
          if (profile.matchPct != null)
            Positioned(
              top: MediaQuery.of(context).padding.top + 12,
              right: 66,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  gradient: AppColors.gradGold,
                  borderRadius: BorderRadius.circular(AppColors.r12),
                  boxShadow: AppColors.shadowGold,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.favorite_rounded, color: Colors.white, size: 11),
                    const SizedBox(width: 4),
                    Text('${profile.matchPct}% match',
                        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800)),
                  ],
                ),
              ),
            ),
          // Name overlay — bottom
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text('${profile.name}, ${profile.age}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: -0.5),
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(width: 8),
                    if (profile.verified)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                        decoration: BoxDecoration(color: AppColors.blue, borderRadius: BorderRadius.circular(8)),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.verified_rounded, color: Colors.white, size: 11),
                            SizedBox(width: 3),
                            Text('Verified', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, color: Colors.white70, size: 13),
                    const SizedBox(width: 3),
                    Text(profile.city, style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500)),
                    const SizedBox(width: 10),
                    const Icon(Icons.work_outline_rounded, color: Colors.white70, size: 13),
                    const SizedBox(width: 3),
                    Flexible(
                      child: Text(profile.profession,
                          style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  IDENTITY CARD — name row + last-seen pill
// ════════════════════════════════════════════════════════════════════
class _IdentityCard extends StatelessWidget {
  final Profile profile;
  const _IdentityCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppColors.r20),
        border: Border.all(color: AppColors.border),
        boxShadow: AppColors.shadowXs,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Profile ID · ${profile.profileId}', style: AppColors.caption),
                const SizedBox(height: 2),
                Text(profile.income.isEmpty ? 'Income not shared' : profile.income, style: AppColors.h4),
              ],
            ),
          ),
          if (profile.lastSeen.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.successLight,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.success.withOpacity(.25)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 7, height: 7, decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle)),
                  const SizedBox(width: 5),
                  Text(profile.lastSeen, style: const TextStyle(color: AppColors.success, fontSize: 10, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  QUICK STATS ROW — height · religion · community · education
// ════════════════════════════════════════════════════════════════════
class _QuickStatsRow extends StatelessWidget {
  final Profile profile;
  const _QuickStatsRow({required this.profile});

  @override
  Widget build(BuildContext context) {
    final items = [
      (Icons.height_rounded, profile.height.isEmpty ? '—' : profile.height, 'Height', AppColors.primaryLight, AppColors.primary),
      (Icons.auto_awesome_outlined, profile.religion.isEmpty ? '—' : profile.religion, 'Religion', AppColors.goldLight, AppColors.goldDark),
      (Icons.people_outline_rounded, profile.caste.isEmpty ? '—' : profile.caste, 'Community', AppColors.blueLight, AppColors.blue),
      (Icons.school_outlined, profile.education.isEmpty ? '—' : profile.education.split('–').first.trim(), 'Education', AppColors.successLight, AppColors.success),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Row(
        children: items
            .map((s) => Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 4),
                    decoration: BoxDecoration(color: s.$4, borderRadius: BorderRadius.circular(AppColors.r16)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(s.$1, color: s.$5, size: 17),
                        const SizedBox(height: 6),
                        Text(s.$2,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: s.$5)),
                        const SizedBox(height: 2),
                        Text(s.$3, style: AppColors.caption),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  ABOUT CARD
// ════════════════════════════════════════════════════════════════════
class _AboutCard extends StatelessWidget {
  final String about;
  const _AboutCard({required this.about});

  @override
  Widget build(BuildContext context) {
    return _WarmCard(
      margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CardTitle(icon: Icons.person_outline_rounded, label: 'About Me'),
          const SizedBox(height: 10),
          Text(about, style: AppColors.body1),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  BASIC INFO CARD
// ════════════════════════════════════════════════════════════════════
class _BasicInfoCard extends StatelessWidget {
  final Profile profile;
  const _BasicInfoCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    final rows = [
      (Icons.work_outline_rounded, 'Profession', profile.profession),
      (Icons.school_outlined, 'Education', profile.education),
      (Icons.location_city_outlined, 'City', profile.city),
      (Icons.auto_awesome_outlined, 'Religion', profile.religion),
      (Icons.people_outline_rounded, 'Community', profile.caste),
      (Icons.height_rounded, 'Height', profile.height),
      (Icons.account_balance_wallet_outlined, 'Income', profile.income),
    ].where((r) => r.$3.isNotEmpty).toList();

    return _WarmCard(
      margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CardTitle(icon: Icons.list_alt_rounded, label: 'Basic Information'),
          const SizedBox(height: 12),
          ...rows.asMap().entries.map((e) {
            final r = e.value;
            final isLast = e.key == rows.length - 1;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle),
                        child: Icon(r.$1, color: AppColors.primary, size: 14),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(width: 88, child: Text(r.$2, style: AppColors.body2)),
                      Expanded(
                        child: Text(r.$3,
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                      ),
                    ],
                  ),
                ),
                if (!isLast) const Divider(color: AppColors.divider, height: 1),
              ],
            );
          }),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  HOBBIES CARD
// ════════════════════════════════════════════════════════════════════
class _HobbiesCard extends StatelessWidget {
  final List<String> hobbies;
  const _HobbiesCard({required this.hobbies});

  static const _combos = [
    (AppColors.primaryLight, AppColors.primary),
    (AppColors.blueLight, AppColors.blue),
    (AppColors.goldLight, AppColors.goldDark),
    (AppColors.successLight, AppColors.success),
    (AppColors.purpleLight, AppColors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return _WarmCard(
      margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CardTitle(icon: Icons.interests_outlined, label: 'Hobbies & Interests'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: hobbies.asMap().entries.map((e) {
              final c = _combos[e.key % _combos.length];
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                decoration: BoxDecoration(
                  color: c.$1,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: c.$2.withOpacity(.25)),
                ),
                child: Text(e.value, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: c.$2)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  BOTTOM ACTION BAR
// ════════════════════════════════════════════════════════════════════
class _BottomBar extends StatelessWidget {
  final bool interested;
  final VoidCallback onMessage, onInterest;
  const _BottomBar({required this.interested, required this.onMessage, required this.onInterest});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 14, 20, MediaQuery.of(context).padding.bottom + 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: const Border(top: BorderSide(color: AppColors.divider)),
        boxShadow: AppColors.shadowNav,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onMessage,
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(AppColors.r16),
                border: Border.all(color: AppColors.border),
              ),
              child: const Icon(Icons.chat_bubble_outline_rounded, color: AppColors.textSecondary, size: 22),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: onInterest,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: interested ? null : AppColors.gradPrimary,
                  color: interested ? AppColors.primaryLight : null,
                  borderRadius: BorderRadius.circular(AppColors.r16),
                  border: interested ? Border.all(color: AppColors.primary) : null,
                  boxShadow: interested ? null : AppColors.shadowPrimary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      interested ? Icons.check_circle_rounded : Icons.favorite_border_rounded,
                      color: interested ? AppColors.primary : Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      interested ? 'Interest Sent!' : 'Express Interest',
                      style: TextStyle(
                          color: interested ? AppColors.primary : Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  SHARED PRIMITIVES
// ════════════════════════════════════════════════════════════════════
class _WarmCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  const _WarmCard({required this.child, required this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(18),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppColors.r20),
        border: Border.all(color: AppColors.border),
        boxShadow: AppColors.shadowXs,
      ),
      child: child,
    );
  }
}

class _CardTitle extends StatelessWidget {
  final IconData icon;
  final String label;
  const _CardTitle({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: const BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle),
          child: Icon(icon, color: AppColors.primary, size: 14),
        ),
        const SizedBox(width: 10),
        Text(label, style: AppColors.h3),
      ],
    );
  }
}

class _FloatBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _FloatBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.90),
          borderRadius: BorderRadius.circular(AppColors.r12),
          boxShadow: AppColors.shadowSm,
        ),
        child: Icon(icon, size: 16, color: AppColors.primary),
      ),
    );
  }
}
