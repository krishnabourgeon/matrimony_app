import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/message_screen.dart';

class MessagesListScreen extends StatefulWidget {
  const MessagesListScreen({super.key});

  @override
  State<MessagesListScreen> createState() => _MessagesListScreenState();
}

class _MessagesListScreenState extends State<MessagesListScreen> {
  final _searchCtrl = TextEditingController();
  String _query = '';

  final List<_Conversation> _conversations = const [
    _Conversation(
      name: 'Priya Sharma',
      image: 'assets/image/priya.png',
      lastMessage: "That's wonderful! Would you be open to a video call sometime this week?",
      time: '10:15 AM',
      unreadCount: 2,
      isOnline: true,
    ),
    _Conversation(
      name: 'Ananya Reddy',
      image: 'assets/image/ananya.png',
      lastMessage: 'Sounds good, talk soon!',
      time: 'Yesterday',
      unreadCount: 0,
      isOnline: false,
    ),
    _Conversation(
      name: 'Meera Nair',
      image: 'assets/image/meera.png',
      lastMessage: 'Typing…',
      time: '9:40 AM',
      unreadCount: 0,
      isOnline: true,
      isTyping: true,
    ),
    _Conversation(
      name: 'Kavya Iyer',
      image: 'assets/image/kavya.png',
      lastMessage: 'Thank you for accepting my interest 😊',
      time: 'Mon',
      unreadCount: 5,
      isOnline: false,
    ),
    _Conversation(
      name: 'Divya Menon',
      image: 'assets/image/divya.png',
      lastMessage: 'Can we connect on a call tomorrow?',
      time: 'Sun',
      unreadCount: 0,
      isOnline: false,
    ),
  ];

  List<_Conversation> get _filtered => _query.isEmpty
      ? _conversations
      : _conversations.where((c) => c.name.toLowerCase().contains(_query.toLowerCase())).toList();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _appBar(top),
          _searchBar(),
          Expanded(
            child: _filtered.isEmpty
                ? _emptyState()
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(12, 6, 12, 16),
                    itemCount: _filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 6),
                    itemBuilder: (ctx, i) => _ConversationTile(
                      conversation: _filtered[i],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MessageScreen(
                            name: _filtered[i].name,
                            image: _filtered[i].image,
                            isOnline: _filtered[i].isOnline,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _appBar(double top) => Container(
    color: AppColors.surface,
    padding: EdgeInsets.fromLTRB(20, top + 14, 20, 14),
    child: Row(
      children: [
        IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios, color: AppColors.textPrimary,size: 20,)),
        const Text(
          'Messages',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.textPrimary, letterSpacing: -0.4),
        ),
        const SizedBox(width: 10),
        Builder(builder: (context) {
          final unread = _conversations.where((c) => c.unreadCount > 0).length;
          if (unread == 0) return const SizedBox.shrink();
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
            decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(20)),
            child: Text(
              '$unread new',
              style: const TextStyle(color: AppColors.primary, fontSize: 10.5, fontWeight: FontWeight.w800),
            ),
          );
        }),
        // const Spacer(),
        // Container(
        //   width: 38,
        //   height: 38,
        //   decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(12)),
        //   child: const Icon(Icons.edit_square, size: 18, color: AppColors.textSecondary),
        // ),
      ],
    ),
  );

  Widget _searchBar() => Padding(
    padding: const EdgeInsets.fromLTRB(16, 4, 16, 10),
    child: Container(
      decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(AppColors.r16)),
      child: TextField(
        controller: _searchCtrl,
        onChanged: (v) => setState(() => _query = v),
        style: const TextStyle(fontSize: 13.5, color: AppColors.textPrimary),
        decoration: const InputDecoration(
          hintText: 'Search conversations…',
          hintStyle: TextStyle(color: AppColors.textHint, fontSize: 13.5),
          prefixIcon: Icon(Icons.search_rounded, color: AppColors.textHint, size: 20),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 13),
        ),
      ),
    ),
  );

  Widget _emptyState() => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle),
          child: const Icon(Icons.chat_bubble_outline_rounded, color: AppColors.primary, size: 32),
        ),
        const SizedBox(height: 14),
        const Text('No conversations found', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
        const SizedBox(height: 4),
        const Text('Try a different name', style: TextStyle(fontSize: 12, color: AppColors.textHint)),
      ],
    ),
  );
}

class _Conversation {
  final String name;
  final String image;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final bool isOnline;
  final bool isTyping;

  const _Conversation({
    required this.name,
    required this.image,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    required this.isOnline,
    this.isTyping = false,
  });
}

class _ConversationTile extends StatelessWidget {
  final _Conversation conversation;
  final VoidCallback onTap;
  const _ConversationTile({required this.conversation, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final unread = conversation.unreadCount > 0;
    return InkWell(
      borderRadius: BorderRadius.circular(AppColors.r16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppColors.r16),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.border, width: 1.5)),
                  child: ClipOval(
                    child: Image.asset(
                      conversation.image,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: AppColors.primaryLight,
                        child: const Icon(Icons.person, color: AppColors.primary, size: 26),
                      ),
                    ),
                  ),
                ),
                if (conversation.isOnline)
                  Positioned(
                    right: 1,
                    bottom: 1,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.surface, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          conversation.name,
                          style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        conversation.time,
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: unread ? FontWeight.w700 : FontWeight.w500,
                          color: unread ? AppColors.primary : AppColors.textHint,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          conversation.lastMessage,
                          style: TextStyle(
                            fontSize: 12,
                            color: conversation.isTyping
                                ? AppColors.success
                                : (unread ? AppColors.textPrimary : AppColors.textHint),
                            fontStyle: conversation.isTyping ? FontStyle.italic : FontStyle.normal,
                            fontWeight: unread ? FontWeight.w600 : FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (unread) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            '${conversation.unreadCount}',
                            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
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
}