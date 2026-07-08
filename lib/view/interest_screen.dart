// ─── Bandhan 2026 — Interests Screen ─────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:matrimony_app/model/profile_model.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/profile_image.dart';
import 'package:matrimony_app/view/user_detail_screen.dart';

class InterestsScreen extends StatefulWidget {
  final int initialTabIndex;
  const InterestsScreen({super.key, this.initialTabIndex = 0});
  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tab;
  final _tabs = ['Sent', 'Received', 'Mutual'];

  // Sample partition of appProfiles into tabs
  List<Profile> get _sent => [appProfiles[0], appProfiles[2], appProfiles[4]];
  List<Profile> get _received => [appProfiles[1], appProfiles[3], appProfiles[5]];
  List<Profile> get _mutual => [appProfiles[0], appProfiles[3]];

  @override
  void initState() {
    super.initState();
    _tab = TabController(
        length: 3, vsync: this, initialIndex: widget.initialTabIndex);
    _tab.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  //List<Profile> get _current => [_sent, _received, _mutual][_tab.index];

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildHeader(top),
          _buildStatsRow(),
          _buildTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tab,
              children: [_sent, _received, _mutual].map(_buildList).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // ── Header ────────────────────────────────────────────────────────────────
  Widget _buildHeader(double top) {
    return Container(
      color: AppColors.surface,
      padding: EdgeInsets.fromLTRB(20, top + 14, 20, 14),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Interests',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary, letterSpacing: -0.5)),
                Text('Track sent, received & mutual interests',
                    style: TextStyle(fontSize: 12, color: AppColors.textHint)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 40, height: 40,
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(AppColors.r12),
              ),
              child: const Icon(Icons.filter_list_rounded,
                  size: 20, color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }

  // ── Stats row ─────────────────────────────────────────────────────────────
  Widget _buildStatsRow() {
    final stats = [
      ('Sent', _sent.length, AppColors.primary, AppColors.primaryLight),
      ('Received', _received.length, AppColors.purple, AppColors.purpleLight),
      ('Mutual', _mutual.length, AppColors.success, AppColors.successLight),
    ];
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: stats.map((s) => Expanded(
          child: Container(
            margin: EdgeInsets.only(right: s == stats.last ? 0 : 10),
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: s.$4,
              borderRadius: BorderRadius.circular(AppColors.r16),
            ),
            child: Column(
              children: [
                Text('${s.$2}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800,
                        color: s.$3, letterSpacing: -0.5)),
                const SizedBox(height: 2),
                Text(s.$1,
                    style: TextStyle(fontSize: 11, color: s.$3.withOpacity(0.8),
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        )).toList(),
      ),
    );
  }

  // ── Tab bar ───────────────────────────────────────────────────────────────
  Widget _buildTabBar() {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
      child: Container(
        height: 44,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(AppColors.r12),
        ),
        child: TabBar(
          controller: _tab,
          indicator: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppColors.r8),
            boxShadow: AppColors.shadowPrimary,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: AppColors.textHint,
          labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          unselectedLabelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          tabs: _tabs.map((t) => Tab(text: t)).toList(),
        ),
      ),
    );
  }

  // ── List builder ──────────────────────────────────────────────────────────
  Widget _buildList(List<Profile> list) {
    if (list.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80, height: 80,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.volunteer_activism_outlined,
                  size: 36, color: AppColors.primary),
            ),
            const SizedBox(height: 16),
            const Text('Nothing here yet',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary)),
            const SizedBox(height: 6),
            const Text('Your interests will appear here',
                style: TextStyle(fontSize: 13, color: AppColors.textHint)),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (ctx, i) => _InterestCard(
        profile: list[i],
        tabIndex: _tab.index,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => UserDetailScreen(profile: list[i]))),
        onAction: () => setState(() {}),
      ),
    );
  }
}

// ─── Interest Card ────────────────────────────────────────────────────────────
class _InterestCard extends StatefulWidget {
  final Profile profile;
  final int tabIndex;
  final VoidCallback onTap;
  final VoidCallback onAction;
  const _InterestCard({
    required this.profile, required this.tabIndex,
    required this.onTap, required this.onAction,
  });
  @override
  State<_InterestCard> createState() => _InterestCardState();
}

