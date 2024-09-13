import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answertext;
  final VoidCallback onPressed;

  const AnswerButton(
      {super.key, required this.onPressed, required this.answertext});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey[700],
        ),
        child: Text(
          answertext,
          textAlign: TextAlign.center,
        ));
  }
}
