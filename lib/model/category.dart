import 'package:flutter/material.dart';

enum Categories {
  dairy,
  fruit,
  frozenFoods,
  vegetables,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other
}

class Category {
  final String title;
  final Color color;
  const Category({
    required this.title,
    required this.color,
  });
}
