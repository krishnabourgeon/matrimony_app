// ═══════════════════════════════════════════════════════════════
//  MANAGE YOUR PHOTOS SCREEN
// ═══════════════════════════════════════════════════════════════

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:image_picker/image_picker.dart'; // uncomment once added to pubspec.yaml

class PhotoSlot {
  final String label;
  File? image;

  PhotoSlot({required this.label, this.image});
}

class ManagePhotosScreen extends StatefulWidget {
  final String userName;
  final File? profilePhoto;

  const ManagePhotosScreen({
    super.key,
    this.userName = 'PRIYESH',
    this.profilePhoto,
  });

  @override
  State<ManagePhotosScreen> createState() => _ManagePhotosScreenState();
}

class _ManagePhotosScreenState extends State<ManagePhotosScreen> {
  File? _profilePhoto;

  final List<PhotoSlot> _slots = [
    PhotoSlot(label: 'Close-Up'),
    PhotoSlot(label: 'Full-Length'),
    PhotoSlot(label: 'Traditional'),
    PhotoSlot(label: 'Candid'),
    PhotoSlot(label: 'Professional'),
    PhotoSlot(label: 'Casual'),
    PhotoSlot(label: 'Formal'),
  ];

  @override
  void initState() {
    super.initState();
    _profilePhoto = widget.profilePhoto;
  }

  // final _picker = ImagePicker();

  Future<void> _pickProfilePhoto() async {
    // final picked = await _picker.pickImage(source: ImageSource.gallery);
    // if (picked != null) setState(() => _profilePhoto = File(picked.path));
  }

  Future<void> _pickSlotPhoto(int index) async {
    // final picked = await _picker.pickImage(source: ImageSource.gallery);
    // if (picked != null) setState(() => _slots[index].image = File(picked.path));
  }

  void _removeSlotPhoto(int index) {
    setState(() => _slots[index].image = null);
  }

