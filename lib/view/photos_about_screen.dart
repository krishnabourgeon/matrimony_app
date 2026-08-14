// ═══════════════════════════════════════════════════════════════
//  PHOTOS & ABOUT
// ═══════════════════════════════════════════════════════════════

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:matrimony_app/model/image_types_model.dart';
import 'package:matrimony_app/provider/register_provider.dart';
import 'package:matrimony_app/view/family_details_screen.dart';
import 'package:matrimony_app/view/hobbies_screen.dart';
import 'package:matrimony_app/view/main_screen.dart';

/// Brand colors used on this screen — mirrors the other onboarding screens' palette.
class _Palette {
  _Palette._();
  static const Color coral = Color(0xFFFF3356);
  static const Color ink = Color(0xFF1A1A1A);
  static const Color subtleWhite = Color(0xFFFFFFFF);

  static const Color fieldBg = Color(0xFFF5F5F7);
  static const Color hintText = Color(0xFF8A8A8E);
  static const Color trackBg = Color(0xFFECECEE);
  static const Color grey = Color(0xFFBDBDBD);
}

class PhotosAboutScreen extends StatefulWidget {
  const PhotosAboutScreen({super.key});

  @override
  State<PhotosAboutScreen> createState() => _PhotosAboutState();
}

class _PhotosAboutState extends State<PhotosAboutScreen> {
  static const List<String> _slotLabels = [
    'Close-Up',
    'Full-Length',
    'Traditional',
    'Candid',
    'Professional',
    'Casual',
    'Formal',
  ];

  // Slot 0 is the primary profile photo (unlabeled); slots 1-7 map to
  // _slotLabels (or to fetched ImageTypes when that list is available).
  final List<File?> _photos = List<File?>.filled(8, null);
  final _picker = ImagePicker();

  int _aboutCount = 0;
  final _aboutCtrl = TextEditingController();

  bool _isSubmitting = false;
  bool _isSubmittingProfile = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RegisterProvider>().getImageTypes();
    });
  }

  @override
  void dispose() {
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

  int _typeIdForSlot(int index) => _fetchedTypeForSlot(index)?.id ?? (index + 1);

  String? _labelForSlot(int index) {
    if (index == 0) return null;
    return _fetchedTypeForSlot(index)?.name ?? _slotLabels[index - 1];
  }

  // Photos and the about text are both optional — whatever's picked gets
  // uploaded, unset slots are simply skipped.
  Future<bool> _uploadPhotos() {
    final provider = context.read<RegisterProvider>();
    final Map<String, String> fields = {'about': _aboutCtrl.text.trim()};
    final Map<String, File> files = {};
    int uploadIndex = 0;
    for (int i = 0; i < _photos.length; i++) {
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
        _showSnack(provider.photosError ?? 'Something went wrong. Please try again');
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
        _showSnack(provider.photosError ?? 'Something went wrong. Please try again');
      }
    });
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: GoogleFonts.tasaOrbiter(color: _Palette.subtleWhite)),
        backgroundColor: _Palette.ink,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _Palette.subtleWhite,
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
                        color: _Palette.ink,
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
                        color: _Palette.coral,
                      ),
                    ),
                    SizedBox(height: 14.h),

                    _buildPhotoGrid(),

                    SizedBox(height: 20.h),
                    _FieldLabel('About Me'),
                    SizedBox(height: 8.h),
                    _buildTextAreaField(
                      controller: _aboutCtrl,
                      hint: 'Describe yourself...',
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
                color: _Palette.fieldBg,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_back_rounded, color: _Palette.ink, size: 18.sp),
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: LinearProgressIndicator(
                value: 7 / 8,
                minHeight: 6.h,
                backgroundColor: _Palette.trackBg,
                valueColor: const AlwaysStoppedAnimation<Color>(_Palette.coral),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Photo grid: slot 0 = primary photo, slots 1-7 = labeled categories.
  // ---------------------------------------------------------------------
  Widget _buildPhotoGrid() {
    return Consumer<RegisterProvider>(
      builder: (context, provider, _) => GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _photos.length,
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
      ),
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
    return Container(
      decoration: BoxDecoration(
        color: _Palette.fieldBg,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: 4,
        maxLength: maxLength,
        onChanged: onChanged,
        style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.ink, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.hintText, fontWeight: FontWeight.w400),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
          counterText: '$count/$maxLength',
          counterStyle: GoogleFonts.tasaOrbiter(fontSize: 10.sp, color: _Palette.hintText),
        ),
      ),
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
                  // backgroundColor: _isFormValid ? _Palette.coral : _Palette.grey,
                  // disabledBackgroundColor:
                  //     (_isFormValid ? _Palette.coral : _Palette.grey).withOpacity(0.6),
                  // foregroundColor: _Palette.subtleWhite,
                  backgroundColor: _Palette.coral,
                  disabledBackgroundColor: _Palette.coral.withOpacity(0.6),
                  foregroundColor: _Palette.subtleWhite,
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
                            _Palette.subtleWhite,
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
                  foregroundColor: _Palette.coral,
                  disabledForegroundColor: _Palette.coral.withOpacity(0.6),
                  side: BorderSide(color: _Palette.coral, width: 1.4),
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
                            _Palette.coral,
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
        color: _Palette.ink,
      ),
    );
  }
}

/// A single photo tile: dashed border + "+" and an optional label when
/// empty, or the picked image with a coral highlight border once filled.
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
              color: _Palette.subtleWhite,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: filled ? _Palette.coral : _Palette.trackBg,
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
                        Icon(Icons.add, color: _Palette.hintText, size: 18.sp),
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
                                color: _Palette.hintText,
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
                    color: _Palette.ink,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, size: 12.sp, color: _Palette.subtleWhite),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
