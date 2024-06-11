import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:listview/contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('ListView')),
        backgroundColor: Colors.indigo.shade100,
        body: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    List<Contact> contacts = buildContacts();

    for (int i = 0; i < 20; i++) {
      contacts.addAll(buildContacts());
    }

    return SizedBox(
      width: sizeX,
      height: sizeY,
      child: ListView.separated(
          itemBuilder: (context, index) => showContacts(contacts[index]),
          separatorBuilder: (context, index) => createSeparator(index),
          itemCount: contacts.length),
    );
  }
}

Widget showContacts(Contact contact) {
  ListTile box = ListTile(
    title: Text(contact.name),
    subtitle: Text(contact.subTitle),
    leading: CircleAvatar(
      backgroundColor: Colors.amber.shade400,
      child: Icon(contact.icon),
    ),
    trailing: const Icon(Icons.keyboard_arrow_right),
    onTap: () => true,
  );

  return box;
}

List<Contact> buildContacts() {
  List<Contact> contacts = [];
  contacts.add(Contact('빌보 베긴스', '호빗', Icons.sentiment_dissatisfied));
  contacts.add(Contact('간달프', '반지의 제왕', Icons.sentiment_neutral_sharp));
  contacts.add(Contact('론', '해리포터', Icons.sentiment_satisfied_alt));
  contacts.add(Contact('뉴트 스캐맨더', '판타스틱 비스트', Icons.sentiment_very_satisfied));
  contacts
      .add(Contact('아슬란', '나니아연대기', Icons.sentiment_very_satisfied_outlined));

  return contacts;
}

Widget createSingleBox(int position) {
  List colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue
  ];

  Container box = Container(
    color: colors[position % colors.length],
    width: 100,
    height: 100,
    child: Text(position.toString()),
  );

  return box;
}

Widget createSeparator(int position) {
  Widget separator = Container(
    height: 2.5,
    color: Colors.amber.shade400,
  );

  return separator;
}

List<Widget> createBox(int numBox) {
  int i = 0;
  List colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue
  ];
  List<Widget> boxList = [];

  while (i < numBox) {
    Container box = Container(
      color: colors[i % colors.length],
      width: 100,
      height: 100,
      alignment: Alignment.center,
      child: Text(i.toString()),
    );

    i++;
    boxList.add(box);
  }

  return boxList;
}
