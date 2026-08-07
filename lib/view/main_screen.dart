// ─── Main Shell — Floating Bottom Navigation ──────────────────────────────────
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matrimony_app/view/chat_screen.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/dashboard_screen.dart';
import 'package:matrimony_app/view/manage_request_screen.dart';
import 'package:matrimony_app/view/matches_screen.dart';
import 'package:matrimony_app/view/message_list_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    DashboardScreen(),
    MatchesScreen(),
    ManageRequestScreen(),
    ChatListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: IndexedStack(index: _currentIndex, children: _pages),
        bottomNavigationBar: _FloatingBottomNav(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
        ),
      ),
    );
  }
}

// ─── Flat Bottom Navigation — Home / Matches / Inbox / Chat ──────────────────

class _FloatingBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const _FloatingBottomNav({required this.currentIndex, required this.onTap});

  static const _items = [
    _NavItem(label: 'Home', icon: Icons.home_rounded),
    _NavItem(label: 'Matches', asset: 'assets/image/heart_check.png'),
    _NavItem(label: 'Inbox', asset: 'assets/image/supervisor_account.png'),
    _NavItem(label: 'Chat', asset: 'assets/image/supervisor_account (1).png'),
  ];

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.divider)),
      ),
      padding: EdgeInsets.fromLTRB(8, 10, 8, bottom + 10),
      child: Row(
        children: List.generate(_items.length, (i) {
          final item = _items[i];
          final selected = i == currentIndex;
          final color = selected ? AppColors.coral : AppColors.textHint;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(i),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  item.asset != null
                      ? _NavIcon(item.asset!, color: color)
                      : Icon(item.icon, color: color, size: 23),
                  const SizedBox(height: 4),
                  Text(item.label,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                        color: color,
                      )),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ── Tints a flat icon asset (heart_check.png etc.) to the given color via its alpha mask ──
class _NavIcon extends StatelessWidget {
  final String asset;
  final Color color;
  const _NavIcon(this.asset, {required this.color});
  @override
  Widget build(BuildContext context) => ColorFiltered(
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        child: Image.asset(asset, width: 23, height: 23, fit: BoxFit.contain),
      );
}

class _NavItem {
  final String label;
  final IconData? icon;
  final String? asset;
  const _NavItem({required this.label, this.icon, this.asset});
}
