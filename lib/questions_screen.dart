import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_for_feginners/customwidget/answer_button.dart';
import 'package:flutter_for_feginners/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionsIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionsIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionsIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.grey[700],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.shuffledAnswers.map(
              (answer) {
                return AnswerButton(
                    onPressed: () async {
                      answerQuestion(answer);
                      if (kDebugMode) {
                        print(answer);
                      }
                    },
                    answertext: answer);
              },
            ),
          ],
        ),
      ),
    );
  }
}
