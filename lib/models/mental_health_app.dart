import 'package:flutter/material.dart';

class MentalHealthApp {
  final String id;
  final String title;
  final String tag;
  final String description;
  final IconData icon;
  final Color primaryColor;
  final Widget targetScreen;

  MentalHealthApp({
    required this.id,
    required this.title,
    required this.tag,
    required this.description,
    required this.icon,
    required this.primaryColor,
    required this.targetScreen,
  });
}