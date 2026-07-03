// ═══════════════════════════════════════════════════════════════
//  APP DRAWER — subscription status + profile management menu
// ═══════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/login_screen.dart';
import 'package:matrimony_app/view/subscription_plan_screen.dart';

class AppDrawer extends StatelessWidget {
  /// Pass the active plan name (e.g. 'Premium') if the user has a paid
  /// subscription. Leave null to show the "No active subscription" state.
  final String? activePlan;
  const AppDrawer({super.key, this.activePlan});

  static const _menuItems = [
    _DrawerMenuItem('Edit Profile', Icons.edit_outlined),
    _DrawerMenuItem('Manage photos', Icons.photo_library_outlined),
    _DrawerMenuItem('Add trust badge', Icons.shield_outlined),
    _DrawerMenuItem('Edit partner preference', Icons.favorite_border_rounded),
    _DrawerMenuItem('Verify your profile', Icons.fact_check_outlined),
    _DrawerMenuItem('Manage request', Icons.tune_rounded),
    _DrawerMenuItem('Manage interest', Icons.tune_rounded),
    _DrawerMenuItem('Message', Icons.chat_bubble_outline_rounded),
    _DrawerMenuItem('Privacy Settings', Icons.tune_rounded),
    _DrawerMenuItem('View subscriptions', Icons.thumb_up_outlined),
    _DrawerMenuItem('Safe matrimony', Icons.favorite_border_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    final hasActivePlan = activePlan != null && activePlan!.isNotEmpty;
    return Drawer(
      backgroundColor: Colors.transparent,
      width: MediaQuery.of(context).size.width * 0.78,
      child: Container(
        decoration: const BoxDecoration(gradient: AppColors.gradPrimary),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 10),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(AppColors.r32),
                      ),
                      child: Text(
                        hasActivePlan ? '$activePlan Member' : 'No active subscription.',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.kDarkSlate,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SubscriptionPlanScreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppColors.r32),
                          border: Border.all(color: AppColors.gold, width: 1.2),
                        ),
                        child: Text(
                          hasActivePlan ? 'Manage Subscription' : 'Subscribe Now',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  itemCount: _menuItems.length,
                  itemBuilder: (ctx, i) {
                    final item = _menuItems[i];
                    return _DrawerTile(
                      item: item,
                      onTap: () {
                        Navigator.pop(context);
                        // TODO: route to the relevant screen for `item.label`.
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 8, 18, 18),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(AppColors.r32),
                      border: Border.all(color: Colors.white.withOpacity(0.6)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout_rounded, color: Colors.white, size: 16),
                        SizedBox(width: 8),
                        Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerMenuItem {
  final String label;
  final IconData icon;
  const _DrawerMenuItem(this.label, this.icon);
}

class _DrawerTile extends StatelessWidget {
  final _DrawerMenuItem item;
  final VoidCallback onTap;
  const _DrawerTile({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 11),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(item.icon, color: Colors.white, size: 19),
          ],
        ),
      ),
    );
  }
}
