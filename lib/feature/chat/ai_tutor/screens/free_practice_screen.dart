
import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FreePracticeScreen extends StatefulWidget {
  const FreePracticeScreen({super.key});

  @override
  State<FreePracticeScreen> createState() => _FreePracticeScreenState();
}

class _FreePracticeScreenState extends State<FreePracticeScreen> {

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _messages = [
    {
      'text': 'Hi Ahmed! 👋 What would you like to talk about today?',
      'isUser': false,
    },
    {
      'text': "I'd love to improve my English speaking skills.",
      'isUser': true,
    },
    {
      'text': "That's great! Let's practice together. Choose a topic or ask me anything.",
      'isUser': false,
    },
  ];

  final List<String> _suggestions = [
    'Tell me a fun fact',
    'Teach me new idioms',
  ];

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage([String? suggestion]) {
    final text = (suggestion ?? _controller.text).trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({'text': text, 'isUser': true});
      _controller.clear();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.chatPageColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 21,
                backgroundColor: const Color(0xFFE8EEFF),
                child: Icon(
                  Icons.smart_toy_outlined,
                  color: AppColors.primaryColor,
                  size: 25,
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AI Tutor',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF172033),
                    ),
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: Color(0xFF22C55E),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Online',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Color(0xFF334155),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 13,
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.forum_outlined,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Free Practice',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF334155),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.auto_awesome,
                    color: Color(0xFFF59E0B),
                    size: 19,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Open topic',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFE2E8F0)),
            Expanded(
              child: ListView(
                controller: _scrollController,
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                children: [
                  ..._messages.map(
                        (message) => _ChatBubble(
                      text: message['text'] as String,
                      isUser: message['isUser'] as bool,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'TRY ASKING',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _suggestions.map((suggestion) {
                      return ActionChip(
                        onPressed: () => _sendMessage(suggestion),
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                          color: Color(0xFFBFDBFE),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        avatar: const Icon(
                          Icons.auto_awesome,
                          size: 16,
                          color: AppColors.primaryColor,
                        ),
                        label: Text(
                          suggestion,
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xFFE2E8F0)),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      minLines: 1,
                      maxLines: 4,
                      onSubmitted: (_) => _sendMessage(),
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        hintStyle: const TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 13,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF1F5F9),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Material(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(24),
                    child: InkWell(
                      onTap: _sendMessage,
                      borderRadius: BorderRadius.circular(24),
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
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

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({
    required this.text,
    required this.isUser,
  });

  final String text;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        mainAxisAlignment:
        isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) ...[
            const CircleAvatar(
              radius: 17,
              backgroundColor: Color(0xFFE8EEFF),
              child: Icon(
                Icons.smart_toy_outlined,
                color: Color(0xFF1D4ED8),
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.74,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: isUser ? const Color(0xFF1D4ED8) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(18),
                  topRight: const Radius.circular(18),
                  bottomLeft: Radius.circular(isUser ? 18 : 4),
                  bottomRight: Radius.circular(isUser ? 4 : 18),
                ),
                border: isUser
                    ? null
                    : Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: isUser ? Colors.white : const Color(0xFF334155),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ),
          if (isUser) const SizedBox(width: 8),
        ],
      ),
    );
  }
}
