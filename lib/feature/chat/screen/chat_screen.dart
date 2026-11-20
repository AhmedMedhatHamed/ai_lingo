import 'package:ai_lingo/feature/home/cubit/home_cubit.dart';
import 'package:ai_lingo/feature/home/model/history_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ai_lingo/feature/chat/ai_tutor/screens/free_practice_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().addToHistory(
      HistoryModel(
        title: 'Free Practice',
        icon: 'chat',
        createdAt: Timestamp.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const FreePracticeScreen();
  }
}
