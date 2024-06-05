import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const _image());
}

class _container extends StatelessWidget {
  const _container({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container',
      home: Scaffold(
          appBar: AppBar(title: const Text('Container Layout')),
          body: Container(
            margin: EdgeInsets.all(50),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(30))),
          )),
    );
  }
}

class _gradient extends StatelessWidget {
  const _gradient({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gradient',
      home: Scaffold(
          appBar: AppBar(title: const Text('Container Layout')),
          body: Container(
            margin: const EdgeInsets.all(50),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blueGrey, Colors.white])),
          )),
    );
  }
}

class _image extends StatelessWidget {
  const _image({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image',
      home: Scaffold(
          appBar: AppBar(title: const Text('Container Layout')),
          body: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://openclipart.org/image/800px/247485'),
                        fit: BoxFit.contain)),
              ))),
    );
  }
}
