import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:google_fonts/google_fonts.dart';
import 'expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});
  @override
  State<Expenses> createState(){
    return _ExpensesState();
  }
}
class _ExpensesState extends State<Expenses>{
  final List<Expense> _registeredExpenses = [];

  void addExpenseOverlay(){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => NewExpense(onAddExpense: AddExpense,)
    );
  }
  void AddExpense(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    }
    );
  }
  void RemoveExpense(Expense expense){
    final expenseIndex= _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Expense Deleted'),
            duration: Duration(seconds: 10),
            action: SnackBarAction(
              label: 'undo',
              onPressed: () => setState(() {
                _registeredExpenses.insert(expenseIndex,expense);
              }),
            ),

        ));
  }


  @override
  Widget build(context){
    Widget mainContent=  Center(
      child: Text('No Expenses Found',style: GoogleFonts.lato(
          fontSize: 20
      )),
    );
    if (_registeredExpenses.isNotEmpty){
      mainContent=ExpensesList(
          expenses: _registeredExpenses,
          onRemoveExpense: RemoveExpense);
    }
    return  Scaffold(

      appBar: AppBar(
          title: Text('Expense Tracker',style: GoogleFonts.lato(
            fontSize: 25,
          ),
          ),
      actions: [
        IconButton(
            onPressed: addExpenseOverlay,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,)
        )
      ]
      ),

      body: Column(

        children: [
          const SizedBox(height: 10,),
          Expanded(
            child:mainContent
          )
      ],

      ),
    );
  }

}
