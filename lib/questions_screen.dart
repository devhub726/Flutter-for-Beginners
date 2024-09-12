import 'package:flutter/material.dart';
import 'package:flutter_for_feginners/customwidget/answer_button.dart';
import 'package:flutter_for_feginners/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentQuestion.text,
            style: TextStyle(color: Colors.grey[700]),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(
              onPressed: () {}, answertext: currentQuestion.answers[0]),
          AnswerButton(
              onPressed: () {}, answertext: currentQuestion.answers[1]),
          AnswerButton(
              onPressed: () {}, answertext: currentQuestion.answers[2]),
          AnswerButton(
              onPressed: () {}, answertext: currentQuestion.answers[3]),
        ],
      ),
    );
  }
}
