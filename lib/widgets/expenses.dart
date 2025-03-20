import 'package:expense_tracker/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      amount: 500,
      date: DateTime.now(),
      title: 'Flutter Course',
      category: Category.work,
    ),
    Expense(
      amount: 250,
      date: DateTime.now(),
      title: 'Movie',
      category: Category.leisure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker App'),
        backgroundColor: const Color.fromARGB(226, 114, 12, 4),
      ),
      body: Column(
        children: [
          Text('Chart Details'),
          const SizedBox(height: 5),

          Expanded(child: ExpenseList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
