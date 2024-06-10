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
        children: showChickenLayout(sizeX, sizeY),
      ),
    );
  }
}

List<Widget> showChickenLayout(double sizeX, double sizeY) {
  List<Widget> layoutChildren = <Widget>[];
  Container background = Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/20240522501170.jpg'),
            fit: BoxFit.fitHeight)),
  );

  layoutChildren.add(background);

  Positioned chickenCard = Positioned(
    top: sizeY / 20,
    left: sizeX / 20,
    right: sizeX / 20,
    child: Card(
      elevation: 12,
      color: Colors.white70,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Column(
        children: [
          Text(
            '치킨데이',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text('오늘은 치킨이닼 치킨먹는닼'),
          )
        ],
      ),
    ),
  );

  layoutChildren.add(chickenCard);

  Positioned btnOrder = Positioned(
      bottom: sizeY / 20,
      left: sizeX / 20,
      right: sizeX / 20,
      child: ElevatedButton(
        child: const Text(
          '주문하기',
          style: TextStyle(fontSize: 24),
        ),
        onPressed: () {},
      ));

  layoutChildren.add(btnOrder);

  return layoutChildren;
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
