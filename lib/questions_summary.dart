import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map(
          (data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.only(right: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: data["user_answer"] == data["correct_answer"]
                            ? Colors.white
                            : Colors.grey[500],
                        shape: BoxShape.circle),
                    child: Text(
                      ((data["questions_index"] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                        fontSize: 17,
                      ),
                    )),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data["question"] as String,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data["user_answer"] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 241, 100, 100),
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        data["correct_answer"] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 85, 139, 45),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ).toList()),
      ),
    );
  }
}
