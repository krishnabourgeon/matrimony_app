import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/chat_detail_screen.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

class ChatPreviewItem {
  final String name;
  final String message;
  final String date;
  final String image;
  final bool isVerified;

  const ChatPreviewItem({
    required this.name,
    required this.message,
    required this.date,
    required this.image,
    this.isVerified = false,
  });
}

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  int _activeTab = 0;
  int _navIndex = 3; // Chat tab active

  final List<String> tabs = const ['All chats', 'Unread', 'Calls'];

  // Recently active people shown as circular avatars at the top.
  final List<ChatPreviewItem> recentlyActive = const [
    ChatPreviewItem(
      name: 'Sandra Ra...',
      message: '',
      date: '',
      image: 'assets/image/archana.png',
    ),
    ChatPreviewItem(
      name: 'Geethu',
      message: '',
      date: '',
      image: 'assets/image/priya.png',
    ),
    ChatPreviewItem(
      name: 'Keerthi Pra...',
      message: '',
      date: '',
      image: 'assets/image/riys.png',
    ),
    ChatPreviewItem(
      name: 'Nikhitha',
      message: '',
      date: '',
      image: 'assets/image/archana.png',
    ),
    ChatPreviewItem(
      name: 'Sandr...',
      message: '',
      date: '',
      image: 'assets/image/priya.png',
    ),
  ];

  final List<ChatPreviewItem> chats = const [
    ChatPreviewItem(
      name: 'Gauri nandha',
      message: 'Hello, We liked your profile as well. It Wo...',
      date: '12 Sep',
      image: 'assets/image/archana.png',
    ),
    ChatPreviewItem(
      name: 'Saranya',
      message: 'Hello, We liked your profile as well. It Wo...',
      date: '05 Oct',
      image: 'assets/image/priya.png',
      isVerified: true,
    ),
    ChatPreviewItem(
      name: 'Gauri nandha',
      message: 'Hello, We liked your profile as well. It Wo...',
      date: '14 Aug',
      image: 'assets/image/riys.png',
    ),
    ChatPreviewItem(
      name: 'Nithya Das',
      message: 'Hello, We liked your profile as well. It Wo...',
      date: '22 Aug',
      image: 'assets/image/archana.png',
      isVerified: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 12.h),
            _buildTabs(),
            SizedBox(height: 14.h),
            _buildRecentlyActiveRow(),
            SizedBox(height: 4.h),
            const Divider(height: 1, color: Color(0xFFF0F0F0)),
            Expanded(
              child: ListView.separated(
                itemCount: chats.length,
                separatorBuilder: (_, __) =>
                    const Divider(height: 1, color: Color(0xFFF5F5F5)),
                itemBuilder: (context, index) =>
                    _ChatListTile(item: chats[index]),
              ),
            ),
          ],
        ),
      ),
      //bottomNavigationBar: _buildBottomNav(),
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
            'Chat',
            style: GoogleFonts.tasaOrbiter(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: tabs.asMap().entries.map((e) {
          final selected = _activeTab == e.key;
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: InkWell(
              onTap: () => setState(() => _activeTab = e.key),
              borderRadius: BorderRadius.circular(18.r),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: selected ? AppColors.coral : const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Text(
                  e.value,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: selected ? Colors.white : Colors.black54,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRecentlyActiveRow() {
    return SizedBox(
      height: 76.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: recentlyActive.length,
        separatorBuilder: (_, __) => SizedBox(width: 14.w),
        itemBuilder: (context, index) {
          final p = recentlyActive[index];
          return SizedBox(
            width: 56.w,
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(
                    p.image,
                    width: 52.w,
                    height: 52.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  p.name,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNav() {
    final items = [
      (Icons.home_filled, 'Home'),
      (Icons.favorite_border, 'Matches'),
      (Icons.mail_outline, 'Inbox'),
      (Icons.chat_bubble, 'Chat'),
    ];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.asMap().entries.map((e) {
          final selected = _navIndex == e.key;
          final color = selected ? AppColors.coral : Colors.black38;
          return InkWell(
            onTap: () => setState(() => _navIndex = e.key),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(e.value.$1, size: 22.sp, color: color),
                SizedBox(height: 3.h),
                Text(
                  e.value.$2,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _ChatListTile extends StatelessWidget {
  final ChatPreviewItem item;

  const _ChatListTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatConversationScreen()),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                item.image,
                width: 48.w,
                height: 48.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        item.name,
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      if (item.isVerified) ...[
                        SizedBox(width: 5.w),
                        Image.asset(
                          'assets/image/verified.png',
                          width: 14.w,
                          height: 14.w,
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    item.message,
                    style: GoogleFonts.tasaOrbiter(
                      fontSize: 11.sp,
                      color: Colors.black54,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              item.date,
              style: GoogleFonts.tasaOrbiter(
                fontSize: 10.sp,
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
