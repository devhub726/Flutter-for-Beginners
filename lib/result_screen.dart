import 'package:flutter/material.dart';
import 'package:flutter_for_feginners/data/questions.dart';
import 'package:flutter_for_feginners/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;

  const ResultScreen({super.key, required this.chosenAnswers});

  List<Map<String, Object>> get summaryData {
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
    var numTotalQuestions = questions.length;
    var numCurrectQuestions = summaryData
        .where((element) => element["user_answer"] == element["correct_answer"])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your answered $numCurrectQuestions out of $numTotalQuestions questions correctly!",
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Restart Quiz!",
                  style: GoogleFonts.lato(
                    color: Colors.grey[700],
                    fontSize: 20,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
