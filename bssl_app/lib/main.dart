// ignore_for_file: prefer_const_constructors

import 'package:bssl_app/auth/login_or_register.dart';
import 'package:bssl_app/pages/home_page.dart';
import 'package:bssl_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData,
      // home: LoginOrRegister(), // Choose the appropriate home widget
      home: HomePage(),
      // home: MyApiButton(),
      // home: TestApi(),
    );
  }
}
