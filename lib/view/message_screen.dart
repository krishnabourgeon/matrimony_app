import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

class MessageScreen extends StatefulWidget {
  final String name;
  final String image;
  final bool isOnline;

  const MessageScreen({
    super.key,
    this.name = 'Priya Sharma',
    this.image = 'assets/image/priya.png',
    this.isOnline = true,
  });

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final _inputCtrl = TextEditingController();
  final _scrollCtrl = ScrollController();

  final List<_ChatMessage> _messages = [
    _ChatMessage(text: "Hi! I saw your profile and really liked it 😊", isMe: false, time: "10:02 AM"),
    _ChatMessage(text: "Hi Priya! Thank you, I liked yours too", isMe: true, time: "10:05 AM"),
    _ChatMessage(text: "That's great to hear! What do you do for work?", isMe: false, time: "10:06 AM"),
    _ChatMessage(text: "I'm a software engineer at a startup in Bangalore. What about you?", isMe: true, time: "10:09 AM"),
    _ChatMessage(text: "I'm a doctor, currently doing my residency in Chennai", isMe: false, time: "10:11 AM"),
    _ChatMessage(text: "That's wonderful! Would you be open to a video call sometime this week?", isMe: true, time: "10:15 AM"),
  ];

  void _send() {
    final text = _inputCtrl.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(_ChatMessage(text: text, isMe: true, time: 'Now'));
      _inputCtrl.clear();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollCtrl.animateTo(
        _scrollCtrl.position.maxScrollExtent + 80,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _inputCtrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _appBar(context, top),
          Expanded(
            child: ListView(
              controller: _scrollCtrl,
              padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
              children: [
                const _DateDivider(label: 'Today'),
                for (final m in _messages) _MessageBubble(message: m, avatar: widget.image),
              ],
            ),
          ),
          _inputBar(context),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context, double top) => Container(
    color: AppColors.surface,
    padding: EdgeInsets.fromLTRB(12, top + 10, 16, 12),
    child: Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.arrow_back_ios_new_rounded, size: 16, color: AppColors.textSecondary),
          ),
        ),
        const SizedBox(width: 10),
        Stack(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.roseGold, width: 1.6)),
              child: ClipOval(
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: AppColors.primaryLight,
                    child: const Icon(Icons.person, color: AppColors.primary, size: 22),
                  ),
                ),
              ),
            ),
            if (widget.isOnline)
              Positioned(
                right: 1,
                bottom: 1,
                child: Container(
                  width: 11,
                  height: 11,
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.surface, width: 2),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.name,
                style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.w800, color: AppColors.textPrimary, letterSpacing: -0.2),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                widget.isOnline ? 'Online' : 'Last seen recently',
                style: TextStyle(
                  fontSize: 10.5,
                  color: widget.isOnline ? AppColors.success : AppColors.textHint,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        _AppBarIconBtn(icon: Icons.call_outlined, onTap: () {}),
        const SizedBox(width: 8),
        _AppBarIconBtn(icon: Icons.more_vert_rounded, onTap: () {}),
      ],
    ),
  );

  Widget _inputBar(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(10, 10, 10, MediaQuery.of(context).padding.bottom + 10),
    decoration: BoxDecoration(
      color: AppColors.surface,
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, -3))],
    ),
    child: Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(12)),
          child: const Icon(Icons.add_rounded, color: AppColors.textSecondary, size: 20),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(AppColors.r24)),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _inputCtrl,
                    minLines: 1,
                    maxLines: 4,
                    style: const TextStyle(fontSize: 13.5, color: AppColors.textPrimary),
                    decoration: const InputDecoration(
                      hintText: 'Type a message…',
                      hintStyle: TextStyle(color: AppColors.textHint, fontSize: 13.5),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                    ),
                  ),
                ),
                const Icon(Icons.emoji_emotions_outlined, color: AppColors.textHint, size: 20),
                const SizedBox(width: 6),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: _send,
          child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(gradient: AppColors.gradPrimary, shape: BoxShape.circle, boxShadow: AppColors.shadowPrimary),
            child: const Icon(Icons.send_rounded, color: Colors.white, size: 18),
          ),
        ),
      ],
    ),
  );
}

class _ChatMessage {
  final String text;
  final bool isMe;
  final String time;
  const _ChatMessage({required this.text, required this.isMe, required this.time});
}

class _MessageBubble extends StatelessWidget {
  final _ChatMessage message;
  final String avatar;
  const _MessageBubble({required this.message, required this.avatar});

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe) ...[
            Container(
              width: 26,
              height: 26,
              margin: const EdgeInsets.only(right: 6),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: ClipOval(
                child: Image.asset(
                  avatar,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: AppColors.primaryLight,
                    child: const Icon(Icons.person, color: AppColors.primary, size: 14),
                  ),
                ),
              ),
            ),
          ],
          Flexible(
            child: Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.72),
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 8),
              decoration: BoxDecoration(
                gradient: isMe ? AppColors.gradPrimary : null,
                color: isMe ? null : AppColors.surface,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(isMe ? 16 : 4),
                  bottomRight: Radius.circular(isMe ? 4 : 16),
                ),
                border: isMe ? null : Border.all(color: AppColors.border),
                boxShadow: isMe ? null : AppColors.shadowXs,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message.text,
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.4,
                      color: isMe ? Colors.white : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message.time,
                    style: TextStyle(
                      fontSize: 9.5,
                      color: isMe ? Colors.white.withOpacity(0.75) : AppColors.textHint,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DateDivider extends StatelessWidget {
  final String label;
  const _DateDivider({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(20)),
          child: Text(
            label,
            style: const TextStyle(fontSize: 10.5, color: AppColors.textHint, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class _AppBarIconBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _AppBarIconBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(11)),
      child: Icon(icon, size: 17, color: AppColors.textSecondary),
    ),
  );
}