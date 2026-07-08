import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

class PrivacySettingsScreen extends StatefulWidget {
  const PrivacySettingsScreen({super.key});

  @override
  State<PrivacySettingsScreen> createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  bool _hideName = false;
  bool _hideProfileImage = false;
  bool _hideHoroscope = true;
  bool _hideMobileNumber = true;
  bool _hideEmail = true;

  void _onSave() {
    // TODO: persist privacy preferences via API
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Privacy settings saved')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: _appBar(context, top)),
              SliverToBoxAdapter(child: _heroBanner()),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppColors.r20),
                    boxShadow: AppColors.shadowSm,
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    children: [
                      _PrivacyToggleRow(
                        icon: Icons.person_outline_rounded,
                        iconColor: AppColors.primary,
                        iconBg: AppColors.primaryLight,
                        title: 'Hide your name',
                        subtitle: 'Others will see "Member" instead of your name',
                        value: _hideName,
                        onChanged: (v) => setState(() => _hideName = v),
                      ),
                      const _RowDivider(),
                      _PrivacyToggleRow(
                        icon: Icons.image_outlined,
                        iconColor: AppColors.blue,
                        iconBg: AppColors.blueLight,
                        title: 'Hide your Profile Image',
                        subtitle: 'Your photo stays blurred until you approve',
                        value: _hideProfileImage,
                        onChanged: (v) => setState(() => _hideProfileImage = v),
                      ),
                      const _RowDivider(),
                      _PrivacyToggleRow(
                        icon: Icons.stars_rounded,
                        iconColor: AppColors.gold,
                        iconBg: AppColors.goldLight,
                        title: 'Hide your Horoscope',
                        subtitle: 'Birth details stay private to you',
                        value: _hideHoroscope,
                        onChanged: (v) => setState(() => _hideHoroscope = v),
                      ),
                      const _RowDivider(),
                      _PrivacyToggleRow(
                        icon: Icons.phone_iphone_rounded,
                        iconColor: AppColors.success,
                        iconBg: AppColors.successLight,
                        title: 'Hide your Mobile Number',
                        subtitle: 'Shared only with members you approve',
                        value: _hideMobileNumber,
                        onChanged: (v) => setState(() => _hideMobileNumber = v),
                      ),
                      const _RowDivider(),
                      _PrivacyToggleRow(
                        icon: Icons.email_outlined,
                        iconColor: AppColors.roseGold,
                        iconBg: AppColors.roseGoldLight,
                        title: 'Hide your E-mail Id',
                        subtitle: 'Shared only with members you approve',
                        value: _hideEmail,
                        onChanged: (v) => setState(() => _hideEmail = v),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 110)),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _saveBar(context),
          ),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context, double top) => Container(
    color: AppColors.surface,
    padding: EdgeInsets.fromLTRB(16, top + 14, 16, 14),
    child: Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.arrow_back_ios_new_rounded, size: 16, color: AppColors.textSecondary),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Privacy Settings',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: AppColors.textPrimary, letterSpacing: -0.3),
        ),
      ],
    ),
  );

  Widget _heroBanner() => Container(
    margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
    padding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
    decoration: BoxDecoration(
      gradient: AppColors.gradHero,
      borderRadius: BorderRadius.circular(AppColors.r24),
      boxShadow: AppColors.shadowPrimary,
    ),
    child: Stack(
      children: [
        Positioned(
          top: -20,
          right: -20,
          child: Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.06)),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: const Icon(Icons.lock_outline_rounded, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Privacy Settings",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -0.3),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Protect your Name, Photo, Horoscope, Mobile Number & Email — visible only to members you prefer.",
                    style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.85), height: 1.4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _saveBar(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(16, 12, 16, MediaQuery.of(context).padding.bottom + 12),
    decoration: BoxDecoration(
      color: AppColors.surface,
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, -4)),
      ],
    ),
    child: GestureDetector(
      onTap: _onSave,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          gradient: AppColors.gradPrimary,
          borderRadius: BorderRadius.circular(AppColors.r16),
          boxShadow: AppColors.shadowPrimary,
        ),
        child: const Center(
          child: Text(
            'Save',
            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800, letterSpacing: 0.2),
          ),
        ),
      ),
    ),
  );
}

/// A single icon-badged privacy option with title, subtitle, and a switch.
class _PrivacyToggleRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _PrivacyToggleRow({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppColors.r16),
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(11)),
              child: Icon(icon, color: iconColor, size: 19),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 11, color: AppColors.textHint, height: 1.3),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Switch.adaptive(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.white,
              activeTrackColor: AppColors.primary,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: AppColors.border,
              trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
            ),
          ],
        ),
      ),
    );
  }
}

/// Thin inset divider between privacy toggle rows.
class _RowDivider extends StatelessWidget {
  const _RowDivider();

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Divider(height: 1, color: AppColors.border.withOpacity(0.7)),
  );
}