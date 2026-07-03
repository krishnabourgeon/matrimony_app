// ════════════════════════════════════════════════════════════════
//  STEP 6 — PHOTOS & ABOUT
// ════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
import 'package:matrimony_app/view/custom_widgets/progress_indicator.dart';
import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
import 'package:matrimony_app/view/custom_widgets/section_header.dart';
import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
import 'package:matrimony_app/view/hobbies_screen.dart';


class PhotosAboutScreen extends StatefulWidget {
  const PhotosAboutScreen({super.key});

  @override
  State<PhotosAboutScreen> createState() => _PhotosAboutState();
}

class _PhotosAboutState extends State<PhotosAboutScreen> {
  int _aboutCount = 0;
  // In production replace with real image picker + file list
  final List<bool> _uploaded = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return BlushScaffold(
      child: Column(
        children: [
          TopBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: StepBar(current: 6, total: 8),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeader(
                    tag: 'STEP 6 OF 8',
                    title: 'Photos & About Me',
                    subtitle:
                        'Medium close-up photographs are preferred as primary image',
                  ),
                  const SizedBox(height: 20),
                  FloatingCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // ── Upload section label ──
                        const Text('Upload Photos',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: AppColors.kDarkSlate)),
                        const SizedBox(height: 4),
                        const Text(
                            'Medium close-up photographs are preferable as primary image',
                            style: TextStyle(
                                fontSize: 11, color: AppColors.kTextMuted)),
                        const SizedBox(height: 14),

                        // ── Photo Grid ──
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.85,
                          ),
                          itemBuilder: (ctx, i) {
                            final filled = _uploaded[i];
                            return GestureDetector(
                              onTap: () =>
                                  setState(() => _uploaded[i] = !_uploaded[i]),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.kCardBg,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: filled
                                        ? AppColors.kAccent.withOpacity(0.5)
                                        : AppColors.kBorder,
                                    width: filled ? 2 : 1,
                                    style: filled
                                        ? BorderStyle.solid
                                        : BorderStyle.solid,
                                  ),
                                ),
                                child: filled
                                    ? Stack(children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          child: Container(
                                            color: AppColors.kAccent
                                                .withOpacity(0.15),
                                            child: const Center(
                                              child: Icon(Icons.person,
                                                  size: 40,
                                                  color: AppColors.kAccent),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 4,
                                          right: 4,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              color: AppColors.kAccent,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(Icons.close,
                                                size: 12,
                                                color: Colors.white),
                                          ),
                                        ),
                                        if (i == 0)
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 3),
                                              decoration: BoxDecoration(
                                                color: AppColors.kAccent,
                                                borderRadius:
                                                    const BorderRadius.vertical(
                                                        bottom:
                                                            Radius.circular(10)),
                                              ),
                                              child: const Text('Primary',
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            ),
                                          ),
                                      ])
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 32,
                                            height: 32,
                                            decoration: BoxDecoration(
                                              color: AppColors.kAccent
                                                  .withOpacity(0.1),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColors.kBorder,
                                                  style:
                                                      BorderStyle.solid),
                                            ),
                                            child: const Icon(Icons.add,
                                                color: AppColors.kAccent,
                                                size: 18),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            i == 1
                                                ? 'Close-Up'
                                                : 'Add Photo',
                                            style: const TextStyle(
                                                fontSize: 9,
                                                color: AppColors.kTextMuted),
                                          ),
                                        ],
                                      ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),

                        // ── About Me ──
                        const Text('About Me',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: AppColors.kDarkSlate)),
                        const SizedBox(height: 8),
                        TextField(
                          maxLines: 5,
                          maxLength: 255,
                          style: const TextStyle(
                              fontSize: 13, color: AppColors.kDarkSlate),
                          onChanged: (v) =>
                              setState(() => _aboutCount = v.length),
                          decoration: InputDecoration(
                            hintText: 'Describe yourself...',
                            hintStyle: const TextStyle(
                                color: AppColors.kTextMuted, fontSize: 13),
                            contentPadding: const EdgeInsets.all(14),
                            filled: true,
                            fillColor: AppColors.kCardBg,
                            counterText: '${_aboutCount}/255',
                            counterStyle: const TextStyle(
                                fontSize: 10, color: AppColors.kTextMuted),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: AppColors.kBorder)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: AppColors.kBorder)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: AppColors.kAccent, width: 1.5)),
                          ),
                        ),
                        const SizedBox(height: 22),

                        // ── Buttons ──
                        Row(children: [
                          Expanded(
                            child: CTAButton(
                              label: 'Submit',
                              outlined: true,
                              onTap: () => Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const HobbiesScreen())),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CTAButton(
                              label: 'Continue →',
                              onTap: () => Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const HobbiesScreen())),
                            ),
                          ),
                        ]),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text(
                            'In the next three stages, you can enter your family details, hobbies, interests, and horoscope details.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10, color: AppColors.kTextMuted),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}