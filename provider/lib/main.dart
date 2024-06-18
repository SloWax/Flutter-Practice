import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const List<String> urls = [
  "https://cdn.pixabay.com/photo/2017/06/29/13/29/pug-2454270_1280.jpg",
  "https://cdn.pixabay.com/photo/2014/09/19/21/47/chihuahua-453063_1280.jpg",
  "https://cdn.pixabay.com/photo/2015/06/15/23/56/chihuahua-810789_1280.jpg",
  "https://cdn.pixabay.com/photo/2019/04/02/16/11/cat-4098058_1280.jpg"
];

class PhotoState {
  String url;
  bool selected;
  bool display;
  Set<String> tags = {};

  PhotoState(this.url, {this.selected = false, this.display = true});
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isTaggingMod = false;
  List<PhotoState> photoStates = List.of(urls.map((url) => PhotoState(url)));
  Set<String> tags = {'all', 'dog', 'cat'};

  void toggleTagging(url) {
    setState(() {
      isTaggingMod = !isTaggingMod;
      for (var element in photoStates) {
        bool isSelected = (isTaggingMod && element.url == url);
        element.selected = isSelected;
        //   if (isTaggingMod && element.url == url) {
        //     element.selected = true;
        //   } else {
        //     element.selected = false;
        //   }
      }
    });
  }

  void selectTag(String tag) {
    setState(() {
      if (isTaggingMod) {
        if (tag != 'all') {
          for (var element in photoStates) {
            if (element.selected) {
              element.tags.add(tag);
            }
          }
          toggleTagging(null);
        }
      } else {
        for (var element in photoStates) {
          element.display = tag == 'all' ? true : element.tags.contains(tag);
        }
      }
    });
  }

  void onPhotoSelect(String url, bool selected) {
    setState(() {
      for (var element in photoStates) {
        if (element.url == url) {
          element.selected = selected;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo',
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        colorSchemeSeed: Colors.blueGrey,
        useMaterial3: true,
      ),
      home: Gallery(
        title: 'Gallery',
        photoStates: photoStates,
        tags: tags,
        onPhotoSelect: onPhotoSelect,
        toggleTagging: toggleTagging,
        selectTag: selectTag,
        isTaggingMod: isTaggingMod,
      ),
    );
  }
}

class Gallery extends StatelessWidget {
  final String title;
  final List<PhotoState> photoStates;
  final bool isTaggingMod;
  final Set<String> tags;

  final Function toggleTagging;
  final Function onPhotoSelect;
  final Function selectTag;

  const Gallery(
      {super.key,
      required this.title,
      required this.photoStates,
      required this.isTaggingMod,
      required this.tags,
      required this.toggleTagging,
      required this.onPhotoSelect,
      required this.selectTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            padding: const EdgeInsets.all(5),
            children: List.of(
              photoStates.where((ps) => ps.display).map((ps) => Photo(
                  state: ps,
                  selectable: isTaggingMod,
                  onLongPress: toggleTagging,
                  onSelect: onPhotoSelect)),
            )),
        drawer: Drawer(
          child: ListView(
            children: List.of(tags.map((t) => ListTile(
                  title: Text(t),
                  onTap: () {
                    selectTag(t);
                    Navigator.of(context).pop();
                  },
                ))),
          ),
        ));
  }
}

class Photo extends StatelessWidget {
  final PhotoState state;
  final bool selectable;

  final Function onLongPress;
  final Function onSelect;

  const Photo(
      {super.key,
      required this.state,
      required this.selectable,
      required this.onLongPress,
      required this.onSelect});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      GestureDetector(
        child: Image.network(state.url),
        onLongPress: () => onLongPress(null),
      )
    ];

    if (selectable) {
      children.add(Positioned(
          left: 0,
          top: 0,
          child: Checkbox(
            onChanged: (value) {
              onSelect(state.url, value);
            },
            value: state.selected,
            activeColor: Colors.white,
            checkColor: Colors.black45,
          )));
    }
    return Container(
      child: Stack(
        alignment: Alignment.topLeft,
        children: children,
      ),
    );
  }
}
