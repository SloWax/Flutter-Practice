# PopupMenuButton / DefaultTabController

## PopupMenuButton
<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/981efbf6-237e-4792-a1cc-e69a6906ca0a">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/7f46f298-3fca-4a5f-9798-435ea554412a">
</p>

```
enum PopupMenu {
  zero('zero', '0'),
  first('first', '1'),
  twice('twice', '2'),
  third('third', '3'),
  fourth('fourth', '4');

  final String title;
  final String image;
  const PopupMenu(this.title, this.image);
}

class PopupMenuWidget extends StatelessWidget {
  const PopupMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PopupMenu>(
      icon: const Icon(Icons.image),
      itemBuilder: (BuildContext context) {
        return [
          for (final value in PopupMenu.values)
            PopupMenuItem(value: value, child: Text(value.title))
        ];
      },
      onSelected: (value) => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ImageViewer(value.image)))
      },
    );
  }
}
```

## DefaultTabController

<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/b53bdbda-64c3-4450-b2ef-d46f4e034c98">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/cc8a68f5-ab5f-40b0-b715-13702702ef56">
</p>

```
class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
              title: const Text('Popup/TopBar'),
              actions: const [PopupMenuWidget()],
              bottom: TabBar(tabs: [
                Tab(
                    icon: const Icon(Icons.car_repair),
                    text: PopupMenu.zero.name),
                Tab(
                    icon: const Icon(Icons.car_repair),
                    text: PopupMenu.first.name),
                Tab(
                    icon: const Icon(Icons.car_repair),
                    text: PopupMenu.twice.name),
                Tab(
                    icon: const Icon(Icons.car_repair),
                    text: PopupMenu.third.name),
                Tab(
                    icon: const Icon(Icons.car_repair),
                    text: PopupMenu.fourth.name),
              ])),
          body: TabBarView(
            children: [
              Container(
                  decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/0.jpeg')),
              )),
              Container(
                  decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/1.jpeg')),
              )),
              Container(
                  decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/2.jpeg')),
              )),
              Container(
                  decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/3.jpeg')),
              )),
              Container(
                  decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/4.jpeg')),
              )),
            ],
          ),
        ));
  }
}
```