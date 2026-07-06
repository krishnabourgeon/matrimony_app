// ═══════════════════════════════════════════════════════════════
//  TRUST BADGE SCREEN — identity / qualification / professional badges
// ═══════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

class TrustBadgeScreen extends StatefulWidget {
  const TrustBadgeScreen({super.key});
  @override
  State<TrustBadgeScreen> createState() => _TrustBadgeScreenState();
}

class _TrustBadgeScreenState extends State<TrustBadgeScreen> {
  String? _qualificationFile;
  String? _professionalFile;

  void _chooseFile(ValueChanged<String> onPicked) {
    // TODO: wire to a real document picker (e.g. file_picker) once added to pubspec.yaml
    onPicked('document.pdf');
  }

  void _sendForVerification(String badge, String? fileName) {
    if (fileName == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please choose a file first')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$badge document sent for verification')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: const Text('Trust Badge',
            style: TextStyle(
                color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w800)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHero(),
            const SizedBox(height: 16),
            _BadgeCard(
              title: 'Identity Badge',
              description: 'This allows members to trust your Age, Name and Date of Birth.',
              instructionPrefix:
                  'To get this badge, send any one of the following documents, ',
              highlighted: 'Driving License, Pan Card, Passport, Voter Id, Aadhar Card',
              instructionSuffix:
                  '. (The documents are highly secure and will be stored for a maximum period of six months)',
              child: const _SubmittedNotice(),
            ),
            const SizedBox(height: 16),
            _BadgeCard(
              title: 'Qualification Badge',
              description: 'This allows members to trust your education Details.',
              instructionPrefix: 'To get this badge, you can send your ',
              highlighted: 'Education Certificate',
              instructionSuffix:
                  '. (The documents are highly secure and will be stored for a maximum period of six months)',
              child: _UploadRow(
                fileName: _qualificationFile,
                onChooseFile: () =>
                    _chooseFile((f) => setState(() => _qualificationFile = f)),
                onSend: () => _sendForVerification('Qualification Badge', _qualificationFile),
              ),
            ),
            const SizedBox(height: 16),
            _BadgeCard(
              title: 'Professional Badge',
              description: 'This allows members to trust your Profession.',
              instructionPrefix: 'To get this badge, you can send your ',
              highlighted: 'Salary Slip',
              instructionSuffix:
                  '. (The documents are highly secure and will be stored for a maximum period of six months)',
              child: _UploadRow(
                fileName: _professionalFile,
                onChooseFile: () =>
                    _chooseFile((f) => setState(() => _professionalFile = f)),
                onSend: () => _sendForVerification('Professional Badge', _professionalFile),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryMid],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(AppColors.r20),
        boxShadow: AppColors.shadowMd,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Trust Badge',
                    style: TextStyle(
                        color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900)),
                const SizedBox(height: 8),
                Text(
                  'Your safety is our priority. To ensure a secure and positive experience, please follow these guidelines',
                  style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle),
            child: const Icon(Icons.verified_user_rounded, color: Colors.white, size: 28),
          ),
        ],
      ),
    );
  }
}

class _BadgeCard extends StatelessWidget {
  final String title;
  final String description;
  final String instructionPrefix;
  final String highlighted;
  final String instructionSuffix;
  final Widget child;

  const _BadgeCard({
    required this.title,
    required this.description,
    required this.instructionPrefix,
    required this.highlighted,
    required this.instructionSuffix,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppColors.r20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
          const SizedBox(height: 10),
          Text(description,
              style: const TextStyle(fontSize: 13, color: AppColors.textPrimary, height: 1.5)),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 13, color: AppColors.textPrimary, height: 1.5),
              children: [
                TextSpan(text: instructionPrefix),
                TextSpan(
                    text: highlighted,
                    style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
                TextSpan(text: instructionSuffix),
              ],
            ),
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

class _SubmittedNotice extends StatelessWidget {
  const _SubmittedNotice();
  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.check_rounded, size: 16, color: AppColors.success),
        SizedBox(width: 6),
        Expanded(
          child: Text('You have already submitted the document for verification',
              style: TextStyle(
                  fontSize: 13, color: AppColors.textSecondary, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}

class _UploadRow extends StatelessWidget {
  final String? fileName;
  final VoidCallback onChooseFile;
  final VoidCallback onSend;
  const _UploadRow({required this.fileName, required this.onChooseFile, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
            children: [
              TextSpan(
                  text: 'Supported formats: ',
                  style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
              TextSpan(text: 'JPG, JPEG, PNG, PDF'),
            ],
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
            children: [
              TextSpan(
                  text: 'Maximum size: ',
                  style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
              TextSpan(text: '2 MB'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            final narrow = constraints.maxWidth < 340;

            final chooseFileBtn = GestureDetector(
              onTap: onChooseFile,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(AppColors.r12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.border)),
                    child: const Text('Choose File',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(fileName ?? 'No file chosen',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12, color: AppColors.textHint)),
                  ),
                ]),
              ),
            );

            final sendBtn = GestureDetector(
              onTap: onSend,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.primary, borderRadius: BorderRadius.circular(AppColors.r12)),
                child: const Text('Sent mail',
                    style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w800)),
              ),
            );

            if (narrow) {
              return Column(children: [
                chooseFileBtn,
                const SizedBox(height: 10),
                SizedBox(width: double.infinity, child: sendBtn),
              ]);
            }
            return Row(children: [
              Expanded(child: chooseFileBtn),
              const SizedBox(width: 12),
              SizedBox(width: 120, child: sendBtn),
            ]);
          },
        ),
      ],
    );
  }
}
