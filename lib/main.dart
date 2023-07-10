import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:google_fonts/google_fonts.dart';
var kColorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(200, 112, 39, 195),
);
var kDarkColorScheme =ColorScheme.fromSeed(
  brightness: Brightness.dark,
    seedColor: Colors.black);

void main(){
  runApp( MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true ,
      colorScheme: kDarkColorScheme,
      cardTheme: CardTheme().copyWith(
        color: kDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.all(8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style:
      ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer
      ),
      ),
        dropdownMenuTheme: DropdownMenuThemeData().copyWith(
            textStyle: TextStyle(fontSize: 18,
                backgroundColor: kDarkColorScheme.primaryContainer,
               )
        )
    ),
    theme:ThemeData().copyWith(
        useMaterial3: true,
      colorScheme:kColorScheme,
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      cardTheme: CardTheme().copyWith(
        surfaceTintColor: Colors.deepPurpleAccent,
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.all(8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style:
          ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer
          ),
      ),
      // textTheme: ThemeData().textTheme.copyWith(
      //   titleLarge: TextStyle().copyWith(
      //     color: Color.fromARGB(200, 64, 8, 119),
      //     fontSize: 16,
      //   ),
      // ),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: GoogleFonts.lato().copyWith(
          color: Color.fromARGB(200, 64, 8, 119),
          fontSize: 16,
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData().copyWith(
        textStyle: TextStyle(fontSize: 18,
          color: kDarkColorScheme.secondaryContainer,)
      )
    ),

    themeMode: ThemeMode.system ,
    home:Expenses())
  );
}