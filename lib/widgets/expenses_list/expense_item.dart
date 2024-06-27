import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem(this.expense, {super.key} );

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40.0,
          vertical: 36.0),
          child: Column(
            children: [
              Text(expense.title),
              SizedBox(height: 5,),
              Row(
                children: [
                  Icon(Icons.currency_rupee_rounded, size: 14,),
                  Text(expense.amount.toStringAsFixed(2)),
                  Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcon[expense.category], size: 22,),
                      SizedBox(width: 12,),
                      Text(expense.formattedDate),
                    ],
                  )
                ],
              )

            ],
          )),
      color: Color(0xffc1dfc4),
      margin: EdgeInsets.all(9.0),
      elevation: 11,
      shadowColor: Color(0xffc1dfc4),
      );
  }

}