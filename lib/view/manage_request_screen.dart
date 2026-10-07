// Inbox screen — Received / Accepted / Contacts / Sent request lists.
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:matrimony_app/model/contacts_viewed_by_me_model.dart'
    show ContactsViewedByMeModel;
import 'package:matrimony_app/model/contacts_viewed_you_model.dart'
    show ContactsViewedYouModel;
import 'package:matrimony_app/model/interest_recevied_model.dart'
    show InterestReceivedModel;
import 'package:matrimony_app/model/interest_send_model.dart'
    show InterestSentModel;
import 'package:matrimony_app/model/request_model.dart' show RequestModel;
import 'package:matrimony_app/model/request_send_model.dart'
    show RequestSendModel;
import 'package:matrimony_app/model/shortlisted_by_you_model.dart'
    show ShortlistedByYouModel;
import 'package:matrimony_app/model/shortlisted_you_model.dart'
    show ShortlistedYouModel;
import 'package:matrimony_app/provider/home_provider.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/shortlist_badge.dart';
import 'package:matrimony_app/view/match_profile_detail_screen.dart';
import 'package:matrimony_app/view/matches_screen.dart';
import 'package:matrimony_app/view/message_screen.dart';

enum _RequestStatus { pending, accepted, declined }

class _InboxEntry {
  final MatchProfileItem profile;
  final String date;
  final _RequestStatus status;
  // The backend id used to respond (accept/decline) to this entry — an
  // interest id for Interest rows, a request id for Request rows.
  final int? entryId;
  const _InboxEntry({
    required this.profile,
    required this.date,
    this.status = _RequestStatus.pending,
    this.entryId,
  });

  _InboxEntry copyWith({_RequestStatus? status}) => _InboxEntry(
    profile: profile,
    date: date,
    status: status ?? this.status,
    entryId: entryId,
  );
}

class ManageRequestScreen extends StatefulWidget {
  const ManageRequestScreen({super.key});

  @override
  State<ManageRequestScreen> createState() => _ManageRequestScreenState();
}

class _ManageRequestScreenState extends State<ManageRequestScreen> {
  int _activeTab = 0; // 0=Interest, 1=Request, 2=Contacts, 3=Shortlistings
  int _activeSubTab =
      0; // Received/Send, Viewed/Viewed-you, or Shortlisted Me/By Me
  int _interestStatusFilter = 0; // 0=Pending, 1=Accepted, 2=Declined
  int _requestType = 0; // Photo / Number

