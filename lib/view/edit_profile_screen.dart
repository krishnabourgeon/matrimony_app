// Bandhan 2026 — Premium Edit Profile Screen
import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, bool> _expanded = {
    'About Me': true, 'Family Details': false, 'Education & Career': false,
    'Lifestyle': false, 'Preferences': false, 'Partner Expectations': false,
  };

  // ── About Me ──
  final _ageCtrl = TextEditingController(text: '27');
  final _heightCtrl = TextEditingController(text: "5'5\"");
  final _motherTongueCtrl = TextEditingController(text: 'Malayalam');
  final _aboutCtrl = TextEditingController(
    text: 'A passionate software engineer who loves music, travel and good food. Looking for a life partner with similar values and a caring heart.',
  );
  String _maritalStatus = 'Never Married';

  // ── Family Details ──
  final _fatherCtrl = TextEditingController(text: 'Dr. Rajesh Menon · Retired');
  final _motherCtrl = TextEditingController(text: 'Suja Menon · Homemaker');
  final _siblingsCtrl = TextEditingController(text: '1 brother (married)');
  String _familyType = 'Nuclear Family';
  String _familyValues = 'Moderate / Traditional';
  String _familyStatus = 'Upper Middle Class';

  // ── Education & Career ──
  final _educationCtrl = TextEditingController(text: 'M.Tech — Computer Science');
  final _collegeCtrl = TextEditingController(text: 'IIT Madras');
  final _occupationCtrl = TextEditingController(text: 'Software Engineer');
  final _employerCtrl = TextEditingController(text: 'Infosys Limited');
  final _incomeCtrl = TextEditingController(text: '12–15 Lakhs');
  final _workLocationCtrl = TextEditingController(text: 'Bengaluru, Karnataka');

  // ── Lifestyle ──
  String _diet = 'Vegetarian';
  String _smoking = 'Non-Smoker';
  String _drinking = 'Non-Drinker';
  final _hobbiesCtrl = TextEditingController(text: 'Classical music, Trekking, Cooking, Reading');
  final _languagesCtrl = TextEditingController(text: 'Malayalam, Hindi, English, Tamil');

  // ── Preferences ──
  final _ageRangeCtrl = TextEditingController(text: '27–33 years');
  final _heightRangeCtrl = TextEditingController(text: '5\'7" – 6\'1"');
  String _religion = 'Hindu';
  final _communityCtrl = TextEditingController(text: 'Nair / Open to all Hindu');
  final _prefEducationCtrl = TextEditingController(text: 'Graduate & above');
  final _prefOccupationCtrl = TextEditingController(text: 'Any');
  final _prefLocationCtrl = TextEditingController(text: 'Kerala / Bengaluru preferred');

  // ── Partner Expectations ──
  final _expectationCtrl = TextEditingController(
    text: 'Looking for someone who is caring, family-oriented and respects cultural values. Must love travel and have a good sense of humour. Open to working couples.',
  );

  @override
  void dispose() {
    for (final c in [
      _ageCtrl, _heightCtrl, _motherTongueCtrl, _aboutCtrl,
      _fatherCtrl, _motherCtrl, _siblingsCtrl,
      _educationCtrl, _collegeCtrl, _occupationCtrl, _employerCtrl, _incomeCtrl, _workLocationCtrl,
      _hobbiesCtrl, _languagesCtrl,
      _ageRangeCtrl, _heightRangeCtrl, _communityCtrl, _prefEducationCtrl, _prefOccupationCtrl, _prefLocationCtrl,
      _expectationCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  void _save() {
    // TODO: submit updated profile fields via API
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: _buildCover(top)),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                  sliver: SliverList(delegate: SliverChildListDelegate([
                    _buildSection('About Me', Icons.person_outline_rounded, [
                      const _ReadOnlyRow('Profile ID', 'BN-482910'),
                      _FormField(label: 'Age', controller: _ageCtrl, keyboardType: TextInputType.number),
                      _FormField(label: 'Height', controller: _heightCtrl),
                      _FormDropdown(
                        label: 'Marital Status',
                        value: _maritalStatus,
                        options: const ['Never Married', 'Divorced', 'Widowed', 'Separated'],
                        onChanged: (v) => setState(() => _maritalStatus = v),
                      ),
                      _FormField(label: 'Mother Tongue', controller: _motherTongueCtrl),
                      _FormField(label: 'About', controller: _aboutCtrl, multiline: true),
                    ]),
                    _buildSection('Family Details', Icons.family_restroom_rounded, [
                      _FormField(label: 'Father', controller: _fatherCtrl),
                      _FormField(label: 'Mother', controller: _motherCtrl),
                      _FormField(label: 'Siblings', controller: _siblingsCtrl),
                      _FormDropdown(
                        label: 'Family Type',
                        value: _familyType,
                        options: const ['Nuclear Family', 'Joint Family'],
                        onChanged: (v) => setState(() => _familyType = v),
                      ),
                      _FormDropdown(
                        label: 'Family Values',
                        value: _familyValues,
                        options: const ['Traditional', 'Moderate / Traditional', 'Liberal'],
                        onChanged: (v) => setState(() => _familyValues = v),
                      ),
                      _FormDropdown(
                        label: 'Family Status',
                        value: _familyStatus,
                        options: const ['Middle Class', 'Upper Middle Class', 'Affluent'],
                        onChanged: (v) => setState(() => _familyStatus = v),
                      ),
                    ]),
                    _buildSection('Education & Career', Icons.school_outlined, [
                      _FormField(label: 'Education', controller: _educationCtrl),
                      _FormField(label: 'College', controller: _collegeCtrl),
                      _FormField(label: 'Occupation', controller: _occupationCtrl),
                      _FormField(label: 'Employer', controller: _employerCtrl),
                      _FormField(label: 'Annual Income', controller: _incomeCtrl),
                      _FormField(label: 'Work Location', controller: _workLocationCtrl),
                    ]),
                    _buildSection('Lifestyle', Icons.self_improvement_rounded, [
                      _FormDropdown(
                        label: 'Dietary Habits',
                        value: _diet,
                        options: const ['Vegetarian', 'Non-Vegetarian', 'Eggetarian', 'Vegan'],
                        onChanged: (v) => setState(() => _diet = v),
                      ),
                      _FormDropdown(
                        label: 'Smoking',
                        value: _smoking,
                        options: const ['Non-Smoker', 'Occasional Smoker', 'Regular Smoker'],
                        onChanged: (v) => setState(() => _smoking = v),
                      ),
                      _FormDropdown(
                        label: 'Drinking',
                        value: _drinking,
                        options: const ['Non-Drinker', 'Social Drinker', 'Regular Drinker'],
                        onChanged: (v) => setState(() => _drinking = v),
                      ),
                      _FormField(label: 'Hobbies', controller: _hobbiesCtrl),
                      _FormField(label: 'Languages', controller: _languagesCtrl),
                    ]),
                    _buildSection('Preferences', Icons.tune_rounded, [
                      _FormField(label: 'Age Range', controller: _ageRangeCtrl),
                      _FormField(label: 'Height Range', controller: _heightRangeCtrl),
                      _FormDropdown(
                        label: 'Religion',
                        value: _religion,
                        options: const ['Hindu', 'Muslim', 'Christian', 'Sikh', 'Jain', 'Any'],
                        onChanged: (v) => setState(() => _religion = v),
                      ),
                      _FormField(label: 'Community', controller: _communityCtrl),
                      _FormField(label: 'Education', controller: _prefEducationCtrl),
                      _FormField(label: 'Occupation', controller: _prefOccupationCtrl),
                      _FormField(label: 'Location', controller: _prefLocationCtrl),
                    ]),
                    _buildSection('Partner Expectations', Icons.favorite_border_rounded, [
                      _FormField(label: 'Expectation', controller: _expectationCtrl, multiline: true),
                    ]),
                  ])),
                ),
              ],
            ),
          ),
          Positioned(left: 0, right: 0, bottom: 0, child: _saveBar(context)),
        ],
      ),
    );
  }

  Widget _buildCover(double top) {
    return Stack(children: [
      Container(height: 190 + top, decoration: const BoxDecoration(gradient: AppColors.gradHero)),
      Positioned(
        bottom: 0, left: 0, right: 0,
        child: Container(
          height: 90,
          decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Color(0x80000000)]),
          ),
        ),
      ),
      Positioned(
        top: top + 10, left: 16, right: 16,
        child: Row(children: [
          _AppBarBtn(Icons.arrow_back_ios_new_rounded, () => Navigator.pop(context)),
          const Spacer(),
          const Text('Edit Profile', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: -0.2)),
          const Spacer(),
          const SizedBox(width: 36),
        ]),
      ),
      Positioned(
        bottom: 18, left: 0, right: 0,
        child: Center(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(gradient: AppColors.gradRoseGold, shape: BoxShape.circle, boxShadow: AppColors.shadowGold),
                child: ClipOval(
                  child: Container(
                    width: 92, height: 92, color: AppColors.primaryLight,
                    child: Image.asset(
                      'assets/image/arun.png', fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(color: AppColors.primaryLight, child: const Icon(Icons.person, color: AppColors.primary, size: 38)),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0, bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Choose a new profile photo')),
                    );
                  },
                  child: Container(
                    width: 30, height: 30,
                    decoration: BoxDecoration(
                      gradient: AppColors.gradPrimary,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget _saveBar(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(16, 12, 16, MediaQuery.of(context).padding.bottom + 12),
    decoration: BoxDecoration(
      color: AppColors.surface,
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, -4))],
    ),
    child: Row(children: [
      Expanded(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(AppColors.r16)),
            child: const Center(child: Text('Cancel', style: TextStyle(color: AppColors.textSecondary, fontSize: 14, fontWeight: FontWeight.w700))),
          ),
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        flex: 2,
        child: GestureDetector(
          onTap: _save,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(AppColors.r16), boxShadow: AppColors.shadowPrimary),
            child: const Center(child: Text('Save Changes', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800, letterSpacing: 0.2))),
          ),
        ),
      ),
    ]),
  );

  Widget _buildSection(String title, IconData icon, List<Widget> fields) {
    final open = _expanded[title] ?? false;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppColors.r16), boxShadow: AppColors.shadowSm),
      child: Column(children: [
        GestureDetector(
          onTap: () => setState(() => _expanded[title] = !open),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              Container(
                width: 36, height: 36,
                decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(AppColors.r10)),
                child: Icon(icon, size: 18, color: AppColors.primary),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.textPrimary))),
              Icon(open ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded, color: AppColors.textHint, size: 22),
            ]),
          ),
        ),
        if (open) ...[
          const Divider(height: 1, color: AppColors.border, indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(children: fields),
          ),
        ],
      ]),
    );
  }
}

