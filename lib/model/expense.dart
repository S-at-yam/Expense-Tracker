import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMMMMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.food_bank_outlined,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.amount,
    required this.date,
    required this.title,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenseList});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenseList =
          allExpenses.where((expense) => expense.category == category).toList();
  final Category category;
  final List<Expense> expenseList;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenseList) {
      sum += expense.amount;
    }
    return sum;
  }
}
