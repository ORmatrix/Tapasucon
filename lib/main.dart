import 'package:flutter/material.dart';
import 'package:tapasucon/main/MainDashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAPASUCON 2025',
      theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),

      home: MainDashboard(),
      // home: HomeScreen(),
    );
  }
}

