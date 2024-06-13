# Hero

<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/37491c73-ef3e-4545-91b8-2afe72d5d12d">
</p>

```
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HeroDemo',
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        colorSchemeSeed: Colors.blueGrey,
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: const Text('Hero')),
        body: Row(
          children: [
            GestureDetector(
              child: buildHeroIcon(width / 4, ImageRoute.first),
              onTap: () {
                changeRoute(context, ImageRoute.first);
              },
            ),
            GestureDetector(
              child: buildHeroIcon(width / 4, ImageRoute.twice),
              onTap: () {
                changeRoute(context, ImageRoute.twice);
              },
            ),
            GestureDetector(
              child: buildHeroIcon(width / 4, ImageRoute.third),
              onTap: () {
                changeRoute(context, ImageRoute.third);
              },
            ),
            GestureDetector(
              child: buildHeroIcon(width / 4, ImageRoute.fourth),
              onTap: () {
                changeRoute(context, ImageRoute.fourth);
              },
            )
          ],
        ));
  }
}

Widget buildHeroIcon(double size, ImageRoute route) {
  return Hero(
      tag: route.tag,
      child: SizedBox(
        width: size,
        height: size,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/${route.path}.jpeg')))),
      ));
}

void changeRoute(BuildContext context, ImageRoute route) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ImageViewer(route)));
}
```

```
enum ImageRoute {
  first('1', 'bmw'),
  twice('2', 'kia'),
  third('3', 'mazda'),
  fourth('4', 'lexus');

  final String path;
  final String tag;
  const ImageRoute(this.path, this.tag);
}

class ImageViewer extends StatelessWidget {
  final ImageRoute route;

  const ImageViewer(this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(route.tag),
        ),
        body: Center(
          child: Hero(
              tag: route.tag,
              child: SizedBox(
                width: size,
                height: size,
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/${route.path}.jpeg')))),
              )),
        ));
  }
}
```