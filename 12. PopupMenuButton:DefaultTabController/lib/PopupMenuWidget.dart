import 'package:flutter/material.dart';
import 'package:popupmenubutton/ImageViewer.dart';

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
