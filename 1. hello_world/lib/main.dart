import 'package:flutter/material.dart';

void main() {
  runApp(const HelloWorld());
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello Wolrd'),
          backgroundColor: Colors.blue),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Android_vs_iOS.png'),
                fit: BoxFit.contain)),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(14),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.black45),
                child: const Text("Envy's Flutter",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 21, color: Colors.white))),
            )),
      )
    );
  }
}
