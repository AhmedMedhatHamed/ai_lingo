import 'package:ai_lingo/feature/home/model/history_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String language;
  final String level;
  final Timestamp createdAt;
  final int currentStreak;
  final Timestamp? lastActive;
  final List<HistoryModel> history;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.language,
    required this.level,
    required this.createdAt,
    this.currentStreak = 0,
    this.lastActive,
    this.history = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'language': language,
      'level': level,
      'createdAt': createdAt,
      'currentStreak': currentStreak,
      'lastActive': lastActive,
      'history': history.map((historyModel) => historyModel.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      language: map['language'] ?? 'English',
      level: map['level'] ?? 'Beginner',
      createdAt: map['createdAt'] ?? Timestamp.now(),
      currentStreak: map['currentStreak'] ?? 0,
      lastActive: map['lastActive'],
      history: (map['history'] as List<dynamic>? ?? [])
          .map((historyMap) => HistoryModel.fromMap(historyMap))
          .toList(),
    );
  }
}
