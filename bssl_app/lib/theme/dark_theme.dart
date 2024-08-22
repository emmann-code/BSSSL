import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Color(0xFF121212), // For the overall background
    primary: Color(0xFFE0E0E0), // For text color (e.g., "Staff Advance Request" text)
    secondary: Color(0xFF1F1F1F), // For card and background areas
    tertiary: Color(0xFF2E2E2E), // For input fields and borders
    inversePrimary: Colors.white, // For icon colors (e.g., menu and profile picture)
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E), // AppBar background
    iconTheme: IconThemeData(color: Colors.white),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF3A3A3A), // For "Save as Draft" and "Send for further processing" buttons
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(Color(0xFFE0E0E0)),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white), // Default text (was bodyText1)
    bodyMedium: TextStyle(color: Colors.white70), // Secondary text (was bodyText2)
    headlineSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Title text
  ),
  iconTheme: IconThemeData(color: Colors.white),
);
