import 'package:flutter/material.dart';

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
          surface: Colors.grey[700],
        ),
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      home: ...,
    );
  }
}