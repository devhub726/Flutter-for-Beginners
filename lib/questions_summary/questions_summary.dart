import 'package:flutter/material.dart';
import 'package:flutter_for_feginners/questions_summary/summary_item.dart';

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
            return SummaryItem(data);
          },
        ).toList()),
      ),
    );
  }
}
