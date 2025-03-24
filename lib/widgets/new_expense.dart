import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense) onAddExpense;
  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // _NewExpenseState({super.key});
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  var _selectedCategory = Category.food;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _selectDate() async {
    final curDate = DateTime.now();
    final firstDate = DateTime(curDate.year - 1, curDate.month, curDate.day);

    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: curDate,
      initialDate: curDate,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _saveExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    bool isTitleEmpty = _titleController.text.trim().isEmpty;
    bool isAmountInvalid = enteredAmount == null || enteredAmount <= 0;

    if (isTitleEmpty || isAmountInvalid || _selectedDate == null) {
      showDialog(
        context: context,
        builder:
            (ctx) => AlertDialog(
              title: Text('Invalid input', style: TextStyle(color: Colors.red)),
              content: Text('Please enter a valid title, amount and date.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text('Okay'),
                ),
              ],
            ),
      );
      return;
    }
    widget.onAddExpense(
      Expense(
        amount: enteredAmount,
        date: _selectedDate!,
        title: _titleController.text,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
            maxLength: 50,
          ),
          //const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    prefixText: '\$ ',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No Date Selected'
                        : formatter.format(_selectedDate!),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: _selectDate,
                    icon: Icon(Icons.calendar_month, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items:
                    Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _saveExpenseData,

                child: Text(
                  'Save Expenses',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