/// Non-editable field (e.g. system-assigned Profile ID).
class _ReadOnlyRow extends StatelessWidget {
  final String label, value;
  const _ReadOnlyRow(this.label, this.value);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: Row(children: [
      Expanded(
        flex: 5,
        child: Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textHint, fontWeight: FontWeight.w500)),
      ),
      const SizedBox(width: 8),
      Expanded(
        flex: 6,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(10)),
          child: Text(value, style: const TextStyle(fontSize: 12.5, color: AppColors.textHint, fontWeight: FontWeight.w600)),
        ),
      ),
    ]),
  );
}

/// Labeled editable text field, styled to match the app's standard inputs.
class _FormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool multiline;
  final TextInputType? keyboardType;

  const _FormField({
    required this.label,
    required this.controller,
    this.multiline = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 11.5, color: AppColors.textHint, fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            minLines: multiline ? 3 : 1,
            maxLines: multiline ? 5 : 1,
            style: const TextStyle(fontSize: 13, color: AppColors.textPrimary, fontWeight: FontWeight.w600, height: 1.4),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.surfaceVariant,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppColors.r10), borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppColors.r10), borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppColors.r10),
                borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Labeled dropdown field for enumerated values (marital status, diet, etc).
class _FormDropdown extends StatelessWidget {
  final String label;
  final String value;
  final List<String> options;
  final ValueChanged<String> onChanged;

  const _FormDropdown({
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 11.5, color: AppColors.textHint, fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(AppColors.r10)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textHint),
                style: const TextStyle(fontSize: 13, color: AppColors.textPrimary, fontWeight: FontWeight.w600),
                dropdownColor: AppColors.surface,
                borderRadius: BorderRadius.circular(AppColors.r16),
                items: options.map((o) => DropdownMenuItem(value: o, child: Text(o))).toList(),
                onChanged: (v) {
                  if (v != null) onChanged(v);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _AppBarBtn(this.icon, this.onTap);
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 36, height: 36,
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white, size: 18),
    ),
  );
}