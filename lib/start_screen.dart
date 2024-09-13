import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 250,
            color: const Color.fromARGB(229, 131, 130, 130),
          ),
          const SizedBox(
            height: 80,
          ),
          Text("Learn Flutter the fun way!",
              style: GoogleFonts.lato(
                color: Colors.grey[700],
                fontSize: 20,
              )),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.grey[700],
              elevation: 10,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            icon: const Icon(Icons.arrow_right_sharp),
            label: const Text("Start Quiz"),
          )
        ],
      ),
    );
  }
}
