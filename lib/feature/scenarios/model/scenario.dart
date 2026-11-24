import 'package:flutter/material.dart';

class Scenario {
  final String title;
  final String description;
  final String icon;
  final String level;

  Scenario({
    required this.title,
    required this.description,
    required this.icon,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'icon': icon,
      'level': level,
    };
  }

  factory Scenario.fromMap(Map<String, dynamic> json) {
    return Scenario(
      title: json['title'],
      description: json['description'],
      icon: json['icon'],
      level: json['level'],
    );
  }
}
