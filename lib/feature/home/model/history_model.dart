import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryModel {
  final String title;
  final String icon;
  final Timestamp createdAt;
  final bool isCompleted;

  HistoryModel({
    required this.title,
    required this.icon,
    required this.createdAt,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'icon': icon,
      'createdAt': createdAt,
      'isCompleted': isCompleted,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> json) {
    return HistoryModel(
      title: json['title'],
      icon: json['icon'],
      createdAt: json['createdAt'],
      isCompleted: json['isCompleted'],
    );
  }
}
