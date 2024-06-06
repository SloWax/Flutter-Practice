import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Row and Column',
        home: Scaffold(
          appBar: AppBar(title: const Text('Row, Column')),
          backgroundColor: Colors.indigo.shade100,
          body: const RowColumn(),
        ));
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
      child: Row(
        verticalDirection: VerticalDirection.up,
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: createBox(5),
      ),
    );
  }
}

List<Widget> createBox(int numBox) {
  int i = 0;
  List<Widget> boxList = [];
  List randomColor = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.cyan
  ];

  while (i < numBox) {
    Expanded box = Expanded(
        child: Container(
            color: randomColor[i],
            // width: 50,
            // height: 50,
            child: Text(i.toString())));
    i++;
    boxList.add(box);
  }

  return boxList;
}
