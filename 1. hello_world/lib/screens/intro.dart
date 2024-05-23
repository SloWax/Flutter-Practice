import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.black45),
                child: const Text("Envy's Flutter",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 21, color: Colors.white))),
            )),
      );
  }
}