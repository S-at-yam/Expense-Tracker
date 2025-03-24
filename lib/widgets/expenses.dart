import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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

  void addNewExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  void _overlayScreen() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: addNewExpense),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker App'),
        actions: [
          IconButton(
            onPressed: () {
              _overlayScreen();
            },
            icon: Icon(Icons.add),
          ),
        ],
        //backgroundColor: const Color.fromARGB(226, 114, 12, 4),
      ),
      body: Column(
        children: [
          Text('Chart Details'),
          const SizedBox(height: 5),

          Expanded(
            child: ExpenseList(
              expenses: _registeredExpenses,
              onRemoveExpense: removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
