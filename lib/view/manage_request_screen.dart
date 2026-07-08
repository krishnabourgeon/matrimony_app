// ═══════════════════════════════════════════════════════════════
//  MANAGE REQUEST SCREEN — name / photo / email / number / horoscope
//  access requests, accepted / pending / declined, receive / send
// ═══════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:matrimony_app/model/profile_model.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/profile_image.dart';

enum RequestType { name, photo, email, number, horoscope }

enum RequestStatus { accepted, pending, declined }

enum RequestDirection { received, sent }

extension on RequestType {
  String get label => switch (this) {
        RequestType.name => 'Name',
        RequestType.photo => 'Photo',
        RequestType.email => 'Email',
        RequestType.number => 'Number',
        RequestType.horoscope => 'Horoscope',
      };
}

extension on RequestStatus {
  String get label => switch (this) {
        RequestStatus.accepted => 'Accepted',
        RequestStatus.pending => 'Pending',
        RequestStatus.declined => 'Declined',
      };
}

class MemberRequest {
  final Profile profile;
  final RequestType type;
  RequestStatus status;
  final RequestDirection direction;
  MemberRequest({
    required this.profile,
    required this.type,
    required this.status,
    required this.direction,
  });
}

class ManageRequestScreen extends StatefulWidget {
  const ManageRequestScreen({super.key});
  @override
  State<ManageRequestScreen> createState() => _ManageRequestScreenState();
}

class _ManageRequestScreenState extends State<ManageRequestScreen> {
  RequestStatus _status = RequestStatus.accepted;
  RequestType _type = RequestType.name;
  RequestDirection _direction = RequestDirection.received;

  late final List<MemberRequest> _requests = _buildSampleRequests();

  List<MemberRequest> _buildSampleRequests() {
    final types = RequestType.values;
    final statuses = RequestStatus.values;
    final directions = RequestDirection.values;
    final list = <MemberRequest>[];
    for (var i = 0; i < appProfiles.length; i++) {
      list.add(MemberRequest(
        profile: appProfiles[i],
        type: types[i % types.length],
        status: statuses[i % statuses.length],
        direction: directions[i % directions.length],
      ));
    }
    // A few extras so most filter combinations have something to show.
    list.add(MemberRequest(
        profile: appProfiles[0],
        type: RequestType.photo,
        status: RequestStatus.pending,
        direction: RequestDirection.received));
    list.add(MemberRequest(
        profile: appProfiles[1],
        type: RequestType.number,
        status: RequestStatus.pending,
        direction: RequestDirection.received));
    list.add(MemberRequest(
        profile: appProfiles[2],
        type: RequestType.horoscope,
        status: RequestStatus.accepted,
        direction: RequestDirection.sent));
    return list;
  }

  List<MemberRequest> get _filtered => _requests
      .where((r) => r.status == _status && r.type == _type && r.direction == _direction)
      .toList();

  int _countFor(RequestStatus status) =>
      _requests.where((r) => r.status == status).length;

  void _accept(MemberRequest r) => setState(() => r.status = RequestStatus.accepted);
  void _decline(MemberRequest r) => setState(() => r.status = RequestStatus.declined);

  String get _listTitle => '${_status.label} List';

  String get _listSubtitle => switch (_status) {
        RequestStatus.accepted => 'Members who you accepted',
        RequestStatus.pending => 'Members waiting for your response',
        RequestStatus.declined => 'Members you declined',
      };

  String get _emptyMessage =>
      'No any ${_status.label.toLowerCase()} ${_type.label.toLowerCase()} requests';