  void _saveChanges() {
    // TODO: upload _profilePhoto and _slots[i].image to your backend/API
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Photos saved')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Manage your Photos',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   'Manage your Photos',
              //   style: TextStyle(
              //     fontSize: 22,
              //     fontWeight: FontWeight.w800,
              //     color: AppColors.textPrimary,
              //   ),
              // ),
              //const SizedBox(height: 18),

              // ── Hero Card ──────────────────────────────────────
              _buildHeroCard(),
              const SizedBox(height: 22),

              // ── Photo Grid ─────────────────────────────────────
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  final crossAxisCount = width > 900
                      ? 6
                      : width > 700
                          ? 5
                          : width > 500
                              ? 4
                              : 3;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _slots.length + 1, // +1 for the profile preview tile
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      childAspectRatio: 0.78,
                    ),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return _buildProfilePreviewTile();
                      }
                      final slotIndex = index - 1;
                      return _buildSlotTile(slotIndex);
                    },
                  );
                },
              ),
              const SizedBox(height: 28),

              // ── Save Button ────────────────────────────────────
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: _saveChanges,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                    decoration: BoxDecoration(
                      gradient: AppColors.gradPrimary,
                      borderRadius: BorderRadius.circular(AppColors.r32),
                      boxShadow: AppColors.shadowPrimary,
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
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

  // ── Hero Card ────────────────────────────────────────────────

  Widget _buildHeroCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.gradHero,
        borderRadius: BorderRadius.circular(AppColors.r16),
        boxShadow: AppColors.shadowMd,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 480;

          final nameSection = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.userName,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textPrimary,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: _pickProfilePhoto,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppColors.r32),
                    boxShadow: AppColors.shadowSm,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.edit_outlined, size: 14, color: AppColors.primary),
                      SizedBox(width: 6),
                      Text(
                        'Change Profile Photo',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );

          final children = [
            // Phone mockup preview
            _buildPhoneMockup(),
            SizedBox(width: isNarrow ? 0 : 24, height: isNarrow ? 16 : 0),

            // Name + Change photo
            isNarrow ? nameSection : Expanded(child: nameSection),

            // Decorative illustration
            if (!isNarrow) ...[
              const SizedBox(width: 16),
              _buildIllustration(),
            ],
          ];

          return isNarrow
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: children)
              : Row(crossAxisAlignment: CrossAxisAlignment.center, children: children);
        },
      ),
    );
  }

  Widget _buildPhoneMockup() {
    return Container(
      width: 96,
      height: 130,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppColors.shadowMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 4,
            width: 40,
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(8),
              ),
              child: _profilePhoto != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(_profilePhoto!, fit: BoxFit.cover),
                    )
                  : const Icon(Icons.person, color: AppColors.primary, size: 28),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: List.generate(
              4,
              (i) => Expanded(
                child: Container(
                  height: 14,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIllustration() {
    return SizedBox(
      width: 140,
      height: 130,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 0,
            child: Icon(Icons.local_florist_rounded,
                color: Colors.white.withOpacity(0.5), size: 46),
          ),
          Positioned(
            left: 6,
            bottom: 10,
            child: Icon(Icons.hiking_rounded, color: Colors.white, size: 44),
          ),
          Positioned(
            right: 6,
            bottom: 20,
            child: Icon(Icons.woman_rounded, color: Colors.white, size: 50),
          ),
        ],
      ),
    );
  }

  // ── Grid Tiles ───────────────────────────────────────────────

  Widget _buildProfilePreviewTile() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppColors.r16),
        border: Border.all(color: AppColors.primary, width: 2),
        boxShadow: AppColors.shadowSm,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(height: 4, color: AppColors.primaryLight),
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppColors.surfaceVariant,
              child: _profilePhoto != null
                  ? Image.file(_profilePhoto!, fit: BoxFit.cover)
                  : const Icon(Icons.dashboard_customize_rounded,
                      color: AppColors.primary, size: 26),
            ),
          ),
          Container(
            height: 22,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (i) => Container(
                  width: 14,
                  height: 14,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlotTile(int index) {
    final slot = _slots[index];
    final hasImage = slot.image != null;

    return GestureDetector(
      onTap: () => _pickSlotPhoto(index),
      child: DottedBorderBox(
        borderColor: hasImage ? Colors.transparent : AppColors.border,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (hasImage)
              ClipRRect(
                borderRadius: BorderRadius.circular(AppColors.r16),
                child: Image.file(slot.image!, fit: BoxFit.cover),
              )
            else
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add_rounded, color: AppColors.textHint, size: 28),
                  const SizedBox(height: 10),
                  Text(
                    slot.label,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            if (hasImage)
              Positioned(
                top: 6,
                right: 6,
                child: GestureDetector(
                  onTap: () => _removeSlotPhoto(index),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close_rounded, color: Colors.white, size: 14),
                  ),
                ),
              ),
            if (hasImage)
              Positioned(
                bottom: 6,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      slot.label,
                      style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ─── Dashed border container (no external package needed) ────────────────────

class DottedBorderBox extends StatelessWidget {
  final Widget child;
  final Color borderColor;

  const DottedBorderBox({
    super.key,
    required this.child,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(color: borderColor),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppColors.r16),
        ),
        child: child,
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final Color color;
  _DashedBorderPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (color == Colors.transparent) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.4
      ..style = PaintingStyle.stroke;

    const radius = 16.0;
    const dashWidth = 6.0;
    const dashSpace = 4.0;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0.7, 0.7, size.width - 1.4, size.height - 1.4),
      const Radius.circular(radius),
    );

    final path = Path()..addRRect(rrect);
    final metrics = path.computeMetrics();

    for (final metric in metrics) {
      double distance = 0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, next.clamp(0, metric.length)),
          paint,
        );
        distance = next + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) =>
      oldDelegate.color != color;
}