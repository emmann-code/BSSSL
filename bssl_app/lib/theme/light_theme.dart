import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade200,
    // background: Colors.grey.shade800,
    primary: Colors.grey.shade800, // For text color (e.g., "Staff Advance Request" text)
    secondary: Colors.white, // For card and background areas
    tertiary: Colors.grey.shade300, // For input fields and borders
    inversePrimary: Colors.black, // For icon colors (e.g., menu and profile picture)
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade300, // AppBar background
    iconTheme: IconThemeData(color: Colors.grey.shade800),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.grey.shade500, // For "Save as Draft" and "Send for further processing" buttons
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(Colors.grey.shade800),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.grey.shade800), // Default text (was bodyText1)
    bodyMedium: TextStyle(color: Colors.grey.shade800), // Secondary text (was bodyText2)
    headlineSmall: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold), // Title text
  ),
  iconTheme: IconThemeData(color: Colors.grey.shade800),
);
