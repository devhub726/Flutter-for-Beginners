import 'package:flutter/material.dart';
import 'package:shopping_list_app/widgets/grocery_lists.dart';
import 'theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Groceries",
      theme: lightMode,
      home: const GroceryLists(),
    );
  }
}
