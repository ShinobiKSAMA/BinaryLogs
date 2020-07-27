import 'package:flutter/material.dart';
import 'package:binarylogs/navscreen.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Color dark = Color(0xFF293556);
  Color light = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BinaryLogs',
      debugShowCheckedModeBanner: false,

      //Bright Theme
      theme: ThemeData(
        primaryColor: light,
        brightness: Brightness.light,
        scaffoldBackgroundColor: light,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: light,
          foregroundColor: dark,
        ),
      ),

      //Dark Theme
      darkTheme: ThemeData(
        primaryColor: dark,
        scaffoldBackgroundColor: dark,
        brightness: Brightness.dark,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: dark,
          foregroundColor: light,
        ),
      ),

      themeMode: DateTime.now().hour >= 19 || DateTime.now().hour <= 07 ? ThemeMode.dark : ThemeMode.light,
      home: Nav(authName: "Aditya Mhatre",),
    );
  }
}