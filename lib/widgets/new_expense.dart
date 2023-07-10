
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:google_fonts/google_fonts.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key,required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState(){
    return _NewExpenseState();
}
}
class _NewExpenseState extends State<NewExpense> {
   final SaveTitle = TextEditingController();
   final SaveAmount = TextEditingController();
   DateTime? SelectedDate;
   Category _selectedCategory = Category.leisure;

   void _SubmitExpenseData(){
     final enteredAmount= double.tryParse(SaveAmount.text);
     final amountInvalid = enteredAmount == null || enteredAmount<=0;
     if(SaveTitle.text.trim().isEmpty ||
         amountInvalid ||
         SelectedDate == null){
       showDialog(context: context,
           builder: (context)=> AlertDialog(
             title: Text("Invalid Input"),
             content: Text('please enter correct name,amount and date'),
             actions: [
               TextButton(
                   onPressed: ()=> Navigator.pop(context),
                   child: Text('Cancel'))
             ],
           ),
       );
       return ;
     }
     widget.onAddExpense(
         Expense(
             title: SaveTitle.text,
             amount: enteredAmount,
             date: SelectedDate!,
             category: _selectedCategory));
     Navigator.pop(context);
   }




   void SetDate() async{
     final now=DateTime.now();
     final firstDate=DateTime(now.year-1,now.month,now.day);
     final lastDate= DateTime(now.year+1,now.month,now.day);
     final pickedDate= await showDatePicker(
         context: context,
         initialDate: now,
         firstDate: firstDate,
         lastDate: lastDate);
     setState(() {
       SelectedDate=pickedDate;
     });
   }




   @override
  void dispose() {
    SaveTitle.dispose;
    SaveAmount.dispose();
    super.dispose();
  }
  @override
  Widget build(context){
    return  Padding(
      padding: const EdgeInsets.fromLTRB(10,50,10,50),
      child: Column(children: [
        TextField(controller: SaveTitle,
          keyboardType: TextInputType.text,
          decoration:
        InputDecoration(label:
        Text('Name Of Expense',
          style: GoogleFonts.lato(
            fontSize: 20
          ),),
        ),
          maxLength: 200,
        ),
        Row(children: [
          Expanded(
            child: TextField(
               controller: SaveAmount,
                  keyboardType: TextInputType.number,
                    style: GoogleFonts.lato(
                        fontSize: 20
                    ),
                         decoration:
                           InputDecoration(prefixText: '\ Rs.',label:
                          Text('Amount',
                          style: GoogleFonts.lato(
                              fontSize: 15
                          )),
                    ),
            maxLength: 100,
                ),
             ),
          const SizedBox(width: 15,),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

            Text(SelectedDate== null?
            'No Date Selected':
            formatter.format(SelectedDate!),
                style: GoogleFonts.lato(
                    fontSize: 15
                )),
            IconButton(
                onPressed: SetDate,
                icon: Icon(Icons.calendar_month_outlined)),

          ],)
          ]
        ),
       Row(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
         const SizedBox(width: 20,),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             DropdownButton(
               dropdownColor: Color.fromARGB(225, 139, 113, 211),
               value: _selectedCategory,focusColor: Colors.deepPurpleAccent,
               items: Category.values.map(
                     (category)=>DropdownMenuItem(
                   value: category,
                   child: Text(category.name.toUpperCase(),
                     style: TextStyle(color: Colors.black),
                   ),
                 ),
               ).toList(),
               onChanged: (value){
                 if (value == null){
                   return;
                 }
                 setState(() {
                   _selectedCategory = value;
                 });
               },
               style: TextStyle(
                   fontSize: 18),
             ),
           ],
         ),
       ],),
        SizedBox(height: 10,),
        Row(children: [
          TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('Cancel',style: GoogleFonts.lato(
                  fontSize: 15
              ),)),
          ElevatedButton(
              onPressed: _SubmitExpenseData,
              child: Text('Save Expense',style: GoogleFonts.lato(
                  fontSize: 15
              ),
              ),
          )
        ],)
      ],
      ),
    );
  }
}