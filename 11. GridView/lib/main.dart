import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView',
      home: Scaffold(
        appBar: AppBar(title: const Text('GridView')),
        backgroundColor: Colors.grey.shade300,
        body: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return SizedBox(
      width: sizeX,
      height: sizeY,
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        padding: const EdgeInsets.all(5),
        children: createGallery(50),
      ),
    );
  }
}

List<Widget> createGallery(int numImg) {
  List<Widget> images = [];
  List<String> urls = [
    'assets/1.jpeg',
    'assets/2.png',
    'assets/3.jpeg',
    'assets/4.jpg',
  ];

  Widget image;
  int i = 0;
  while (i < numImg) {
    image = Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(urls[i % urls.length]))),
    );
    images.add(image);
    i++;
  }

  return images;
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
    Container box = Container(
      color: colors[i % colors.length],
      width: 100,
      height: 100,
      child: Center(child: Text(i.toString())),
    );

    i++;
    boxList.add(box);
  }

  return boxList;
}
