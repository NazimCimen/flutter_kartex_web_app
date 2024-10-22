import 'package:flutter/material.dart';

@immutable
final class FeatureItem {
  final IconData icon;
  final String text;

  const FeatureItem({
    required this.icon,
    required this.text,
  });
}
