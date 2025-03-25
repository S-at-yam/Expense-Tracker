import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);
var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);
void main() {
  runApp(
    MaterialApp(
      home: Expenses(),
      darkTheme: ThemeData().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: CardThemeData().copyWith(
          //color: kColorScheme.onSurface,
          color: kDarkColorScheme.onSecondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.onPrimary,
            foregroundColor: kDarkColorScheme.onSecondary,
          ),
        ),
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.onPrimaryContainer,
          foregroundColor: kDarkColorScheme.primaryContainer,
          //titleTextStyle: TextStyle(color: Colors.white),
          //actionsIconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: TextTheme().copyWith(
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: kDarkColorScheme.onSurfaceVariant,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
          titleTextStyle: TextStyle(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
        ),
        cardTheme: CardThemeData().copyWith(
          //color: kColorScheme.onSurface,
          color: const Color.fromARGB(255, 228, 181, 42),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.onPrimary,
            foregroundColor: kColorScheme.onSecondary,
          ),
        ),
        textTheme: TextTheme().copyWith(
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            //color: kColorScheme.onSurfaceVariant,
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStateProperty.all(kColorScheme.primaryContainer),
          ),
        ),
        iconTheme: IconThemeData().copyWith(
          color: kColorScheme.onPrimaryContainer,
        ),
      ),
      // themeMode: ThemeMode.system,
    ),
  );
}
