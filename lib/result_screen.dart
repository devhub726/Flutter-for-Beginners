import 'package:flutter/material.dart';
import 'package:flutter_for_feginners/data/questions.dart';
import 'package:flutter_for_feginners/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;

  const ResultScreen({super.key, required this.chosenAnswers});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "questions_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = getSummaryData();
    var numTotalQuestions = questions.length;
    var numCurrectQuestions = summaryData.where(
      (element) {
        return element["user_answer"] == element["correct_answer"];
      },
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Your answered $numCurrectQuestions out of $numTotalQuestions questions correctly!"),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: getSummaryData()),
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
