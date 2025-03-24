import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // _NewExpenseState({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            maxLength: 50,
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Row(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  //keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
