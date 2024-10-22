import 'package:flutter/material.dart';

@immutable
final class Product {
  const Product({
    required this.imagePath,
    required this.name,
    required this.description,
  });
  final String imagePath;
  final String name;
  final String description;
}
