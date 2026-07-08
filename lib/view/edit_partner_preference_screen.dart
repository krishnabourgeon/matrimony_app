// ═══════════════════════════════════════════════════════════════
//  EDIT PARTNER PREFERENCE — tabbed Basic / Religious / Location /
//  Education & Professional / Horoscope preference form
// ═══════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

class EditPartnerPreferenceScreen extends StatefulWidget {
  const EditPartnerPreferenceScreen({super.key});

  @override
  State<EditPartnerPreferenceScreen> createState() =>
      _EditPartnerPreferenceScreenState();
}

class _EditPartnerPreferenceScreenState
    extends State<EditPartnerPreferenceScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  // ── Basic Preferences ──
  String? _ageFrom, _ageTo;
  String? _heightFrom, _heightTo;
  String? _weightFrom, _weightTo;
  String? _maritalStatus;
  String? _disabilityStatus = 'No';
  String? _surgeryPref;
  String? _familyStatus;
  String? _bodyType;
  String? _skinTone;
  String? _familyType;
  String? _foodType;
  String? _drinking;
  String? _smoking;

  // ── Religious Details ──
  String? _religion;
  String? _caste;
  String? _gotra;

  // ── Location Details ──
  String? _country;
  String? _state;
  String? _city;

  // ── Education & Professional Details ──
  String? _qualification;
  String? _employmentType;
  String? _occupation;
  String? _salary;
  String? _languagesKnown;
  String? _familyProperty;

  // ── Horoscope Details ──
  String? _withHoroscope;
  String? _withStar;
  String? _withSudhaJathakam;
  String? _withDoshaJathakam;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> _range(int start, int end, {String suffix = ''}) =>
      List.generate(end - start + 1, (i) => '${start + i}$suffix');

  void _submit() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Partner preferences saved')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: const Text('Edit Partner Preference',
            style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w800)),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondary,
          indicatorColor: AppColors.primary,
          labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          tabs: const [
            Tab(text: 'Basic details'),
            Tab(text: 'Religious details'),
            Tab(text: 'Location details'),
            Tab(text: 'Education & Professional details'),
            Tab(text: 'Horoscope details'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBasicTab(),
          _buildReligiousTab(),
          _buildLocationTab(),
          _buildEducationTab(),
          _buildHoroscopeTab(),
        ],
      ),
    );
  }

  // ── Shared card + row helpers ──

  Widget _card({required String title, required List<Widget> rows}) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppColors.r20),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary)),
                const SizedBox(height: 12),
                const Divider(height: 1, color: AppColors.divider),
                ...rows,
              ],
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppColors.r32)),
              ),
              child: const Text('Submit',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, Widget control) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 130,
                child: Text(label,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary)),
              ),
              const SizedBox(width: 12),
              Expanded(child: control),
            ],
          ),
        ),
        const Divider(height: 1, color: AppColors.divider),
      ],
    );
  }

  Widget _dropdownBox(
      String? value, List<String> items, ValueChanged<String?> onChanged,
      {String hint = 'Select'}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          isDense: true,
          hint: Text(hint,
              style: const TextStyle(fontSize: 12, color: AppColors.textHint)),
          icon: const Icon(Icons.keyboard_arrow_down_rounded,
              size: 18, color: AppColors.textHint),
          style: const TextStyle(fontSize: 12, color: AppColors.textPrimary),
          items: items
              .map((v) => DropdownMenuItem(value: v, child: Text(v)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _rangeRow(String? from, String? to, List<String> items,
      ValueChanged<String?> onFrom, ValueChanged<String?> onTo) {
    return Row(
      children: [
        Expanded(child: _dropdownBox(from, items, onFrom)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text('to',
              style: TextStyle(fontSize: 12, color: AppColors.textHint)),
        ),
        Expanded(child: _dropdownBox(to, items, onTo)),
      ],
    );
  }

  Widget _yesNoRadio(String? value, ValueChanged<String?> onChanged) {
    return Row(children: [
      Radio<String>(
        value: 'Yes',
        groupValue: value,
        activeColor: AppColors.primary,
        onChanged: onChanged,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      const Text('Yes', style: TextStyle(fontSize: 13)),
      const SizedBox(width: 16),
      Radio<String>(
        value: 'No',
        groupValue: value,
        activeColor: AppColors.primary,
        onChanged: onChanged,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      const Text('No', style: TextStyle(fontSize: 13)),
    ]);
  }

  // ── Tabs ──

  Widget _buildBasicTab() {
    return _card(title: 'Basic Preferences', rows: [
      _row(
          'Age',
          _rangeRow(_ageFrom, _ageTo, _range(18, 70),
              (v) => setState(() => _ageFrom = v), (v) => setState(() => _ageTo = v))),
      _row(
          'Height',
          _rangeRow(
              _heightFrom,
              _heightTo,
              _range(131, 210, suffix: 'cm'),
              (v) => setState(() => _heightFrom = v),
              (v) => setState(() => _heightTo = v))),
      _row(
          'Weight',
          _rangeRow(
              _weightFrom,
              _weightTo,
              _range(35, 150, suffix: 'kg'),
              (v) => setState(() => _weightFrom = v),
              (v) => setState(() => _weightTo = v))),
      _row(
          'Marital Status',
          _dropdownBox(
              _maritalStatus,
              const [
                'Never Married',
                'Divorced',
                'Widow/er',
                'Awaiting Divorce',
                'Annulled'
              ],
              (v) => setState(() => _maritalStatus = v))),
      _row(
          'Disability Status',
          _dropdownBox(_disabilityStatus, const ['No', 'Yes'],
              (v) => setState(() => _disabilityStatus = v))),
      _row(
          'Are you preferring persons who have undergone major surgery or Organ transplantation',
          _yesNoRadio(_surgeryPref, (v) => setState(() => _surgeryPref = v))),
      _row(
          'Family Status',
          _dropdownBox(
              _familyStatus,
              const ['Upper Middle Class', 'Middle Class', 'Lower Middle Class'],
              (v) => setState(() => _familyStatus = v))),
      _row(
          'Body type',
          _dropdownBox(_bodyType, const ['Slim', 'Average', 'Athletic', 'Heavy'],
              (v) => setState(() => _bodyType = v))),
      _row(
          'Body skin tone',
          _dropdownBox(_skinTone, const ['Fair', 'Wheatish', 'Dusky', 'Dark'],
              (v) => setState(() => _skinTone = v))),
      _row(
          'Family type',
          _dropdownBox(_familyType, const ['Nuclear Family', 'Joint Family'],
              (v) => setState(() => _familyType = v))),
      _row(
          'Food type',
          _dropdownBox(
              _foodType,
              const ['Vegetarian', 'Non-Vegetarian', 'Vegan', 'Eggetarian'],
              (v) => setState(() => _foodType = v))),
      _row(
          'Drinking habits',
          _dropdownBox(_drinking, const ['Yes', 'No', "Don't Know"],
              (v) => setState(() => _drinking = v))),
      _row(
          'Smoking habits',
          _dropdownBox(_smoking, const ['Yes', 'No', "Don't Know"],
              (v) => setState(() => _smoking = v))),
    ]);
  }

  Widget _buildReligiousTab() {
    return _card(title: 'Religious Details', rows: [
      _row(
          'Religion',
          _dropdownBox(
              _religion,
              const ['Hindu', 'Muslim', 'Christian', 'Sikh', 'Jain', 'Buddhist'],
              (v) => setState(() => _religion = v))),
      _row(
          'Caste',
          _dropdownBox(_caste, const ['Nair', 'Thiyya', 'Ezhava', 'Sunni', 'Mujahid'],
              (v) => setState(() => _caste = v))),
      _row(
          'Gotra',
          _dropdownBox(_gotra, const ['Atreya', 'Gavishthira', 'Viswamithra'],
              (v) => setState(() => _gotra = v))),
    ]);
  }

  Widget _buildLocationTab() {
    return _card(title: 'Location Details', rows: [
      _row(
          'Country',
          _dropdownBox(_country, const ['India', 'USA', 'UK', 'UAE', 'Canada'],
              (v) => setState(() => _country = v))),
      _row(
          'State',
          _dropdownBox(
              _state, const ['Kerala', 'Gujarat', 'Tamil Nadu', 'Karnataka'],
              (v) => setState(() => _state = v))),
      _row(
          'City',
          _dropdownBox(
              _city,
              const ['Kozhikode', 'Palakkad', 'Surat', 'Malappuram'],
              (v) => setState(() => _city = v))),
    ]);
  }

  Widget _buildEducationTab() {
    return _card(title: 'Education & Professional Details', rows: [
      _row(
          'Qualification',
          _dropdownBox(
              _qualification,
              const ['Bachelors Degree', 'Masters Degree', 'Diploma', '10th', '12th'],
              (v) => setState(() => _qualification = v))),
      _row(
          'Employment type',
          _dropdownBox(
              _employmentType,
              const [
                'Healthcare',
                'Information Technology',
                'Farmer',
                'Defence',
                'Government/PSU',
                'Private Sector',
                'Business',
                'Others'
              ],
              (v) => setState(() => _employmentType = v))),
      _row(
          'Occupation',
          _dropdownBox(
              _occupation,
              const [
                'Doctor',
                'Software Developer',
                'Teacher',
                'Business',
                'Engineer',
                'Others'
              ],
              (v) => setState(() => _occupation = v))),
      _row(
          'Salary',
          _dropdownBox(
              _salary,
              const ['10L to 20L', '20L to 30L', '2L to 3L', '20K to 30K', '5K - 10K AED'],
              (v) => setState(() => _salary = v))),
      _row(
          'Languages known',
          _dropdownBox(
              _languagesKnown,
              const ['Malayalam', 'English', 'Hindi', 'Tamil', 'Telugu', 'Kannada'],
              (v) => setState(() => _languagesKnown = v))),
      _row(
          'Family property',
          _dropdownBox(
              _familyProperty,
              const ['10L to 20L', '20L to 30L', '2L to 3L', '20K to 30K', '5K - 10K AED'],
              (v) => setState(() => _familyProperty = v))),
    ]);
  }

  Widget _buildHoroscopeTab() {
    return _card(title: 'Horoscope Details', rows: [
      _row('Profile with horoscope',
          _yesNoRadio(_withHoroscope, (v) => setState(() => _withHoroscope = v))),
      _row('Profile with star',
          _yesNoRadio(_withStar, (v) => setState(() => _withStar = v))),
      _row(
          'Profile with sudha jathakam',
          _yesNoRadio(
              _withSudhaJathakam, (v) => setState(() => _withSudhaJathakam = v))),
      _row(
          'Profile with dosha jathakam',
          _yesNoRadio(
              _withDoshaJathakam, (v) => setState(() => _withDoshaJathakam = v))),
    ]);
  }
}
