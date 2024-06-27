import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget{
Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Football',
        amount: 200,
        date: DateTime.now(),
        category: Category.leisure),

    Expense(
        title: 'Cinema',
        amount: 350,
        date: DateTime.now(),
        category: Category.leisure),

    Expense(
        title: 'Flutter Course',
        amount: 600,
        date: DateTime.now(),
        category: Category.work),

    Expense(
        title: 'KFC',
        amount: 800,
        date: DateTime.now(),
        category: Category.food),

  ];

  void _openAddExpenseoverlay(){
    showModalBottomSheet(context: context, builder: (ctx) => NewExpense()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker', style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: _openAddExpenseoverlay, icon: Icon(Icons.add, size: 25,), color: Colors.white,)
        ],
        backgroundColor: Color(0xff537895),
        elevation: 20,
      ),
      body: Column(
        children: [
          Text('Chart will be included here.', style: TextStyle(
            color: Colors.white,
          ),),
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
      backgroundColor: Color(0xff09203f)
    );
  }
}