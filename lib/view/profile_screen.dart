// Bandhan 2026 — Premium Profile Screen
import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});
  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final double _completion = 0.78;
  final Map<String, bool> _expanded = {
    'About Me': true, 'Family Details': false, 'Education & Career': false,
    'Lifestyle': false, 'Preferences': false, 'Partner Expectations': false,
  };

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(child: _buildCover(top)),
        SliverToBoxAdapter(child: _buildCompletionBanner()),
        SliverToBoxAdapter(child: _buildStatsRow()),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 120),
          sliver: SliverList(delegate: SliverChildListDelegate([
            _buildSection('About Me', Icons.person_outline_rounded, [
              _InfoRow('Profile ID', 'BN-482910'),
              _InfoRow('Age', '27 years'),
              _InfoRow('Height', '5\'5"'),
              _InfoRow('Marital Status', 'Never Married'),
              _InfoRow('Mother Tongue', 'Malayalam'),
              _InfoRow('About', 'A passionate software engineer who loves music, travel and good food. Looking for a life partner with similar values and a caring heart.', multiline: true),
            ]),
            _buildSection('Family Details', Icons.family_restroom_rounded, [
              _InfoRow('Father', 'Dr. Rajesh Menon · Retired'),
              _InfoRow('Mother', 'Suja Menon · Homemaker'),
              _InfoRow('Siblings', '1 brother (married)'),
              _InfoRow('Family Type', 'Nuclear Family'),
              _InfoRow('Family Values', 'Moderate / Traditional'),
              _InfoRow('Family Status', 'Upper Middle Class'),
            ]),
            _buildSection('Education & Career', Icons.school_outlined, [
              _InfoRow('Education', 'M.Tech — Computer Science'),
              _InfoRow('College', 'IIT Madras'),
              _InfoRow('Occupation', 'Software Engineer'),
              _InfoRow('Employer', 'Infosys Limited'),
              _InfoRow('Annual Income', '12–15 Lakhs'),
              _InfoRow('Work Location', 'Bengaluru, Karnataka'),
            ]),
            _buildSection('Lifestyle', Icons.self_improvement_rounded, [
              _InfoRow('Dietary Habits', 'Vegetarian'),
              _InfoRow('Smoking', 'Non-Smoker'),
              _InfoRow('Drinking', 'Non-Drinker'),
              _InfoRow('Hobbies', 'Classical music, Trekking, Cooking, Reading'),
              _InfoRow('Languages', 'Malayalam, Hindi, English, Tamil'),
            ]),
            _buildSection('Preferences', Icons.tune_rounded, [
              _InfoRow('Age Range', '27–33 years'),
              _InfoRow('Height Range', '5\'7" – 6\'1"'),
              _InfoRow('Religion', 'Hindu'),
              _InfoRow('Community', 'Nair / Open to all Hindu'),
              _InfoRow('Education', 'Graduate & above'),
              _InfoRow('Occupation', 'Any'),
              _InfoRow('Location', 'Kerala / Bengaluru preferred'),
            ]),
            _buildSection('Partner Expectations', Icons.favorite_border_rounded, [
              _InfoRow('Expectation', 'Looking for someone who is caring, family-oriented and respects cultural values. Must love travel and have a good sense of humour. Open to working couples.', multiline: true),
            ]),
          ])),
        ),
      ]),
    );
  }

  Widget _buildCover(double top) {
    return Stack(children: [
      // Cover gradient
      Container(height: 220 + top, decoration: BoxDecoration(gradient: AppColors.gradHero)),
      // Back gradient overlay
      Positioned(bottom: 0, left: 0, right: 0, child: Container(height: 100,
        decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Color(0x80000000)])))),
      // App bar
      Positioned(top: top + 10, left: 16, right: 16, child: Row(children: [
        const Spacer(),
        _AppBarBtn(Icons.share_rounded, () {}),
        const SizedBox(width: 10),
        _AppBarBtn(Icons.edit_rounded, () {}),
        const SizedBox(width: 10),
        _AppBarBtn(Icons.settings_rounded, () {}),
      ])),
      // Avatar + info
      Positioned(bottom: 0, left: 20, right: 20, child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        // Avatar ring
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(gradient: AppColors.gradRoseGold, shape: BoxShape.circle, boxShadow: AppColors.shadowGold),
          child: ClipOval(child: Container(width: 90, height: 90, color: AppColors.primaryLight,
            child: Image.asset('assets/image/arun.png', fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(color: AppColors.primaryLight, child: const Icon(Icons.person, color: AppColors.primary, size: 36))))),
        ),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
          const Text('Arun Menon', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: -0.5)),
          const Text('27 yrs · 5\'5" · Bengaluru', style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 12)),
          const SizedBox(height: 8),
          Row(children: [
            _PBadge('Verified', AppColors.blue, Icons.verified_rounded),
            const SizedBox(width: 6),
            _PBadge('Premium', AppColors.gold, Icons.workspace_premium_rounded),
          ]),
          const SizedBox(height: 14),
        ])),
      ])),
    ]);
  }

  Widget _buildCompletionBanner() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFFFFF5EC), Color(0xFFFFF8F0)]),
        borderRadius: BorderRadius.circular(AppColors.r16),
        border: Border.all(color: AppColors.roseGold.withOpacity(0.4)),
      ),
      child: Row(children: [
        Stack(alignment: Alignment.center, children: [
          SizedBox(width: 52, height: 52, child: CircularProgressIndicator(
            value: _completion, strokeWidth: 5,
            backgroundColor: AppColors.border,
            valueColor: const AlwaysStoppedAnimation(AppColors.roseGold),
          )),
          Text('${(_completion * 100).round()}%', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: AppColors.primary)),
        ]),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Profile Completion', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
          const SizedBox(height: 4),
          const Text('Add hobbies & photos to get 3x more views!', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
        ])),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(AppColors.r32)),
          child: const Text('Complete', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800)),
        ),
      ]),
    );
  }

  Widget _buildStatsRow() {
    final stats = [
      ('Profile Views', '248', Icons.visibility_outlined, AppColors.blue),
      ('Interests', '18', Icons.favorite_outline_rounded, AppColors.primary),
      ('Shortlisted', '34', Icons.bookmark_border_rounded, AppColors.gold),
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Row(children: stats.map((s) => Expanded(
        child: Container(
          margin: EdgeInsets.only(right: s == stats.last ? 0 : 10),
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppColors.r16), boxShadow: AppColors.shadowSm),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(s.$3, size: 20, color: s.$4),
            const SizedBox(height: 6),
            Text(s.$2, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: s.$4)),
            const SizedBox(height: 2),
            Text(s.$1, style: const TextStyle(fontSize: 9, color: AppColors.textHint, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
          ]),
        ),
      )).toList()),
    );
  }

  Widget _buildSection(String title, IconData icon, List<Widget> rows) {
    final open = _expanded[title] ?? false;
    return Container(
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppColors.r16), boxShadow: AppColors.shadowSm),
      child: Column(children: [
        GestureDetector(
          onTap: () => setState(() => _expanded[title] = !open),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              Container(width: 36, height: 36, decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(AppColors.r10)),
                child: Icon(icon, size: 18, color: AppColors.primary)),
              const SizedBox(width: 12),
              Expanded(child: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.textPrimary))),
              Icon(open ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded, color: AppColors.textHint, size: 22),
            ]),
          ),
        ),
        if (open) ...[
          const Divider(height: 1, color: AppColors.border, indent: 16, endIndent: 16),
          Padding(padding: const EdgeInsets.fromLTRB(16, 12, 16, 16), child: Column(children: rows)),
        ],
      ]),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label, value; final bool multiline;
  const _InfoRow(this.label, this.value, {this.multiline = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: multiline
        ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, style: const TextStyle(fontSize: 11, color: AppColors.textHint, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontSize: 13, color: AppColors.textPrimary, height: 1.5)),
          ])
        : Row(children: [
            SizedBox(width: 130, child: Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textHint, fontWeight: FontWeight.w500))),
            Expanded(child: Text(value, style: const TextStyle(fontSize: 12, color: AppColors.textPrimary, fontWeight: FontWeight.w600), maxLines: 2, overflow: TextOverflow.ellipsis)),
          ]),
    );
  }
}

class _PBadge extends StatelessWidget {
  final String label; final Color color; final IconData icon;
  const _PBadge(this.label, this.color, this.icon);
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
    child: Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(icon, color: Colors.white, size: 10), const SizedBox(width: 4),
      Text(label, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800)),
    ]),
  );
}

class _AppBarBtn extends StatelessWidget {
  final IconData icon; final VoidCallback onTap;
  const _AppBarBtn(this.icon, this.onTap);
  @override
  Widget build(BuildContext context) => GestureDetector(onTap: onTap, child: Container(
    width: 36, height: 36,
    decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
    child: Icon(icon, color: Colors.white, size: 18),
  ));
}