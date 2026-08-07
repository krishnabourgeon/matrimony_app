import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

class ChatMessage {
  final String text;
  final String time;
  final bool isMe;
  final bool seen;

  const ChatMessage({
    required this.text,
    required this.time,
    required this.isMe,
    this.seen = false,
  });
}

class ChatConversationScreen extends StatefulWidget {
  final String contactName;
  final String contactLocation;
  final String contactImage;

  const ChatConversationScreen({
    super.key,
    this.contactName = 'Gauri nandha',
    this.contactLocation = 'Kozhikode',
    this.contactImage = 'assets/image/archana.png',
  });

  @override
  State<ChatConversationScreen> createState() => _ChatConversationScreenState();
}

class _ChatConversationScreenState extends State<ChatConversationScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<ChatMessage> messages = const [
    ChatMessage(
      text: 'Hi Can you Check my profile? If you interested reply me.',
      time: '04:56 PM',
      isMe: true,
      seen: true,
    ),
    ChatMessage(
      text:
          'Hello, We liked your profile as well. It would be good to communicate '
          'and get to know each other better. Please feel free to contact us to '
          'take this conversation ahead.\nwarm Regards, Gauri',
      time: '02:14 PM',
      isMe: false,
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFFCEEF1),
                child: Stack(
                  children: [
                    // Decorative background pattern placeholder — swap in
                    // your love-themed background asset here if you have one.
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.4,
                        child: Icon(
                          Icons.favorite,
                          size: 400.sp,
                          color: const Color(0xFFF7D6DE),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        _buildProfileSummaryCard(),
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            children: [
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 16.h),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF6D6DD),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Text(
                                    '05 Oct 2025',
                                    style: GoogleFonts.tasaOrbiter(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                              ...messages.map(_buildBubble),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            _buildInputBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.w, 8.h, 16.w, 8.h),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).maybePop(),
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: const BoxDecoration(
                color: Color(0xFFF2F2F2),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_back, size: 18.sp, color: Colors.black87),
            ),
          ),
          SizedBox(width: 10.w),
          ClipOval(
            child: Image.asset(
              widget.contactImage,
              width: 34.w,
              height: 34.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.contactName,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  widget.contactLocation,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 10.sp,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          Image.asset('assets/image/videocam.png', width: 20.w, height: 20.w),
          SizedBox(width: 16.w),
          Image.asset('assets/image/call.png', width: 20.w, height: 20.w),
          SizedBox(width: 16.w),
          Image.asset('assets/image/more_vert.png', width: 18.w, height: 18.w),
        ],
      ),
    );
  }

  Widget _buildProfileSummaryCard() {
    return Container(
      margin: EdgeInsets.all(14.w),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(
              widget.contactImage,
              width: 56.w,
              height: 56.w,
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
                      'Swathy Mohan',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
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
                  "26 Yrs, 5'2\" · Finance Professional",
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 11.sp,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'Malayalam, Thiyya · Kozhikode, Kerala',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 11.sp,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDFF6E6),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    'This is an Accepted Member',
                    style: GoogleFonts.tasaOrbiter(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2FA766),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBubble(ChatMessage m) {
    return Align(
      alignment: m.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 14.h),
        constraints: BoxConstraints(maxWidth: 260.w),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: m.isMe ? AppColors.coral : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14.r),
            topRight: Radius.circular(14.r),
            bottomLeft: Radius.circular(m.isMe ? 14.r : 2.r),
            bottomRight: Radius.circular(m.isMe ? 2.r : 14.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              m.text,
              style: GoogleFonts.tasaOrbiter(
                fontSize: 12.sp,
                color: m.isMe ? Colors.white : Colors.black87,
                height: 1.4,
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  m.time,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 9.sp,
                    color: m.isMe ? Colors.white70 : Colors.black38,
                  ),
                ),
                if (m.isMe) ...[
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.done_all,
                    size: 12.sp,
                    color: m.seen ? Colors.lightGreenAccent : Colors.white70,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
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
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: const BoxDecoration(
              color: Color(0xFFF2F2F2),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add, size: 18.sp, color: Colors.black54),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              controller: _controller,
              style: GoogleFonts.tasaOrbiter(fontSize: 12.sp),
              decoration: InputDecoration(
                hintText: 'Type a message',
                hintStyle: GoogleFonts.tasaOrbiter(
                  fontSize: 12.sp,
                  color: Colors.black38,
                ),
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 10.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          InkWell(
            onTap: () {
              // TODO: send message via your chat API / socket and append to `messages`
            },
            child: Container(
              padding: EdgeInsets.all(11.w),
              decoration: BoxDecoration(
                color: AppColors.coral,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.send, size: 16.sp, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
