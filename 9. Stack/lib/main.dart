import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stack',
      home: Scaffold(
        appBar: AppBar(title: const Text('스택 레이아웃')),
        backgroundColor: Colors.indigo.shade100,
        body: const RowColumn(),
      ),
    );
  }
}

class RowColumn extends StatelessWidget {
  const RowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
      child: Stack(
        // fit: StackFit.expand,
        children: createBox(5),
      ),
    );
  }
}

List<Widget> createBox(int numBox) {
  int i = 0;
  List<Widget> boxList = [];
  List colors = [
    Colors.amberAccent,
    Colors.deepOrangeAccent,
    Colors.deepPurple,
    Colors.lightGreen,
    Colors.lightBlue
  ];

  while (i < numBox) {
    Positioned box = Positioned(
        top: 100 + i.toDouble() * 100,
        left: 25 + i.toDouble() * 25,
        child: Container(
          color: colors[i % colors.length],
          width: 50 * (numBox.toDouble() - i),
          height: 50 * (numBox.toDouble() - i),
          alignment: Alignment.topLeft,
          child: Text(i.toString()),
        ));

    i++;
    boxList.add(box);
  }

  return boxList;
}
