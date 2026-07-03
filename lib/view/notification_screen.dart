// Bandhan 2026 — Notification Screen
import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

enum _NType { interest, visitor, match, message, system, upgrade }

class _Notif {
  final _NType type; final String title, body, time; bool read;
  _Notif({required this.type, required this.title, required this.body, required this.time, this.read = false});
}

final _sampleNotifs = [
  _Notif(type: _NType.interest, title: 'New Interest Received!', body: 'Priya Menon, 27 has sent you an interest. Respond now!', time: '2 min ago'),
  _Notif(type: _NType.visitor, title: 'Profile Visited', body: 'Kavya Nair viewed your profile just now.', time: '10 min ago'),
  _Notif(type: _NType.match, title: 'New Match Found!', body: 'You have a 94% match with Deepa Krishnan, 26.', time: '1 hr ago'),
  _Notif(type: _NType.message, title: 'New Message', body: 'Anjali Sharma: "Hi, I came across your profile..."', time: '2 hr ago'),
  _Notif(type: _NType.upgrade, title: 'Upgrade to Premium', body: 'Connect with unlimited profiles. 50% OFF today only!', time: '3 hr ago'),
  _Notif(type: _NType.interest, title: 'Interest Accepted!', body: 'Meera Pillai accepted your interest. Send a message!', time: '5 hr ago', read: true),
  _Notif(type: _NType.system, title: 'Profile Tips', body: 'Add your hobbies to get 40% more profile views.', time: 'Yesterday', read: true),
  _Notif(type: _NType.visitor, title: '3 New Visitors', body: 'Rekha, Lakshmi and 1 others viewed your profile.', time: 'Yesterday', read: true),
  _Notif(type: _NType.match, title: 'Daily Recommendations', body: 'Your 5 daily picks are ready. View them now!', time: '2 days ago', read: true),
];

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late List<_Notif> _notifs;
  @override
  void initState() { super.initState(); _notifs = List.from(_sampleNotifs); }

  int get _unread => _notifs.where((n) => !n.read).length;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(children: [
        _buildHeader(top),
        _buildSummary(),
        Expanded(child: _buildList()),
      ]),
    );
  }

  Widget _buildHeader(double top) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.gradHero),
      padding: EdgeInsets.fromLTRB(20, top + 18, 20, 20),
      child: Row(children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Notifications', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900, letterSpacing: -0.6)),
          const SizedBox(height: 4),
          Row(children: [
            Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFF4ADE80), shape: BoxShape.circle)),
            const SizedBox(width: 6),
            Text('$_unread new updates', style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ]),
        ])),
        GestureDetector(
          onTap: () => setState(() { for (final n in _notifs) { n.read = true; } }),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
            child: const Text('Mark all read', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
          ),
        ),
      ]),
    );
  }

  Widget _buildSummary() {
    final types = [
      ('Interests', _notifs.where((n) => n.type == _NType.interest).length, AppColors.primary, AppColors.primaryLight, Icons.favorite_rounded),
      ('Visitors', _notifs.where((n) => n.type == _NType.visitor).length, AppColors.blue, const Color(0xFFE3F0FF), Icons.visibility_rounded),
      ('Matches', _notifs.where((n) => n.type == _NType.match).length, AppColors.success, AppColors.successLight, Icons.people_rounded),
    ];
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      child: Row(children: types.map((t) => Expanded(
        child: Container(
          margin: EdgeInsets.only(right: t == types.last ? 0 : 10),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(color: t.$4, borderRadius: BorderRadius.circular(AppColors.r16)),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(t.$5, size: 20, color: t.$3),
            const SizedBox(height: 6),
            Text('${t.$2}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: t.$3)),
            Text(t.$1, style: TextStyle(fontSize: 10, color: t.$3.withOpacity(0.8), fontWeight: FontWeight.w600)),
          ]),
        ),
      )).toList()),
    );
  }

  Widget _buildList() => ListView.builder(
    padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
    physics: const BouncingScrollPhysics(),
    itemCount: _notifs.length,
    itemBuilder: (ctx, i) {
      final n = _notifs[i];
      return _NotifCard(notif: n, onTap: () => setState(() => n.read = true));
    },
  );
}

class _NotifCard extends StatelessWidget {
  final _Notif notif; final VoidCallback onTap;
  const _NotifCard({required this.notif, required this.onTap});

  (Color, Color, IconData) get _style => switch (notif.type) {
    _NType.interest => (AppColors.primary, AppColors.primaryLight, Icons.favorite_rounded),
    _NType.visitor  => (AppColors.blue, const Color(0xFFE3F0FF), Icons.visibility_rounded),
    _NType.match    => (AppColors.success, AppColors.successLight, Icons.people_rounded),
    _NType.message  => (AppColors.roseGold, AppColors.roseGoldLight, Icons.chat_bubble_outline_rounded),
    _NType.upgrade  => (AppColors.gold, const Color(0xFFFFF8E1), Icons.workspace_premium_rounded),
    _NType.system   => (AppColors.textHint, AppColors.surfaceVariant, Icons.info_outline_rounded),
  };

  @override
  Widget build(BuildContext context) {
    final (color, bg, icon) = _style;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: notif.read ? AppColors.surface : AppColors.primaryLight.withOpacity(0.5),
          borderRadius: BorderRadius.circular(AppColors.r16),
          border: notif.read ? Border.all(color: AppColors.border) : Border.all(color: AppColors.primary.withOpacity(0.2)),
          boxShadow: notif.read ? null : AppColors.shadowSm,
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(children: [
            Container(width: 44, height: 44, decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(AppColors.r12)),
              child: Icon(icon, color: color, size: 22)),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Expanded(child: Text(notif.title, style: TextStyle(fontSize: 13, fontWeight: notif.read ? FontWeight.w600 : FontWeight.w800, color: AppColors.textPrimary), maxLines: 1, overflow: TextOverflow.ellipsis)),
                if (!notif.read) Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
              ]),
              const SizedBox(height: 4),
              Text(notif.body, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, height: 1.4), maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 6),
              Text(notif.time, style: const TextStyle(fontSize: 11, color: AppColors.textHint)),
            ])),
          ]),
        ),
      ),
    );
  }
}