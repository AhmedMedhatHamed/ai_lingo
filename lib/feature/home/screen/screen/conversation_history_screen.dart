import 'package:flutter/material.dart';

class ConversationHistoryScreen extends StatelessWidget {
  const ConversationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Center(
                child: Text(
                  'Conversation History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 24),

              HistoryCardItem(
                icon: Icons.coffee,
                iconColor: Colors.purple,
                title: 'Ordering Coffee',
                time: 'Today 10:24 AM',
              ),
              SizedBox(height: 14),

              HistoryCardItem(
                icon: Icons.flight,
                iconColor: Colors.purple,
                title: 'Airport Check-in',
                time: 'Yesterday 04:12 PM',
              ),
              SizedBox(height: 14),

              HistoryCardItem(
                icon: Icons.work_outline,
                iconColor: Colors.purple,
                title: 'Job Interview',
                time: 'Yesterday 11:03 AM',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryCardItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String time;
  final VoidCallback? onTap;

  const HistoryCardItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.time,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Icon(icon, color: iconColor, size: 24),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          time,
          style: TextStyle(
            fontSize: 12,
            color: Colors.blueGrey.shade400,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black),
        onTap: onTap,
      ),
    );
  }
}
