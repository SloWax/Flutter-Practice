# provider

<p align="center">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/8e0a5a14-8abf-4376-b0dd-0942db05a2a8">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/5e8af58f-e1dd-45a8-a422-43c388a15cf7">
<img width="200" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/f14cb8dc-1786-4c49-a211-93fe58438212">
</p>

## ViewModel
```
class AppState with ChangeNotifier {
  bool isTaggingMod = false;
  List<PhotoState> photoStates = List.of(urls.map((url) => PhotoState(url)));
  Set<String> tags = {"all", "dog", "cat"};

  void toggleTagging(url) {
    isTaggingMod = !isTaggingMod;
    for (var element in photoStates) {
      if (isTaggingMod && element.url == url) {
        element.selected = true;
      } else {
        element.selected = false;
      }
    }
    notifyListeners();
  }

  void selectTag(String tag) {
    if (isTaggingMod) {
      if (tag != "all") {
        for (var element in photoStates) {
          if (element.selected) {
            element.tags.add(tag);
          }
        }
        toggleTagging(null);
      }
    } else {
      for (var element in photoStates) {
        element.display = tag == "all" ? true : element.tags.contains(tag);
      }
    }
    notifyListeners();
  }

  void onPhotoSelect(String url, bool selected) {
    for (var element in photoStates) {
      if (element.url == url) {
        element.selected = selected;
      }
    }
    notifyListeners();
  }
}
```

## View
```
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
```