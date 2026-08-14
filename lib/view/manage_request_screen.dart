// Inbox screen — Received / Accepted / Contacts / Sent request lists.
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/shortlist_badge.dart';
import 'package:matrimony_app/view/match_profile_detail_screen.dart';
import 'package:matrimony_app/view/matches_screen.dart';
import 'package:matrimony_app/view/message_screen.dart';

class _InboxEntry {
  final MatchProfileItem profile;
  final String date;
  const _InboxEntry({required this.profile, required this.date});
}

class ManageRequestScreen extends StatefulWidget {
  const ManageRequestScreen({super.key});

  @override
  State<ManageRequestScreen> createState() => _ManageRequestScreenState();
}

class _ManageRequestScreenState extends State<ManageRequestScreen> {
  int _activeTab = 1; // Accepted, to match the reference
  int _activeSubTab = 0; // Accepted by Her

  static const _tabLabels = ['Received', 'Accepted', 'Contacts', 'Sent'];

  final List<_InboxEntry> _received = [
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
  ];

  final List<_InboxEntry> _acceptedByHer = [
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
    ),
    _InboxEntry(
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
    ),
  ];

  final List<_InboxEntry> _acceptedByMe = const [
    _InboxEntry(
      profile: MatchProfileItem(
        name: 'Meenakshi',
        line1: "28 Yrs, 5'2\" · Finance Professional",
        line2: 'Malayalam, Thiyya · Kozhikode, Kerala',
        image: 'assets/image/user2.png',
      ),
      date: '03 Oct',
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

  final List<_InboxEntry> _viewedYou = const [
    _InboxEntry(
      profile: MatchProfileItem(
        name: 'Aishwarya',
        line1: "24 Yrs, 5'3\" · Doctor",
        line2: 'Malayalam, Nair · Palakkad, Kerala',
        image: 'assets/image/priya.png',
        managedBy: 'Self',
        contactNo: '+91 9847012345',
        email: 'aishwarya@gmail.com',
      ),
      date: '04 Oct',
    ),
    _InboxEntry(
      profile: MatchProfileItem(
        name: 'Meera',
        line1: "24 Yrs, 5'2\" · Software Engineer",
        line2: 'Malayalam, Nair · Alappuzha, Kerala',
        image: 'assets/image/archana.png',
        managedBy: 'Parent',
        contactNo: '+91 9847098765',
        email: 'meera@gmail.com',
      ),
      date: '03 Oct',
    ),
    _InboxEntry(
      profile: MatchProfileItem(
        name: 'Dhanya',
        line1: "25 Yrs, 5'2\" · Doctor",
        line2: 'Malayalam, Nair · Kannur, Kerala',
        image: 'assets/image/riys.png',
        managedBy: 'Self',
        contactNo: '+91 9847011223',
        email: 'dhanya@gmail.com',
      ),
      date: '02 Oct',
    ),
  ];

  final List<_InboxEntry> _sent = const [
    _InboxEntry(
      profile: MatchProfileItem(
        name: 'Chandhini',
        line1: "26 Yrs, 5'2\" · Architect",
        line2: 'Malayalam, Nair · Ernakulam, Kerala',
        image: 'assets/image/riys.png',
      ),
      date: '02 Oct',
    ),
    _InboxEntry(
      profile: MatchProfileItem(
        name: 'Anushka',
        line1: "23 Yrs, 5'4\" · Software Engineer",
        line2: 'Malayalam, Nair · Thrissur, Kerala',
        image: 'assets/image/archana.png',
      ),
      date: '30 Sep',
    ),
  ];

  List<int> get _counts => [
        _received.length,
        _acceptedByHer.length + _acceptedByMe.length,
        _contactsViewed.length,
        _sent.length,
      ];

  void _declineReceived(_InboxEntry entry) => setState(() => _received.remove(entry));

  void _acceptReceived(_InboxEntry entry) {
    setState(() {
      _received.remove(entry);
      _acceptedByHer.add(entry);
    });
  }

  List<_InboxEntry> get _currentList {
    switch (_activeTab) {
      case 1:
        return _activeSubTab == 0 ? _acceptedByHer : _acceptedByMe;
      case 2:
        return _activeSubTab == 0 ? _contactsViewed : _viewedYou;
      case 3:
        return _sent;
      default:
        return _received;
    }
  }

  @override
  Widget build(BuildContext context) {
    final list = _currentList;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 10.h),
            _buildTabs(),
            if (_activeTab == 1) ...[
              SizedBox(height: 10.h),
              _buildSubTabs(
                leftLabel: 'Accepted by Her (${_acceptedByHer.length})',
                rightLabel: 'Accepted by Me (${_acceptedByMe.length})',
              ),
            ],
            SizedBox(height: 10.h,),
            Divider(),
            if (_activeTab == 2) ...[
              SizedBox(height: 10.h),
              _buildSubTabs(
                leftLabel: 'Contacts Viewed (${_contactsViewed.length})',
                rightLabel: 'Viewed you (10)',
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  _activeSubTab == 0
                      ? 'Contacts you have viewed (${_contactsViewed.length} of 800)'
                      : 'Contacts who viewed you (${_viewedYou.length} of 10)',
                  style: GoogleFonts.tasaOrbiter(fontSize: 14.sp, color: Colors.black),
                ),
              ),
            ],
            SizedBox(height: 8.h),
            Expanded(
              child: _activeTab == 0
                  ? _ReceivedSwipeDeck(
                      entries: _received,
                      onAccept: _acceptReceived,
                      onDecline: _declineReceived,
                    )
                  : list.isEmpty
                      ? Center(
                          child: Text(
                            'Nothing here yet',
                            style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: Colors.black45),
                          ),
                        )
                      : ListView.separated(
                          padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
                          itemCount: list.length,
                          separatorBuilder: (_, __) => SizedBox(height: 14.h),
                          itemBuilder: (context, index) {
                            if (_activeTab == 2) return _ContactCard(entry: list[index]);
                            return _InboxCard(entry: list[index], isSent: _activeTab == 3);
                          },
                        ),
            ),
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
            style: GoogleFonts.tasaOrbiter(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.black87),
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
            }),
            borderRadius: BorderRadius.circular(18.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? AppColors.coral : Colors.white,
                borderRadius: BorderRadius.circular(18.r),
                border: Border.all(color: selected ? AppColors.coral : const Color(0xFFE0E0E0)),
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

  Widget _buildSubTabs({required String leftLabel, required String rightLabel}) {
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
      onTap: () => setState(() => _activeSubTab = index),
      child: Container(
        padding: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: selected ? AppColors.coral : Colors.transparent, width: 2.5),
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
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/image/Vector 1265.png',),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(12.r)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/image/crown.png', width: 12.w, height: 12.w),
                          SizedBox(width: 4.w),
                          Text('Premium', style: GoogleFonts.tasaOrbiter(fontSize: 10.sp, fontWeight: FontWeight.w700, color: Color(0xFFD0B362))),
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(14.w, p.isPremium ? 30.h : 14.h, 14.w, 14.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          p.image,
                          width: 52.w,
                          height: 52.w,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 52.w,
                            height: 52.w,
                            color: AppColors.primaryLight,
                            child: Icon(Icons.person, size: 22.sp, color: AppColors.primary),
                          ),
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
                                    style: GoogleFonts.tasaOrbiter(fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.black),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Image.asset('assets/image/verified.png', width: 14.w, height: 14.w),
                              ],
                            ),
                            SizedBox(height: 3.h),
                            Text(p.line1, style: GoogleFonts.tasaOrbiter(fontSize: 12.sp, color: Colors.black87)),
                            Text(p.line2, style: GoogleFonts.tasaOrbiter(fontSize: 12.sp, color: Colors.black87)),
                          ],
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(entry.date, style: GoogleFonts.tasaOrbiter(fontSize: 12.sp, color: Colors.black38)),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 7.w),
              color: const Color(0xFFFFE2E7),
              child: Column(
                children: [
                  Text(
                    'Take the next step',
                    style: GoogleFonts.tasaOrbiter(fontSize: 12.sp, fontWeight: FontWeight.w700, color: Colors.black87),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (isSent)
                        _actionButton(
                          asset: "assets/image/remainder_container.png",
                          label: 'Remind',
                          onTap: () {},
                        )
                      else
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
                          MaterialPageRoute(builder: (_) => MessageScreen(name: p.name, image: p.image)),
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
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: Icon(icon, size: 20.sp, color: iconColor ?? Colors.black54),
                ),
          SizedBox(height: 5.h),
          Text(label, style: GoogleFonts.tasaOrbiter(fontSize: 12.sp, color: Colors.black54)),
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
                  child: Image.asset(
                    p.image,
                    width: 71.w,
                    height: 71.w,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 71.w,
                      height: 71.w,
                      color: AppColors.primaryLight,
                      child: Icon(Icons.person, size: 30.sp, color: AppColors.primary),
                    ),
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
                              style: GoogleFonts.tasaOrbiter(fontSize: 15.sp, fontWeight: FontWeight.w700, color: Colors.black87),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Image.asset('assets/image/verified.png', width: 14.w, height: 14.w),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Profile created by ${p.managedBy}',
                        style: GoogleFonts.tasaOrbiter(fontSize: 11.sp, color: Colors.black45),
                      ),
                      SizedBox(height: 12.h),
                      _contactLinkRow(icon: Icons.call_outlined, text: p.contactNo),
                      SizedBox(height: 8.h),
                      _contactLinkRow(icon: Icons.email_outlined, text: p.email),
                      SizedBox(height: 8.h),
                      _contactLinkRow(icon: Icons.sms_outlined, text: 'Send SMS'),
                    ],
                  ),
                ),
                SizedBox(width: 6.w),
                Text(entry.date, style: GoogleFonts.tasaOrbiter(fontSize: 11.sp, color: Colors.black38)),
                SizedBox(width: 4.w),
                Icon(Icons.more_vert_rounded, size: 18.sp, color: Colors.black45),
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
            style: GoogleFonts.tasaOrbiter(fontSize: 12.5.sp, color: blue, fontWeight: FontWeight.w500),
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
              Image.asset(
                p.image,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: AppColors.primaryLight,
                  child: Icon(Icons.person, size: 72.sp, color: AppColors.primary),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                    stops: const [0.5, 1.0],
                  ),
                ),
              ),
              Positioned(
                top: 16.h,
                left: 16.w,
                child: const ShortlistBadge(),
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
                            style: GoogleFonts.tasaOrbiter(fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Image.asset('assets/image/verified.png', width: 17.w, height: 17.w),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(p.line1, style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: Colors.white70)),
                    Text(p.line2, style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: Colors.white70)),
                    SizedBox(height: 5.h,),
                    Divider(color: Colors.white54,)
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
                        color:  Colors.black,
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
                        color:  Colors.black,
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
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 3))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(icon, size: 24.sp, color: iconcolor),
            Image.asset(image,width: 24.sp,height: 24.sp,color: iconcolor,),
            SizedBox(width: 8.w),
            Text(label, style: GoogleFonts.tasaOrbiter(fontSize: 14.sp, fontWeight: FontWeight.w700, color: color)),
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
  const _ReceivedSwipeDeck({
    required this.entries,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  State<_ReceivedSwipeDeck> createState() => _ReceivedSwipeDeckState();
}

class _ReceivedSwipeDeckState extends State<_ReceivedSwipeDeck> {
  Offset _drag = Offset.zero;

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
    final entry = widget.entries.first;
    setState(() => _drag = Offset.zero);
    accept ? widget.onAccept(entry) : widget.onDecline(entry);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.entries.isEmpty) {
      return Center(
        child: Text(
          'No new requests',
          style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: Colors.black45),
        ),
      );
    }

    final top = widget.entries.first;
    final next = widget.entries.length > 1 ? widget.entries[1] : null;
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
              duration: _drag == Offset.zero ? const Duration(milliseconds: 220) : Duration.zero,
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
          style: GoogleFonts.tasaOrbiter(fontSize: 20.sp, fontWeight: FontWeight.w900, color: color, letterSpacing: 1.5),
        ),
      ),
    );
  }
}
