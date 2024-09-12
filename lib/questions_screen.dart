import 'package:flutter/material.dart';
import 'package:flutter_for_feginners/customwidget/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "The Question.....",
            style: TextStyle(color: Colors.grey[700]),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(onPressed: () {}, answertext: "Answer 1"),
          AnswerButton(onPressed: () {}, answertext: "Answer 2"),
          AnswerButton(onPressed: () {}, answertext: "Answer 3"),
        ],
      ),
    );
  }
}
