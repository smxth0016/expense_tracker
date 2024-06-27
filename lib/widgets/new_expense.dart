import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart' as expense;
import '../models/expense.dart';


final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget{
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
 final _titleController = TextEditingController();
 final _amountController = TextEditingController();
 DateTime? _selectedDate;

 void _presentDatePicker() async{
   final now = DateTime.now();
   final firstDate = DateTime(now.year - 1, now.month, now.day); 
   final pickedDate = await showDatePicker(context: context,
       initialDate: now,
       firstDate: firstDate,
       lastDate: now
   );
   setState(() {
     _selectedDate = pickedDate;
   });
 }

 @override
  void dispose() {
   _titleController.dispose();
   _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            controller: _titleController,
            decoration: InputDecoration(
              label: Text('Expense Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.currency_rupee_rounded, size: 19,),
                    label: Text('Amount'),
                  ),
                ),
              ),
              SizedBox(width: 16,),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null ? 'No date selected' : formatter.format(_selectedDate!)),
                    IconButton(onPressed: _presentDatePicker, icon: Icon(Icons.calendar_month_rounded))
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(items: expense.Category.values.map((category) => DropdownMenuItem(
                  value: category,
                  child: Text(category.name.toUpperCase(),))).toList() , onChanged:(value){

              }),
              ElevatedButton(onPressed: (){
                print(_titleController.text);
                print(_amountController.text);
              }, child: Text('Save Expense', style: TextStyle(color: Colors.green.shade400),)),
              SizedBox(width: 15),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Cancel', style: TextStyle(color: Colors.red.shade400),))
            ],
          ),
        ],
      ),
    );
  }
}