  static const _tabLabels = [
    'Interest',
    'Request',
    'Contacts',
    'Shortlistings',
  ];
  static const _statusLabels = ['Pending', 'Accepted', 'Declined'];
  static const _requestTypeLabels = ['Photo Requests', 'Number Requests'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<HomeProvider>();
      provider.interestReceived(1); // Pending, the default filter
      provider.interestSend(1);
      provider.request('photo'); // Photo Requests, the default type filter
      provider.requestSend('photo');
      provider.getShortlistedYou(); // "Shortlisted Me"
      provider.getShortlistedByYou(); // "Shortlisted By Me"
      provider.contactsViewedByMe(); // "Contacts Viewed"
      provider.contactsViewedByYou(); // "Viewed you"
    });
  }

  // Converts an "Interest" or "Request" API row into the screen's display
  // model — both share the same row shape. Status codes from the backend:
  // 1=Pending, 2=Accepted, 3=Declined.
  _InboxEntry _fromApiRow({
    int? entryId,
    // The profile owner's backend customer id — distinct from entryId
    // (which is the interest/request transaction id) — used to persist
    // the ShortlistBadge heart button via HomeProvider.shortlist.
    int? profileId,
    String? name,
    int? age,
    String? height,
    String? occupation,
    dynamic motherTongue,
    String? community,
    String? location,
    String? imageUrl,
    int? statusCode,
  }) {
    final status = switch (statusCode) {
      2 => _RequestStatus.accepted,
      3 => _RequestStatus.declined,
      _ => _RequestStatus.pending,
    };
    final motherTongueStr = motherTongue?.toString() ?? '';
    final line1 = [
      if (age != null) '$age Yrs',
      if (height != null && height.isNotEmpty) height,
      if (occupation != null && occupation.isNotEmpty) occupation,
    ].join(', ');
    final line2Parts = <String>[
      if (motherTongueStr.isNotEmpty) motherTongueStr,
      if (community != null && community.isNotEmpty) community,
    ];
    final line2 = [
      line2Parts.join(', '),
      if (location != null && location.isNotEmpty) location,
    ].where((s) => s.isNotEmpty).join(' · ');
    return _InboxEntry(
      profile: MatchProfileItem(
        name: name ?? '',
        line1: line1,
        line2: line2,
        image: imageUrl ?? '',
        age: age ?? 0,
        height: height ?? '',
        motherTongue: motherTongueStr,
        community: community ?? '',
        location: location ?? '',
        profileId: profileId?.toString() ?? '',
      ),
      date: '',
      status: status,
      entryId: entryId,
    );
  }

  // Converts a "Contacts Viewed" / "Viewed you" API row into the screen's
  // display model. Unlike interest/request rows, contact rows have no
  // status concept — just a phone number ("Contacts Viewed" only; "Viewed
  // you" doesn't return one since that contact hasn't been unlocked yet, so
  // MatchProfileItem's masked placeholder default is left as-is).
  _InboxEntry _fromApiContact({
    int? id,
    String? name,
    int? age,
    String? height,
    String? occupation,
    dynamic motherTongue,
    dynamic community,
    String? location,
    String? imageUrl,
    String? mobileNumber,
  }) {
    final motherTongueStr = motherTongue?.toString() ?? '';
    final communityStr = community?.toString() ?? '';
    final line1 = [
      if (age != null) '$age Yrs',
      if (height != null && height.isNotEmpty) height,
      if (occupation != null && occupation.isNotEmpty) occupation,
    ].join(', ');
    final line2 = [
      [motherTongueStr, communityStr].where((s) => s.isNotEmpty).join(', '),
      if (location != null && location.isNotEmpty) location,
    ].where((s) => s.isNotEmpty).join(' · ');
    return _InboxEntry(
      profile: MatchProfileItem(
        name: name ?? '',
        line1: line1,
        line2: line2,
        image: imageUrl ?? '',
        age: age ?? 0,
        height: height ?? '',
        motherTongue: motherTongueStr,
        community: communityStr,
        location: location ?? '',
        profileId: id?.toString() ?? '',
        contactNo: mobileNumber ?? '+91 9876******',
      ),
      date: '',
    );
  }

  final List<_InboxEntry> _interestsReceived = [
    const _InboxEntry(
      profile: MatchProfileItem(
        name: 'Nithya Das',
        line1: "26 Yrs, 5'2\" · Finance Professional",
        line2: 'Malayalam, Thiyya · Kozhikode, Kerala',
        image: 'assets/image/archana.png',
      ),
      date: '05 Oct',
    ),
    const _InboxEntry(
      profile: MatchProfileItem(
        name: 'Anjali Jayan',
        line1: "24 Yrs, 5'2\" · Human Resource Manager",
        line2: 'Malayalam, Vishwakarma · Kottayam, Kerala',
        image: 'assets/image/user3.png',
      ),
      date: '05 Oct',
    ),
    const _InboxEntry(
      profile: MatchProfileItem(
        name: 'Deepthi',
        line1: "24 Yrs, 5'2\" · Bank Officer",
        line2: 'Malayalam, Vishwakarma · Kollam, Kerala',
        image: 'assets/image/user2.png',
      ),
      date: '04 Oct',
    ),
    const _InboxEntry(
      profile: MatchProfileItem(
        name: 'Swathy Mohan',
        line1: "26 Yrs, 5'2\" · Finance Professional",
        line2: 'Malayalam, Thiyya · Kozhikode, Kerala',
        image: 'assets/image/user1.png',
        isPremium: true,
        photoCount: 4,
        age: 26,
        height: "5'2\"",
      ),
      date: '05 Oct',
      status: _RequestStatus.accepted,
    ),
    const _InboxEntry(
      profile: MatchProfileItem(
        name: 'Geethu',
        line1: "26 Yrs, 5'2\" · Finance Professional",
        line2: 'Malayalam, Thiyya · Kozhikode, Kerala',
        image: 'assets/image/user3.png',
        photoCount: 4,
        age: 26,
        height: "5'2\"",
      ),
      date: '05 Oct',
      status: _RequestStatus.accepted,
    ),
  ];

  final List<_InboxEntry> _interestsSent = [
    const _InboxEntry(
      profile: MatchProfileItem(
        name: 'Chandhini',
        line1: "26 Yrs, 5'2\" · Architect",
        line2: 'Malayalam, Nair · Ernakulam, Kerala',
        image: 'assets/image/riys.png',
      ),
      date: '02 Oct',
    ),
    const _InboxEntry(
      profile: MatchProfileItem(
        name: 'Anushka',
        line1: "23 Yrs, 5'4\" · Software Engineer",
        line2: 'Malayalam, Nair · Thrissur, Kerala',
        image: 'assets/image/archana.png',
      ),
      date: '30 Sep',
    ),
    const _InboxEntry(
      profile: MatchProfileItem(
        name: 'Meenakshi',
        line1: "28 Yrs, 5'2\" · Finance Professional",
        line2: 'Malayalam, Thiyya · Kozhikode, Kerala',
        image: 'assets/image/user2.png',
      ),
      date: '03 Oct',
      status: _RequestStatus.accepted,
    ),
  ];

  // "Photo Requests" is the only request type with sample data — the swipe
  // deck lives here; "Number Requests" shows the empty-state text until
  // there's a real backend for typed requests.
  final List<_InboxEntry> _requestsReceived = [
    const _InboxEntry(
      profile: MatchProfileItem(
        name: 'Devika',
        line1: "25 Yrs, 5'3\" · Bank Officer",
        line2: 'Malayalam, Vishwakarma · Kollam, Kerala',
        image: 'assets/image/user2.png',
      ),
      date: '06 Oct',
    ),
    const _InboxEntry(
      profile: MatchProfileItem(
        name: 'Meera',
        line1: "24 Yrs, 5'2\" · Software Engineer",
        line2: 'Malayalam, Nair · Alappuzha, Kerala',
        image: 'assets/image/archana.png',
      ),
      date: '05 Oct',
    ),
  ];

  final List<_InboxEntry> _requestsSent = const [
    _InboxEntry(
      profile: MatchProfileItem(
        name: 'Rithu',
        line1: "23 Yrs, 5'2\" · Teacher",
        line2: 'Malayalam, Vishwakarma · Kottayam, Kerala',
        image: 'assets/image/user3.png',
      ),
      date: '06 Oct',
    ),
  ];

  final List<_InboxEntry> _contactsViewed = const [
    _InboxEntry(
      profile: MatchProfileItem(
        name: 'Saranya',
        line1: "24 Yrs, 5'2\" · Human Resource Manager",
        line2: 'Malayalam, Vishwakarma · Palakkad, Kerala',
        image: 'assets/image/user1.png',
        managedBy: 'Parent',
        contactNo: '+91 7341868670',
        email: 'saranya@gmail.com',
      ),
      date: '05 Oct',
    ),
    _InboxEntry(
      profile: MatchProfileItem(
        name: 'Hridhya',
        line1: "25 Yrs, 5'3\" · Bank Officer",
        line2: 'Malayalam, Vishwakarma · Kollam, Kerala',
        image: 'assets/image/user2.png',
        managedBy: 'Self',
        contactNo: '+91 9846868671',
        email: 'hridhya@gmail.com',
      ),
      date: '05 Oct',
    ),
    _InboxEntry(
      profile: MatchProfileItem(
        name: 'Rithu',
        line1: "23 Yrs, 5'2\" · Teacher",
        line2: 'Malayalam, Vishwakarma · Kottayam, Kerala',
        image: 'assets/image/user3.png',
        managedBy: 'Parent',
        contactNo: '+91 7340561143',
        email: 'rithu@gmail.com',
      ),
      date: '05 Oct',
    ),
  ];

  // "Interests Received" swipe deck — persists the accept/decline choice to
  // the backend. The deck already advances to the next card immediately
  // (see _ReceivedSwipeDeck), so this call fires in the background.
  void _respondToInterest(_InboxEntry entry, {required bool accept}) {
    final interestId = entry.entryId;
    if (interestId == null) return;
    context.read<HomeProvider>().respondInterest(
      interestId,
      accept ? 'accept' : 'decline',
    );
  }

  // "Requests Received" swipe deck — same fire-and-forget persistence as
  // _respondToInterest, against the requests respond endpoint instead.
  void _respondToRequest(_InboxEntry entry, {required bool accept}) {
    final requestId = entry.entryId;
    if (requestId == null) return;
    context.read<HomeProvider>().respondRequest(
      requestId,
      accept ? 'accept' : 'decline',
    );
  }

  List<int> get _counts => [
    _interestsReceived.length + _interestsSent.length,
    _requestsReceived.length + _requestsSent.length,
    _contactsViewed.length,
    0, // Shortlistings isn't backed by real data yet
  ];

  @override
  Widget build(BuildContext context) {
    // Contacts tab counts — read once here since they're needed by both the
    // sub-tab labels and the descriptive text below the chips.
    final viewedByMeModel = context
        .select<HomeProvider, ContactsViewedByMeModel?>(
          (p) => p.contactsViewedByMeModel,
        );
    final viewedYouModel = context
        .select<HomeProvider, ContactsViewedYouModel?>(
          (p) => p.contactsViewedYouModel,
        );
    final viewedByMeCount =
        viewedByMeModel?.total ?? viewedByMeModel?.data?.length ?? 0;
    final viewedYouCount =
        viewedYouModel?.total ?? viewedYouModel?.data?.length ?? 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 10.h),
            _buildTabs(),
            SizedBox(height: 10.h),
            if (_activeTab == 0) ...[
              _buildSubTabs(
                leftLabel: 'Interests Received',
                rightLabel: 'Interests Send',
              ),
              SizedBox(height: 10.h),
              _buildStatusChips(),
            ] else if (_activeTab == 1) ...[
              _buildSubTabs(
                leftLabel: 'Requests Received',
                rightLabel: 'Requests Send',
              ),
              SizedBox(height: 10.h),
              _buildRequestTypeChips(),
            ] else if (_activeTab == 2) ...[
              _buildSubTabs(
                leftLabel: 'Contacts Viewed ($viewedByMeCount)',
                rightLabel: 'Viewed you ($viewedYouCount)',
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  _activeSubTab == 0
                      ? 'Contacts you have viewed (${viewedByMeModel?.data?.length ?? 0} of $viewedByMeCount)'
                      : 'Contacts who viewed you (${viewedYouModel?.data?.length ?? 0} of $viewedYouCount)',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ] else if (_activeTab == 3) ...[
              _buildSubTabs(
                leftLabel: 'Shortlisted Me',
                rightLabel: 'Shortlisted By Me',
              ),
            ],
            SizedBox(height: 8.h),
            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
      child: Row(
        children: [
          Icon(Icons.menu, size: 22.sp, color: Colors.black87),
          SizedBox(width: 10.w),
          Text(
            'Inbox',
            style: GoogleFonts.tasaOrbiter(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return SizedBox(
      height: 34.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: _tabLabels.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final selected = _activeTab == index;
          return InkWell(
            onTap: () => setState(() {
              _activeTab = index;
              _activeSubTab = 0;
              _interestStatusFilter = 0;
              _requestType = 0;
            }),
            borderRadius: BorderRadius.circular(18.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(18.r),
                border: Border.all(
                  color: selected ? AppColors.primary : const Color(0xFFE0E0E0),
                ),
              ),
              child: Text(
                '${_tabLabels[index]} (${_counts[index]})',
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubTabs({
    required String leftLabel,
    required String rightLabel,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          _subTab(leftLabel, 0),
          SizedBox(width: 22.w),
          _subTab(rightLabel, 1),
        ],
      ),
    );
  }

  Widget _subTab(String label, int index) {
    final selected = _activeSubTab == index;
    return InkWell(
      onTap: () {
        setState(() => _activeSubTab = index);
        // "Interests Send" / "Requests Send" — fetch as soon as it's
        // opened, using whichever status/type chip is currently selected.
        if (_activeTab == 0 && index == 1) {
          context.read<HomeProvider>().interestSend(_interestStatusFilter + 1);
        } else if (_activeTab == 1 && index == 1) {
          context.read<HomeProvider>().requestSend(
            _requestType == 0 ? 'photo' : 'number',
          );
        }
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selected ? AppColors.primary : Colors.transparent,
              width: 2.5,
            ),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.tasaOrbiter(
            fontSize: 13.sp,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            color: selected ? Colors.black87 : Colors.black45,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChips() {
    return SizedBox(
      height: 32.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: _statusLabels.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (context, i) {
          final selected = _interestStatusFilter == i;
          return InkWell(
            onTap: () {
              setState(() => _interestStatusFilter = i);
              // Chip index 0/1/2 (Pending/Accepted/Declined) maps to
              // backend status codes 1/2/3.
              final provider = context.read<HomeProvider>();
              if (_activeSubTab == 0) {
                provider.interestReceived(i + 1);
              } else {
                provider.interestSend(i + 1);
              }
            },
            borderRadius: BorderRadius.circular(16.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: selected ? AppColors.primary : const Color(0xFFE0E0E0),
                ),
              ),
              child: Text(
                _statusLabels[i],
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : Colors.black87,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRequestTypeChips() {
    return SizedBox(
      height: 32.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: _requestTypeLabels.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (context, i) {
          final selected = _requestType == i;
          return InkWell(
            onTap: () {
              setState(() => _requestType = i);
              final type = i == 0 ? 'photo' : 'number';
              final provider = context.read<HomeProvider>();
              if (_activeSubTab == 0) {
                provider.request(type);
              } else {
                provider.requestSend(type);
              }
            },
            borderRadius: BorderRadius.circular(16.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: selected ? AppColors.primary : const Color(0xFFE0E0E0),
                ),
              ),
              child: Text(
                _requestTypeLabels[i],
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : Colors.black87,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _emptyText(String message) {
    return Center(
      child: Text(
        message,
        style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: Colors.black45),
      ),
    );
  }

  Widget _buildContent() {
    if (_activeTab == 2) {
      // "Contacts Viewed" — real API data (GET inbox/contacts). "Viewed
      // you" — real API data (GET inbox/contacts/viewed-you).
      final List<_InboxEntry> list;
      if (_activeSubTab == 0) {
        final data = context
            .select<HomeProvider, ContactsViewedByMeModel?>(
              (p) => p.contactsViewedByMeModel,
            )
            ?.data;
        list = (data ?? [])
            .map(
              (d) => _fromApiContact(
                id: d.id,
                name: d.name,
                age: d.age,
                height: d.height,
                occupation: d.occupation,
                motherTongue: d.motherTongue,
                community: d.community,
                location: d.location,
                imageUrl: d.imageUrl,
                mobileNumber: d.mobileNumber,
              ),
            )
            .toList();
      } else {
        final data = context
            .select<HomeProvider, ContactsViewedYouModel?>(
              (p) => p.contactsViewedYouModel,
            )
            ?.data;
        list = (data ?? [])
            .map(
              (d) => _fromApiContact(
                id: d.id,
                name: d.name,
                age: d.age,
                height: d.height,
                occupation: d.occupation,
                motherTongue: d.motherTongue,
                community: d.community,
                location: d.location,
                imageUrl: d.imageUrl,
              ),
            )
            .toList();
      }
      if (list.isEmpty) return _emptyText('Nothing here yet');
      return ListView.separated(
        padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
        itemCount: list.length,
        separatorBuilder: (_, __) => SizedBox(height: 14.h),
        itemBuilder: (context, index) => _ContactCard(entry: list[index]),
      );
    }

    if (_activeTab == 3) {
      // Same card-list design as Interests/Requests Received & Send.
      // "Shortlisted Me" — people who shortlisted your profile (GET
      // matches/shortlisted-you). "Shortlisted By Me" — profiles you've
      // shortlisted (GET matches/shortlisted-by-you).
      // shortlisted_you_model.dart and shortlisted_by_you_model.dart each
      // declare their own nominal `Match` class with an identical shape —
      // map each branch separately rather than merging into one variable,
      // which would collapse the element type to Object.
      final List<_InboxEntry> list;
      if (_activeSubTab == 0) {
        final matches = context
            .select<HomeProvider, ShortlistedYouModel?>(
              (p) => p.shortlistedYouModel,
            )
            ?.matches;
        list = (matches ?? [])
            .map(
              (m) => _fromApiRow(
                profileId: m.id,
                name: m.name,
                age: m.age,
                height: m.height,
                motherTongue: m.motherTongue,
                community: m.community,
                location: m.location,
                imageUrl: m.imageUrl?.toString(),
              ),
            )
            .toList();
      } else {
        final matches = context
            .select<HomeProvider, ShortlistedByYouModel?>(
              (p) => p.shortlistedByYouModel,
            )
            ?.matches;
        list = (matches ?? [])
            .map(
              (m) => _fromApiRow(
                profileId: m.id,
                name: m.name,
                age: m.age,
                height: m.height,
                motherTongue: m.motherTongue,
                community: m.community,
                location: m.location,
                imageUrl: m.imageUrl?.toString(),
              ),
            )
            .toList();
      }
      if (list.isEmpty) return _emptyText('Nothing here yet');
      return ListView.separated(
        padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
        itemCount: list.length,
        separatorBuilder: (_, __) => SizedBox(height: 14.h),
        itemBuilder: (context, index) => _InboxCard(entry: list[index]),
      );
    }

    if (_activeTab == 1) {
      // Requests Received — real API data (GET inbox/requests/received?type=),
      // filtered by the Photo/Number chip. Same swipeable Accept/Decline
      // deck as Interests Received, looping back to the first card once
      // every profile has been swiped.
      if (_activeSubTab == 0) {
        final requestModel = context.select<HomeProvider, RequestModel?>(
          (p) => p.requestModel,
        );
        final requestList = (requestModel?.data ?? [])
            .map(
              (d) => _fromApiRow(
                entryId: d.requestId,
                profileId: d.id,
                name: d.name,
                age: d.age,
                height: d.height,
                occupation: d.occupation,
                motherTongue: d.motherTongue,
                community: d.community,
                location: d.location,
                imageUrl: d.imageUrl,
                statusCode: d.requestStatus,
              ),
            )
            .toList();
        final pending = requestList
            .where((e) => e.status == _RequestStatus.pending)
            .toList();
        if (requestList.isEmpty) return _emptyText('Nothing here yet');
        return _ReceivedSwipeDeck(
          key: ValueKey('request-received-$_requestType'),
          entries: pending,
          loop: true,
          onAccept: (entry) => _respondToRequest(entry, accept: true),
          onDecline: (entry) => _respondToRequest(entry, accept: false),
        );
      }
      // Requests Send — real API data (GET inbox/requests/sent?type=), same
      // Photo/Number filtering as Requests Received.
      final requestSendModel = context.select<HomeProvider, RequestSendModel?>(
        (p) => p.requestSendModel,
      );
      final sentList = (requestSendModel?.data ?? [])
          .map(
            (d) => _fromApiRow(
              entryId: d.requestId,
              profileId: d.id,
              name: d.name,
              age: d.age,
              height: d.height,
              occupation: d.occupation,
              motherTongue: d.motherTongue,
              community: d.community,
              location: d.location,
              imageUrl: d.imageUrl,
              statusCode: d.requestStatus,
            ),
          )
          .toList();
      if (sentList.isEmpty) return _emptyText('Nothing here yet');
      return ListView.separated(
        padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
        itemCount: sentList.length,
        separatorBuilder: (_, __) => SizedBox(height: 14.h),
        itemBuilder: (context, index) =>
            _InboxCard(entry: sentList[index], isSent: true),
      );
    }

    // Interest tab, "Interests Received" — real API data, filtered by the
    // Pending/Accepted/Declined chip. "Pending" shows the swipeable
    // Accept/Decline deck, which loops back to the first card once every
    // profile has been swiped so the deck is never left empty.
    if (_activeSubTab == 0) {
      // select (not watch) — only rebuilds this screen when the received
      // list itself changes, not on every loading/loaded notifyListeners()
      // fired by unrelated calls like respondInterest (accept/decline),
      // which was causing dropped frames and a visible lag on tap.
      final interestReceivedModel = context
          .select<HomeProvider, InterestReceivedModel?>(
            (p) => p.interestReceivedModel,
          );
      final apiList = (interestReceivedModel?.data ?? [])
          .map(
            (d) => _fromApiRow(
              entryId: d.interestId,
              profileId: d.id,
              name: d.name,
              age: d.age,
              height: d.height,
              occupation: d.occupation,
              motherTongue: d.motherTongue,
              community: d.community,
              location: d.location,
              imageUrl: d.imageUrl,
              statusCode: d.interestStatus,
            ),
          )
          .toList();

      final showSwipeDeck = _interestStatusFilter == 0;
      if (showSwipeDeck) {
        final pending = apiList
            .where((e) => e.status == _RequestStatus.pending)
            .toList();
        if (apiList.isEmpty) return _emptyText('Nothing here yet');
        return _ReceivedSwipeDeck(
          key: const ValueKey('received-pending'),
          entries: pending,
          loop: true,
          onAccept: (entry) => _respondToInterest(entry, accept: true),
          onDecline: (entry) => _respondToInterest(entry, accept: false),
        );
      }
      if (apiList.isEmpty) return _emptyText('Nothing here yet');
      return ListView.separated(
        padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
        itemCount: apiList.length,
        separatorBuilder: (_, __) => SizedBox(height: 14.h),
        itemBuilder: (context, index) => _InboxCard(entry: apiList[index]),
      );
    }

    // "Interests Send" — real API data (GET inbox/sent?status=), same
    // Pending/Accepted/Declined filtering as Received.
    final interestSendModel = context.select<HomeProvider, InterestSentModel?>(
      (p) => p.interestSendModel,
    );
    final list = (interestSendModel?.data ?? [])
        .map(
          (d) => _fromApiRow(
            entryId: d.interestId,
            profileId: d.id,
            name: d.name,
            age: d.age,
            height: d.height,
            occupation: d.occupation,
            motherTongue: d.motherTongue,
            community: d.community,
            location: d.location,
            imageUrl: d.imageUrl,
            statusCode: d.interestStatus,
          ),
        )
        .toList();
    if (list.isEmpty) return _emptyText('Nothing here yet');
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
      itemCount: list.length,
      separatorBuilder: (_, __) => SizedBox(height: 14.h),
      itemBuilder: (context, index) =>
          _InboxCard(entry: list[index], isSent: true),
    );
  }
}

class _InboxCard extends StatelessWidget {
  final _InboxEntry entry;
  final bool isSent;
  const _InboxCard({required this.entry, this.isSent = false});

  @override
  Widget build(BuildContext context) {
    final p = entry.profile;
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MatchProfileDetailScreen(item: p)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(16.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                if (p.isPremium)
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 150.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/image/Vector 1265.png'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12.r),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/image/crown.png',
                            width: 12.w,
                            height: 12.w,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'Premium',
                            style: GoogleFonts.tasaOrbiter(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFD0B362),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    14.w,
                    p.isPremium ? 30.h : 14.h,
                    14.w,
                    14.h,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: matchProfileImage(
                          p.image,
                          width: 52.w,
                          height: 52.w,
                          errorIconSize: 22.sp,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    p.name,
                                    style: GoogleFonts.tasaOrbiter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Image.asset(
                                  'assets/image/verified.png',
                                  width: 14.w,
                                  height: 14.w,
                                ),
                              ],
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              p.line1,
                              style: GoogleFonts.tasaOrbiter(
                                fontSize: 12.sp,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              p.line2,
                              style: GoogleFonts.tasaOrbiter(
                                fontSize: 12.sp,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        entry.date,
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 12.sp,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (entry.status == _RequestStatus.declined ||
                (isSent && entry.status == _RequestStatus.pending))
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 7.w),
                color: const Color(0xFFF0F0F0),
                alignment: Alignment.center,
                child: Text(
                  entry.status == _RequestStatus.declined
                      ? 'Declined'
                      : 'Awaiting Response',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
              )
            else
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 7.w),
                color: const Color(0xFFFFE2E7),
                child: Column(
                  children: [
                    Text(
                      isSent ? 'Accepted' : 'Take the next step',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (!isSent)
                          _actionButton(
                            asset: 'assets/image/whatsapp_container.png',
                            label: 'Whatsapp',
                            onTap: () {},
                          ),
                        _actionButton(
                          asset: 'assets/image/message_container.png',
                          label: 'Chat',
                          //bg: Colors.white,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  MessageScreen(name: p.name, image: p.image),
                            ),
                          ),
                        ),
                        _actionButton(
                          asset: 'assets/image/call_container.png',
                          label: isSent ? 'Contact' : 'Call',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton({
    String? asset,
    IconData? icon,
    Color? iconColor,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          asset != null
              ? Image.asset(asset, width: 73.sp, height: 44.sp)
              : Container(
                  width: 44.sp,
                  height: 44.sp,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 20.sp,
                    color: iconColor ?? Colors.black54,
                  ),
                ),
          SizedBox(height: 5.h),
          Text(
            label,
            style: GoogleFonts.tasaOrbiter(
              fontSize: 12.sp,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

/// Card used in the "Contacts" tab — shows revealed phone / email / SMS
/// instead of the "Take the next step" action banner.
class _ContactCard extends StatelessWidget {
  final _InboxEntry entry;
  const _ContactCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    final p = entry.profile;
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MatchProfileDetailScreen(item: p)),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: matchProfileImage(
                    p.image,
                    width: 71.w,
                    height: 71.w,
                    errorIconSize: 30.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              p.name,
                              style: GoogleFonts.tasaOrbiter(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Image.asset(
                            'assets/image/verified.png',
                            width: 14.w,
                            height: 14.w,
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Profile created by ${p.managedBy}',
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 11.sp,
                          color: Colors.black45,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      _contactLinkRow(
                        icon: Icons.call_outlined,
                        text: p.contactNo,
                      ),
                      SizedBox(height: 8.h),
                      _contactLinkRow(
                        icon: Icons.email_outlined,
                        text: p.email,
                      ),
                      SizedBox(height: 8.h),
                      _contactLinkRow(
                        icon: Icons.sms_outlined,
                        text: 'Send SMS',
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  entry.date,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 11.sp,
                    color: Colors.black38,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(
                  Icons.more_vert_rounded,
                  size: 18.sp,
                  color: Colors.black45,
                ),
              ],
            ),
            // SizedBox(height: 12.h),
            // _contactLinkRow(icon: Icons.call_outlined, text: p.contactNo),
            // SizedBox(height: 8.h),
            // _contactLinkRow(icon: Icons.email_outlined, text: p.email),
            // SizedBox(height: 8.h),
            // _contactLinkRow(icon: Icons.sms_outlined, text: 'Send SMS'),
          ],
        ),
      ),
    );
  }

  Widget _contactLinkRow({required IconData icon, required String text}) {
    const blue = Color(0xFF2F6FE0);
    return Row(
      children: [
        Icon(icon, size: 15.sp, color: blue),
        SizedBox(width: 8.w),
        Flexible(
          child: Text(
            text,
            style: GoogleFonts.tasaOrbiter(
              fontSize: 12.5.sp,
              color: blue,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Tall swipe-review style card used in the "Received" tab — big photo with
/// the name/details overlaid at the bottom, then Decline / Accept buttons
/// underneath.
class _ReceivedRequestCard extends StatelessWidget {
  final _InboxEntry entry;
  final VoidCallback onAccept;
  final VoidCallback onDecline;
  final bool interactive;
  const _ReceivedRequestCard({
    required this.entry,
    required this.onAccept,
    required this.onDecline,
    this.interactive = true,
  });

  @override
  Widget build(BuildContext context) {
    final p = entry.profile;
    return IgnorePointer(
      ignoring: !interactive,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MatchProfileDetailScreen(item: p)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: SizedBox(
            height: 500.h,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                matchProfileImage(p.image, errorIconSize: 72.sp),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: const [0.5, 1.0],
                    ),
                  ),
                ),
                Positioned(
                  top: 16.h,
                  left: 16.w,
                  child: ShortlistBadge(profile: p),
                ),
                Positioned(
                  left: 16.w,
                  right: 16.w,
                  bottom: 92.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              p.name,
                              style: GoogleFonts.tasaOrbiter(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Image.asset(
                            'assets/image/verified.png',
                            width: 17.w,
                            height: 17.w,
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        p.line1,
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 13.sp,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        p.line2,
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 13.sp,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Divider(color: Colors.white54),
                    ],
                  ),
                ),
                Positioned(
                  left: 16.w,
                  right: 16.w,
                  bottom: 20.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: _pillButton(
                          //  icon: Icons.close_rounded,
                          image: 'assets/image/close.png',
                          label: 'Decline',
                          iconcolor: Colors.red,
                          color: Colors.black,
                          onTap: onDecline,
                        ),
                      ),
                      SizedBox(width: 14.w),
                      Expanded(
                        child: _pillButton(
                          //icon: Icons.check_rounded,
                          image: "assets/image/check.png",
                          label: 'Accept',
                          iconcolor: Colors.green,
                          color: Colors.black,
                          onTap: onAccept,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _pillButton({
    // required IconData icon,
    required String label,
    required Color color,
    required Color iconcolor,
    required VoidCallback onTap,
    required String image,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(26.r),
      child: Container(
        height: 48.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(icon, size: 24.sp, color: iconcolor),
            Image.asset(image, width: 24.sp, height: 24.sp, color: iconcolor),
            SizedBox(width: 8.w),
            Text(
              label,
              style: GoogleFonts.tasaOrbiter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tinder-style swipeable deck for the "Received" tab — shows the top card
/// draggable with the next one peeking behind it. Swipe right / tap Accept
/// to accept, swipe left / tap Decline to decline.
class _ReceivedSwipeDeck extends StatefulWidget {
  final List<_InboxEntry> entries;
  final void Function(_InboxEntry) onAccept;
  final void Function(_InboxEntry) onDecline;
  // When true, the deck cycles back to the first card once every entry has
  // been swiped instead of ending on an empty state.
  final bool loop;
  const _ReceivedSwipeDeck({
    super.key,
    required this.entries,
    required this.onAccept,
    required this.onDecline,
    this.loop = false,
  });

  @override
  State<_ReceivedSwipeDeck> createState() => _ReceivedSwipeDeckState();
}

class _ReceivedSwipeDeckState extends State<_ReceivedSwipeDeck> {
  Offset _drag = Offset.zero;
  int _index = 0;

  @override
  void didUpdateWidget(covariant _ReceivedSwipeDeck oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.loop) return;
    final sameEntries =
        oldWidget.entries.length == widget.entries.length &&
        List.generate(
          oldWidget.entries.length,
          (i) => oldWidget.entries[i].entryId == widget.entries[i].entryId,
        ).every((same) => same);
    if (!sameEntries) {
      _index = 0;
    } else if (widget.entries.isNotEmpty) {
      _index %= widget.entries.length;
    }
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() => _drag += details.delta);
  }

  void _onPanEnd(DragEndDetails details) {
    const threshold = 110.0;
    if (_drag.dx > threshold) {
      _resolve(accept: true);
    } else if (_drag.dx < -threshold) {
      _resolve(accept: false);
    } else {
      setState(() => _drag = Offset.zero);
    }
  }

  void _resolve({required bool accept}) {
    final currentIndex = widget.loop ? _index % widget.entries.length : 0;
    final entry = widget.entries[currentIndex];
    setState(() {
      _drag = Offset.zero;
      if (widget.loop) _index = (currentIndex + 1) % widget.entries.length;
    });
    accept ? widget.onAccept(entry) : widget.onDecline(entry);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.entries.isEmpty) {
      return Center(
        child: Text(
          'No new requests',
          style: GoogleFonts.tasaOrbiter(
            fontSize: 13.sp,
            color: Colors.black45,
          ),
        ),
      );
    }

    final topIndex = widget.loop ? _index % widget.entries.length : 0;
    final top = widget.entries[topIndex];
    final next = widget.entries.length > 1
        ? widget.entries[widget.loop
              ? (topIndex + 1) % widget.entries.length
              : 1]
        : null;
    final angle = (_drag.dx / 300).clamp(-0.4, 0.4);

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (next != null)
            Transform.scale(
              scale: 0.96,
              child: Opacity(
                opacity: 0.85,
                child: _ReceivedRequestCard(
                  entry: next,
                  onAccept: () {},
                  onDecline: () {},
                  interactive: false,
                ),
              ),
            ),
          GestureDetector(
            onPanUpdate: _onPanUpdate,
            onPanEnd: _onPanEnd,
            child: AnimatedContainer(
              duration: _drag == Offset.zero
                  ? const Duration(milliseconds: 220)
                  : Duration.zero,
              curve: Curves.easeOut,
              transform: Matrix4.identity()
                ..translate(_drag.dx, _drag.dy)
                ..rotateZ(angle),
              transformAlignment: Alignment.center,
              child: Stack(
                children: [
                  _ReceivedRequestCard(
                    entry: top,
                    onAccept: () => _resolve(accept: true),
                    onDecline: () => _resolve(accept: false),
                  ),
                  // if (_drag.dx > 16)
                  //   Positioned(top: 36.h, left: 24.w, child: _stamp('LIKE', const Color(0xFF2E9E4F))),
                  // if (_drag.dx < -16)
                  //   Positioned(top: 36.h, right: 24.w, child: _stamp('NOPE', const Color(0xFFE0453C))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stamp(String label, Color color) {
    return Transform.rotate(
      angle: label == 'LIKE' ? -0.35 : 0.35,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 3),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          label,
          style: GoogleFonts.tasaOrbiter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w900,
            color: color,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
