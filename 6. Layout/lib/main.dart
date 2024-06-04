import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            appBarTheme: AppBarTheme(backgroundColor: Colors.redAccent),
            colorSchemeSeed: Colors.blueGrey,
            useMaterial3: true,
            textTheme: const TextTheme(
                titleLarge: TextStyle(fontSize: 12),
                bodyMedium:
                    TextStyle(fontSize: 32, fontStyle: FontStyle.italic))),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Layout'),
          ),
          body: const Center(
            child: Text(
              '레이아웃 잡아보기',
              style: TextStyle(fontSize: 24),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              print('눌림');
            },
          ),
          persistentFooterButtons: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add_a_photo)),
            IconButton(onPressed: () {}, icon: Icon(Icons.add_alarm)),
            IconButton(onPressed: () {}, icon: Icon(Icons.add_comment))
          ],
        ));
  }
}
