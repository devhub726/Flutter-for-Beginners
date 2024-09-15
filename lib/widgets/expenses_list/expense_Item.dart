import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;

  const ExpenseItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 4,
            ),
            // 12.4323 => 12.43
            Row(
              children: [
                Text("\u{20b9}${expense.amount.toStringAsFixed(2)}"),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.alarm),
                    const SizedBox(width: 8),
                    Text(expense.date.toString()),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