class _InterestCardState extends State<_InterestCard> {
  bool _accepted = false;
  bool _declined = false;

  @override
  Widget build(BuildContext context) {
    final colors = [AppColors.primary, AppColors.purple, AppColors.success];
    final bgColors = [AppColors.primaryLight, AppColors.purpleLight, AppColors.successLight];
    final labels = ['Interest Sent', 'Interest Received', 'Mutual Match'];
    final icons = [Icons.send_rounded, Icons.inbox_rounded, Icons.favorite_rounded];

    final color = colors[widget.tabIndex];
    final bgColor = bgColors[widget.tabIndex];

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppColors.r20),
          boxShadow: AppColors.shadowSm,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  // Avatar
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppColors.r16),
                        child: ProfileImage(widget.profile.image,
                            width: 76, height: 76, fit: BoxFit.cover,
                            errorWidget: Container(
                              width: 76, height: 76, color: AppColors.surfaceVariant,
                              child: const Icon(Icons.person, size: 36, color: AppColors.textHint),
                            )),
                      ),
                      if (widget.profile.verified)
                        Positioned(
                          bottom: 4, right: 4,
                          child: Container(
                            width: 18, height: 18,
                            decoration: const BoxDecoration(
                                color: AppColors.blue, shape: BoxShape.circle),
                            child: const Icon(Icons.verified_rounded,
                                color: Colors.white, size: 11),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${widget.profile.name}, ${widget.profile.age}',
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800,
                                    color: AppColors.textPrimary),
                                maxLines: 1, overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // Status chip
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(icons[widget.tabIndex], size: 9, color: color),
                                  const SizedBox(width: 4),
                                  Text(labels[widget.tabIndex],
                                      style: TextStyle(fontSize: 9, color: color,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.work_outline_rounded,
                                size: 11, color: AppColors.textHint),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(widget.profile.profession,
                                  style: const TextStyle(fontSize: 12,
                                      color: AppColors.textHint),
                                  maxLines: 1, overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined,
                                size: 11, color: AppColors.textHint),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(widget.profile.city,
                                  style: const TextStyle(fontSize: 12, color: AppColors.textHint),
                                  maxLines: 1, overflow: TextOverflow.ellipsis),
                            ),
                            const SizedBox(width: 8),
                            if (widget.profile.matchPct != null)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLight,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text('${widget.profile.matchPct}% match',
                                    style: const TextStyle(fontSize: 9, color: AppColors.primary,
                                        fontWeight: FontWeight.w700)),
                              ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Action buttons by tab
                        if (widget.tabIndex == 1 && !_accepted && !_declined)
                          Row(
                            children: [
                              _ActionBtn('Accept', AppColors.success, AppColors.successLight,
                                  false, () => setState(() => _accepted = true)),
                              const SizedBox(width: 8),
                              _ActionBtn('Decline', AppColors.textHint, AppColors.surfaceVariant,
                                  false, () => setState(() => _declined = true)),
                            ],
                          )
                        else if (widget.tabIndex == 1 && _accepted)
                          _StatusChip('Accepted', AppColors.success, AppColors.successLight,
                              Icons.check_circle_rounded)
                        else if (widget.tabIndex == 1 && _declined)
                          _StatusChip('Declined', AppColors.textHint, AppColors.surfaceVariant,
                              Icons.cancel_rounded)
                        else if (widget.tabIndex == 2)
                          _ActionBtn('Send Message', AppColors.primary, AppColors.primaryLight,
                              false, () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Helpers ──────────────────────────────────────────────────────────────────
class _ActionBtn extends StatelessWidget {
  final String label;
  final Color color;
  final Color bg;
  final bool outlined;
  final VoidCallback onTap;
  const _ActionBtn(this.label, this.color, this.bg, this.outlined, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: outlined ? Colors.transparent : bg,
          borderRadius: BorderRadius.circular(20),
          border: outlined ? Border.all(color: color) : null,
        ),
        child: Text(label,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: color)),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final Color color;
  final Color bg;
  final IconData icon;
  const _StatusChip(this.label, this.color, this.bg, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 11),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: color)),
        ],
      ),
    );
  }
}
