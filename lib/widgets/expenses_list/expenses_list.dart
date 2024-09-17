import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expense_Item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          onDismissed: (direction) {
            return onRemoveExpense(expenses[index]);
          },
          key: ValueKey(expenses[index]),
          child: ExpenseItem(
            expense: expenses[index],
          ),
        );
      },
    );
  }
}
