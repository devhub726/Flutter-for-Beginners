import 'package:flutter/material.dart';
import 'package:flutter_for_feginners/questions_screen.dart';
import 'package:flutter_for_feginners/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: activeScreen == "start-screen"
            ? StartScreen(switchScreen)
            : const QuestionsScreen(),
      ),
    );
  }
}
