import 'package:flutter/material.dart';
import 'package:flutter_for_feginners/data/questions.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;

  const ResultScreen({super.key, required this.chosenAnswers});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "questions_index": i,
        "question": questions[i].text,
        "answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Your answered X out of Y questions correctly!"),
            const SizedBox(
              height: 30,
            ),
            const Text("List of Answers and questions...."),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text("Restart Quiz!"))
          ],
        ),
      ),
    );
  }
}
