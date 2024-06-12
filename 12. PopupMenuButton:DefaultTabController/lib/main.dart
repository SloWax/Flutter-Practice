import 'package:flutter/material.dart';
import 'package:popupmenubutton/Intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Popup/TopBar',
        theme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          colorSchemeSeed: Colors.blueGrey,
          useMaterial3: true,
        ),
        home: const Intro());
  }
}