  String? _unlockedPreview(MemberRequest r) {
    if (r.status != RequestStatus.accepted) return null;
    switch (r.type) {
      case RequestType.number:
        return 'Contact unlocked: +91 98•• ••${r.profile.profileId.length >= 4 ? r.profile.profileId.substring(r.profile.profileId.length - 4) : '0000'}';
      case RequestType.email:
        return 'Email unlocked: ${r.profile.name.split(' ').first.toLowerCase()}••@email.com';
      case RequestType.photo:
        return '${r.profile.photoCount} photo${r.profile.photoCount == 1 ? '' : 's'} unlocked';
      case RequestType.horoscope:
        return 'Horoscope details unlocked';
      case RequestType.name:
        return 'Full name unlocked: ${r.profile.name}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: const Text('Manage your request',
            style: TextStyle(
                color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w800)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Members who match your partner preferences',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
            const SizedBox(height: 16),

            // ── Status summary cards ──
            Row(
              children: [
                Expanded(
                    child: _StatCard(
                        label: 'Accepted',
                        count: _countFor(RequestStatus.accepted),
                        selected: _status == RequestStatus.accepted,
                        onTap: () => setState(() => _status = RequestStatus.accepted))),
                const SizedBox(width: 10),
                Expanded(
                    child: _StatCard(
                        label: 'Pending',
                        count: _countFor(RequestStatus.pending),
                        selected: _status == RequestStatus.pending,
                        onTap: () => setState(() => _status = RequestStatus.pending))),
                const SizedBox(width: 10),
                Expanded(
                    child: _StatCard(
                        label: 'Declined',
                        count: _countFor(RequestStatus.declined),
                        selected: _status == RequestStatus.declined,
                        onTap: () => setState(() => _status = RequestStatus.declined))),
              ],
            ),
            const SizedBox(height: 16),

            // ── List card ──
            Container(
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
                  Text(_listTitle,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
                  const SizedBox(height: 4),
                  Text(_listSubtitle,
                      style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                  const SizedBox(height: 14),

                  // Request-type pill selector
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(AppColors.r32),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: RequestType.values.map((t) {
                          final selected = t == _type;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: GestureDetector(
                              onTap: () => setState(() => _type = t),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                                decoration: BoxDecoration(
                                  color: selected ? AppColors.primary : Colors.transparent,
                                  borderRadius: BorderRadius.circular(AppColors.r32),
                                ),
                                child: Text('${t.label} Requests',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: selected ? Colors.white : AppColors.textSecondary)),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Receive / Send toggle
                  Row(
                    children: [
                      _DirectionChip(
                        label: 'Receive',
                        selected: _direction == RequestDirection.received,
                        onTap: () => setState(() => _direction = RequestDirection.received),
                      ),
                      const SizedBox(width: 10),
                      _DirectionChip(
                        label: 'Send',
                        selected: _direction == RequestDirection.sent,
                        onTap: () => setState(() => _direction = RequestDirection.sent),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  if (_filtered.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(_emptyMessage,
                          style: const TextStyle(fontSize: 13, color: AppColors.textHint)),
                    )
                  else
                    Column(
                      children: _filtered
                          .map((r) => _RequestTile(
                                request: r,
                                unlockedPreview: _unlockedPreview(r),
                                onAccept: () => _accept(r),
                                onDecline: () => _decline(r),
                              ))
                          .toList(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final int count;
  final bool selected;
  final VoidCallback onTap;
  const _StatCard(
      {required this.label, required this.count, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final numberColor = selected ? AppColors.primary : AppColors.success;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          color: selected ? AppColors.surface : AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(AppColors.r16),
          border: Border.all(color: selected ? AppColors.primary : Colors.transparent, width: 1.4),
        ),
        child: Column(
          children: [
            Text('$count',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: numberColor)),
            const SizedBox(height: 2),
            Text(label,
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
          ],
        ),
      ),
    );
  }
}

class _DirectionChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _DirectionChip({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppColors.r32),
          border: Border.all(
              color: selected ? AppColors.textPrimary : AppColors.border, width: selected ? 1.6 : 1),
        ),
        child: Text(label,
            style: TextStyle(
                fontSize: 13,
                fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                color: AppColors.textPrimary)),
      ),
    );
  }
}

class _RequestTile extends StatelessWidget {
  final MemberRequest request;
  final String? unlockedPreview;
  final VoidCallback onAccept;
  final VoidCallback onDecline;
  const _RequestTile({
    required this.request,
    required this.unlockedPreview,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    final profile = request.profile;
    final canRespond =
        request.status == RequestStatus.pending && request.direction == RequestDirection.received;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(AppColors.r16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: ProfileImage(profile.image,
                    width: 44,
                    height: 44,
                    fit: BoxFit.cover,
                    errorWidget: Container(
                        width: 44,
                        height: 44,
                        color: AppColors.primaryLight,
                        child: const Icon(Icons.person, size: 22, color: AppColors.primary))),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${profile.name}, ${profile.age}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                    Text('${profile.profession} · ${profile.city}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 11, color: AppColors.textHint)),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              if (!canRespond) _statusChip(request.status),
            ],
          ),
          if (canRespond) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: onDecline,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.errorLight,
                          borderRadius: BorderRadius.circular(AppColors.r32)),
                      child: const Text('Decline',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.error)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: onAccept,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.successLight,
                          borderRadius: BorderRadius.circular(AppColors.r32)),
                      child: const Text('Accept',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.success)),
                    ),
                  ),
                ),
              ],
            ),
          ],
          if (unlockedPreview != null) ...[
            const SizedBox(height: 8),
            Text(unlockedPreview!,
                style: const TextStyle(
                    fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.success)),
          ],
        ],
      ),
    );
  }

  Widget _statusChip(RequestStatus status) {
    final Color color = switch (status) {
      RequestStatus.accepted => AppColors.success,
      RequestStatus.pending => AppColors.warning,
      RequestStatus.declined => AppColors.error,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(20)),
      child: Text(status.label,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: color)),
    );
  }
}
