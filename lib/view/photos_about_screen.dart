// ═══════════════════════════════════════════════════════════════
//  PHOTOS & ABOUT
// ═══════════════════════════════════════════════════════════════

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:provider/provider.dart';
import 'package:matrimony_app/model/image_types_model.dart';
import 'package:matrimony_app/provider/register_provider.dart';
import 'package:matrimony_app/view/family_details_screen.dart';
import 'package:matrimony_app/view/main_screen.dart';

class PhotosAboutScreen extends StatefulWidget {
  const PhotosAboutScreen({super.key});

  @override
  State<PhotosAboutScreen> createState() => _PhotosAboutState();
}

class _PhotosAboutState extends State<PhotosAboutScreen> {
  // Fallback labels (ids 1..8) used only if the image-types API fails.
  static const List<String> _slotLabels = [
    'Medium',
    'Close-Up',
    'Full-Length',
    'Traditional',
    'Candid',
    'Professional',
    'Casual',
    'Formal',
  ];

  // One slot per image type from the API (fallback: _slotLabels). Slot 0 is
  // also the main profile photo. Growable so it can match however many
  // types the API returns.
  List<File?> _photos = List<File?>.filled(_slotLabels.length, null);

  int get _slotCount {
    final types = context.read<RegisterProvider>().imageTypesModel?.imageTypes;
    return (types != null && types.isNotEmpty)
        ? types.length
        : _slotLabels.length;
  }

  // Replaces the list with a longer copy (keeps picked photos), so it works
  // whether or not the current list is growable.
  void _ensureSlots(int count) {
    if (_photos.length >= count) return;
    _photos = [..._photos, ...List<File?>.filled(count - _photos.length, null)];
  }

  final _picker = ImagePicker();

  int _aboutCount = 0;
  final _aboutCtrl = TextEditingController();

  bool _isSubmitting = false;
  bool _isSubmittingProfile = false;

  static const _draftKey = 'photos_about';
  late final RegisterProvider _registerProvider;

  void _saveDraft() {
    _registerProvider.registrationDrafts[_draftKey] = {
      'photos': List<File?>.of(_photos),
      'about': _aboutCtrl.text,
    };
  }

  void _restoreDraft() {
    final d = _registerProvider.registrationDrafts[_draftKey];
    if (d == null) return;
    final photos = d['photos'] as List<File?>? ?? const [];
    _ensureSlots(photos.length);
    for (var i = 0; i < photos.length; i++) {
      _photos[i] = photos[i];
    }
    _aboutCtrl.text = d['about'] as String? ?? '';
    _aboutCount = _aboutCtrl.text.length;
  }

