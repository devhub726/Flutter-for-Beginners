import 'package:flutter/material.dart';
import 'package:shopping_list_app/widgets/gorcery_lists.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Groceries",
        theme: ThemeData.dark(useMaterial3: true).copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(224, 224, 224, 1),
            brightness: Brightness.dark,
            surface: Colors.grey[400],
          ),
          scaffoldBackgroundColor: Colors.grey[300],
        ),
        home: const GorceryLists());
  }
}
