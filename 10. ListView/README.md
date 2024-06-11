# listview

## vertical

<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/d285f415-1a57-45fe-918f-d38c9407c2c7">
</p>

```
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return SizedBox(
      width: sizeX,
      height: sizeY,
      child: ListView(
        children: createBox(25),
      ),
    );
  }
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
      height: 100,
      alignment: Alignment.center,
      child: Text(i.toString()),
    );

    i++;
    boxList.add(box);
  }

  return boxList;
}
```

## horizontal

<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/15a88e7e-50d8-4304-87ff-07d6e1bf2d4c">
</p>

```
child: ListView(
   children: createBox(25),
   scrollDirection: Axis.horizontal,
)
```

## separator
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/82e66cd4-8651-460d-a216-d801d2da515a">
</p>

```
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return SizedBox(
      width: sizeX,
      height: sizeY,
      child: ListView.separated(
          itemBuilder: (context, index) => createSingleBox(index),
          separatorBuilder: (context, index) => createSeparator(index),
          itemCount: 25),
    );
  }
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
    height: 10,
    color: Colors.black,
  );

  return separator;
}
```

## Practice 연락처 리스트 만들기
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/dded848c-8bb1-4c19-81be-7f4e4b60f600">
</p>

```
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
  contacts.add(Contact('아슬란', '나니아연대기', Icons.sentiment_very_satisfied_outlined));

  return contacts;
}
```