  @override
  void initState() {
    super.initState();
    _registerProvider = context.read<RegisterProvider>();
    _restoreDraft();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RegisterProvider>().getImageTypes();
    });
  }

  @override
  void dispose() {
    _saveDraft();
    _aboutCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto(int index) async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    setState(() => _photos[index] = File(picked.path));
  }

  void _removePhoto(int index) {
    setState(() => _photos[index] = null);
  }

  // Uses the fetched image-type catalog for slot->type_id/name when
  // available, falling back to the hardcoded labels if that endpoint isn't
  // reachable (sequential ids 1..8, slot 0 = "Profile Photo").
  ImageType? _fetchedTypeForSlot(int index) {
    final types = context.read<RegisterProvider>().imageTypesModel?.imageTypes;
    if (types != null && index < types.length) return types[index];
    return null;
  }

  int _typeIdForSlot(int index) =>
      _fetchedTypeForSlot(index)?.id ?? (index + 1);

  String? _labelForSlot(int index) {
    return _fetchedTypeForSlot(index)?.name ??
        (index < _slotLabels.length ? _slotLabels[index] : null);
  }

  // Photos and the about text are both optional — whatever's picked gets
  // uploaded, unset slots are simply skipped.
  Future<bool> _uploadPhotos() {
    final provider = context.read<RegisterProvider>();
    final Map<String, String> fields = {'about': _aboutCtrl.text.trim()};
    final Map<String, File> files = {};
    int uploadIndex = 0;
    for (int i = 0; i < _photos.length && i < _slotCount; i++) {
      final file = _photos[i];
      if (file == null) continue;
      fields['images[$uploadIndex][type_id]'] = '${_typeIdForSlot(i)}';
      fields['images[$uploadIndex][is_main_image]'] = i == 0 ? '1' : '0';
      files['images[$uploadIndex][image]'] = file;
      uploadIndex++;
    }
    return provider.uploadPhotos(fields: fields, files: files);
  }

  void _handleContinue() {
    FocusScope.of(context).unfocus();

    setState(() => _isSubmitting = true);
    final provider = context.read<RegisterProvider>();
    _uploadPhotos().then((success) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      if (success) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => FamilyDetailsScreen()),
        );
      } else {
        _showSnack(
          provider.photosError ?? 'Something went wrong. Please try again',
        );
      }
    });
  }

  // Submits the profile now with whatever's filled so far, skipping the
  // remaining onboarding steps, straight to the app's main screen.
  void _handleSubmit() {
    FocusScope.of(context).unfocus();

    setState(() => _isSubmittingProfile = true);
    final provider = context.read<RegisterProvider>();
    _uploadPhotos().then((success) {
      if (!mounted) return;
      setState(() => _isSubmittingProfile = false);
      if (success) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const MainShell()),
          (route) => false,
        );
      } else {
        _showSnack(
          provider.photosError ?? 'Something went wrong. Please try again',
        );
      }
    });
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.tasaOrbiter(color: AppColors.subtleWhite),
        ),
        backgroundColor: AppColors.ink,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.subtleWhite,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 35.h),
                    Text(
                      'Photos & About',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.ink,
                        letterSpacing: -0.6,
                        height: 1.25,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    _FieldLabel('Upload Photos'),
                    SizedBox(height: 4.h),
                    Text(
                      'Medium close-up photographs are preferred as profile image',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 14.h),

                    _buildPhotoGrid(),

                    SizedBox(height: 20.h),
                    _FieldLabel('About Me'),
                    SizedBox(height: 8.h),
                    _buildTextAreaField(
                      controller: _aboutCtrl,
                      hint:
                          'I am a simple and family-oriented individual with a positive outlook on life.Enjoy music, travel, and spending time with close ones. Looking for a genuine and understanding life partner',
                      maxLength: 255,
                      count: _aboutCount,
                      onChanged: (v) => setState(() => _aboutCount = v.length),
                    ),

                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
            _buildBottomArea(),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Top bar: back button + progress track
  // ---------------------------------------------------------------------
  Widget _buildTopBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 36.w,
              height: 36.w,
              decoration: const BoxDecoration(
                color: AppColors.fieldBg,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                color: AppColors.ink,
                size: 18.sp,
              ),
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: LinearProgressIndicator(
                value: 7 / 8,
                minHeight: 6.h,
                backgroundColor: AppColors.trackBg,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Photo grid: one labeled slot per image type; slot 0 is the main photo.
  // ---------------------------------------------------------------------
  Widget _buildPhotoGrid() {
    return Consumer<RegisterProvider>(
      builder: (context, provider, _) {
        final slotCount = _slotCount;
        _ensureSlots(slotCount);
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: slotCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10.w,
            crossAxisSpacing: 10.w,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final label = _labelForSlot(index);
            return _PhotoSlot(
              file: _photos[index],
              label: label,
              onTap: () => _pickPhoto(index),
              onRemove: () => _removePhoto(index),
            );
          },
        );
      },
    );
  }

  // ---------------------------------------------------------------------
  // Text area field with character counter
  // ---------------------------------------------------------------------
  Widget _buildTextAreaField({
    required TextEditingController controller,
    required String hint,
    required int maxLength,
    required int count,
    required ValueChanged<String> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.fieldBg,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: TextFormField(
            controller: controller,
            maxLines: 4,
            maxLength: maxLength,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            // Letters, spaces, line breaks, '.' and ',' only - no numbers or symbols.
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z .,\n]')),
            ],
            onChanged: onChanged,
            style: GoogleFonts.tasaOrbiter(
              fontSize: 13.sp,
              color: AppColors.ink,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.tasaOrbiter(
                fontSize: 13.sp,
                color: AppColors.hintText,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 18.w,
                vertical: 10.h,
              ),
              // Counter is shown below the field instead.
              counterText: '',
            ),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          '$count/$maxLength',
          style: GoogleFonts.tasaOrbiter(
            fontSize: 11.sp,
            color: AppColors.hintText,
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------
  // Bottom area: Continue (filled) + Submit (outlined)
  // ---------------------------------------------------------------------
  Widget _buildBottomArea() {
    final bool busy = _isSubmitting || _isSubmittingProfile;
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 20.h),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40.h,
              child: ElevatedButton(
                onPressed: busy ? null : _handleContinue,
                style: ElevatedButton.styleFrom(
                  // backgroundColor: _isFormValid ? AppColors.primary : AppColors.grey,
                  // disabledBackgroundColor:
                  //     (_isFormValid ? AppColors.primary : AppColors.grey).withOpacity(0.6),
                  // foregroundColor: AppColors.subtleWhite,
                  backgroundColor: AppColors.primary,
                  disabledBackgroundColor: AppColors.primary.withOpacity(0.6),
                  foregroundColor: AppColors.subtleWhite,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                ),
                child: _isSubmitting
                    ? SizedBox(
                        width: 22.w,
                        height: 22.w,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2.4,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.subtleWhite,
                          ),
                        ),
                      )
                    : Text(
                        'Continue',
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.1,
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: SizedBox(
              height: 40.h,
              child: OutlinedButton(
                onPressed: busy ? null : _handleSubmit,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  disabledForegroundColor: AppColors.primary.withOpacity(0.6),
                  side: BorderSide(color: AppColors.primary, width: 1.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                ),
                child: _isSubmittingProfile
                    ? SizedBox(
                        width: 22.w,
                        height: 22.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.4,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.primary,
                          ),
                        ),
                      )
                    : Text(
                        'Submit',
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.1,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Small reusable field label used above every input on this screen.
class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.tasaOrbiter(
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.ink,
      ),
    );
  }
}

/// A single photo tile: dashed border + "+" and an optional label when
/// empty, or the picked image with a primary highlight border once filled.
class _PhotoSlot extends StatelessWidget {
  const _PhotoSlot({
    required this.file,
    required this.label,
    required this.onTap,
    required this.onRemove,
  });

  final File? file;
  final String? label;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final bool filled = file != null;

    return GestureDetector(
      onTap: filled ? null : onTap,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.subtleWhite,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: filled ? AppColors.primary : AppColors.trackBg,
                width: filled ? 1.6 : 1,
              ),
              image: filled
                  ? DecorationImage(image: FileImage(file!), fit: BoxFit.cover)
                  : null,
            ),
            child: filled
                ? null
                : Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, color: AppColors.hintText, size: 18.sp),
                        if (label != null) ...[
                          SizedBox(height: 4.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              label!,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.tasaOrbiter(
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.hintText,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
          ),
          if (filled)
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: onRemove,
                child: Container(
                  padding: EdgeInsets.all(2.r),
                  decoration: const BoxDecoration(
                    color: AppColors.ink,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    size: 12.sp,
                    color: AppColors.subtleWhite,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
