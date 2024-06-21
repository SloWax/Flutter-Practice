import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providergallery/model.dart';
import 'package:providergallery/view_model.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => AppState(), child: const App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Photo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          unselectedWidgetColor: Colors.grey,
        ),
        home: const Gallery(title: 'Gallery'));
  }
}

class Gallery extends StatelessWidget {
  final String title;

  const Gallery({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          padding: const EdgeInsets.all(5.0),
          children: List.of(context
              .watch<AppState>()
              .photoStates
              .where((ps) => ps.display)
              .map((ps) => Photo(state: ps)))),
      drawer: Drawer(
          child: ListView(
        children: List.of(context.watch<AppState>().tags.map((t) => ListTile(
              title: Text(t),
              onTap: () {
                context.read<AppState>().selectTag(t);
                Navigator.of(context).pop();
              },
            ))),
      )),
    );
  }
}

class Photo extends StatelessWidget {
  final PhotoState state;

  const Photo({required this.state});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      GestureDetector(
        child: Image.network(state.url),
        onLongPress: () => context.read<AppState>().toggleTagging(state.url),
      )
    ];

    if (context.watch<AppState>().isTaggingMod) {
      children.add(Positioned(
        left: 0,
        top: 0,
        child: Checkbox(
          onChanged: (value) {
            context.read<AppState>().onPhotoSelect(state.url, value ?? false);
          },
          value: state.selected,
          activeColor: Colors.white,
          checkColor: Colors.black45,
        ),
      ));
    }

    return Container(
        child: Stack(
      alignment: Alignment.topLeft,
      children: children,
    ));
  }
}
