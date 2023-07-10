import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
const uuid = Uuid();
final formatter = DateFormat.yMd();


enum Category {food,travel,leisure,work,miscellaneous,medicines}
 const categoryIcons ={
   Category.food: Icons.dining_rounded,
   Category.leisure: Icons.movie,
   Category.travel: Icons.flight,
   Category.work: Icons.work,
   Category.miscellaneous: Icons.miscellaneous_services,
   Category.medicines: Icons.local_hospital
};
class Expense{
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category

  }) : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate{
    return formatter.format(date);

  }
}

