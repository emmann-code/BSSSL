// ignore_for_file: prefer_const_constructors

import 'package:bssl_app/api_button.dart';
import 'package:bssl_app/components/my_drawer.dart';
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
      home: HomePage(),
      // home: MyButton(),
    );
  }
}
