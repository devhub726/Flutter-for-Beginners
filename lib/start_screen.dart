import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 250,
            color: Colors.grey[900],
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            "Learn Flutter the fun way!",
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(

              foregroundColor: Colors.grey[700],
              // backgroundColor: Colors.grey[900],
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
